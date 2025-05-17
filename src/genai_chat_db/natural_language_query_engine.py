import re
import json
from decimal import Decimal
from openai import AzureOpenAI

from genai_chat_db.config import SETTINGS
from genai_chat_db.search_router import SearchRouter
from genai_chat_db.utils.database_helper import DatabaseConnector
from genai_chat_db.utils.prompt_loader import PromptLoader
from genai_chat_db.utils.database_security import DatabaseSecurityGuardrails

class NaturalLanguageQueryEngine:
    """
    Service to handle natural language queries to a database using
    Azure Search for context and Azure OpenAI for SQL generation.
    """
    def __init__(self):
        """
        Initialise the NaturalLanguageQueryEngine with required clients.
        """
        self.openai_client = self._configure_azure_openai_client()

    def _configure_azure_openai_client(self) -> AzureOpenAI:
        """
        Configure and return an Azure OpenAI client.
        
        Returns:
            AzureOpenAI: Configured OpenAI client
            
        Raises:
            RuntimeError: If client configuration fails
        """
        try:
            return AzureOpenAI(
                api_version= SETTINGS.azure_deployment_model_api_version,
                azure_endpoint=SETTINGS.azure_openai_endpoint,
                api_key=SETTINGS.azure_openai_key
            )
        except Exception as e:
            error_msg = f"Failed to configure Azure OpenAI client: {str(e)}"
            raise RuntimeError(error_msg) from e

    def prompt_sql_command(self, user_question: str) -> tuple[str, str]:
        """
        Use Azure Search and Azure OpenAI to generate an SQL command from a 
        natural language question.

        Args:
            user_question (str): The user's input question.

        Returns:
            tuple[str, str]: Generated SQL query and message.
        """
        # Use Azure Search to retrieve metadata info about the database
        search_router = SearchRouter(self.openai_client, SETTINGS)
        schema_info = search_router.search_metadata_index(user_question)
        # Use Azure Search to retrive table relationship info
        relation_info = search_router.search_relationships_index(user_question)

        # Prepare prompts
        system_template = PromptLoader.load_prompt("plaintext_to_sql_system_prompt.txt")
        system_prompt = PromptLoader.format_prompt(
            system_template,
            schema_info=schema_info,
            table_relationships=relation_info
        )

        user_template = PromptLoader.load_prompt("plaintext_to_sql_user_prompt.txt")
        user_prompt = PromptLoader.format_prompt(
            user_template,
            user_question=user_question
        )

        # Generate SQL query via LLM
        response = self.openai_client.chat.completions.create(
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt}
            ],
            temperature=0.2,
            model=SETTINGS.azure_deployment_model,
        )

        return self._parse_sql_response(response)

    def execute_sql_command(self, query: str) -> list[dict] | None:
        """
        Execute a SQL query safely, only allowing SELECT statements.

        Args:
            query (str): The SQL query to execute.

        Returns:
            list[dict] | None: Query results as a list of dictionaries, 
            or None if the query is invalid or not allowed.
        """
        # Validate the query against security guardrails
        is_valid, error_message = DatabaseSecurityGuardrails.validate_query(query)

        if not is_valid:
            print(error_message)
            return None, error_message

        conn = DatabaseConnector.connect_to_db(SETTINGS.sql_connection_string)
        cursor = conn.cursor()

        try:
            cursor.execute(query)
            columns = [column[0] for column in cursor.description]
            rows = cursor.fetchall()

            # Convert Decimal values to float
            result = [
                {
                    col: float(val) if isinstance(val, Decimal) else val
                    for col, val in zip(columns, row)
                }
                for row in rows
            ]

            # Mask sensitive data before returning results
            masked_results = DatabaseSecurityGuardrails.mask_sensitive_data(result)

            print(f"Query executed successfully. Rows fetched: {len(masked_results)}")
            return masked_results, None

        except Exception as e:
            print(f"Error executing query: {e}")
            return None, f"Error executing query: {e}"

        finally:
            cursor.close()
            conn.close()

    def get_summary(
        self,
        user_question: str,
        results: list[dict],
        sql_query: str,
        message: str
    ) -> str:
        """
        Generate a data summary based on query results.

        Args:
            user_question (str): The user's input question.
            results (list[dict]): The SQL query results.
            sql_query: The executed SQL query.
            message: Additional explanatory message.

        Returns:
            str: Generated summary.
        """
        # Generate statistics for results
        col_summary_stats = self.get_column_statistics(results)
        print(f"col_summary_stats: {col_summary_stats }")
        row_summary_stats = self.get_row_statistics(results)
        print(f"row_summary_stats: {row_summary_stats }")
        # Format prompt with all context
        template = PromptLoader.load_prompt("data_summary_prompt.txt")
        prompt = PromptLoader.format_prompt(
            template,
            user_question=user_question,
            sql_query=sql_query,
            row_summary_stats=row_summary_stats,
            col_summary_stats=col_summary_stats,
            message=message
        )

        # Generate summary via LLM
        response = self.openai_client.chat.completions.create(
            messages=[{"role": "system", "content": prompt}],
            temperature=0.0,  # Deterministic output
            model=SETTINGS.azure_deployment_model,
        )
        content = response.choices[0].message.content.strip()
        return content

    def get_row_statistics(self, rows: list[dict]) -> dict:
        """
        Generate basic row-level statistics.
        
        Args:
            rows: Query result rows.
            
        Returns:
            dict: Dictionary of row statistics.
        """
        if not rows:
            return {"total_rows": 0}
        return {"total_rows": len(rows)}

    def get_column_statistics(self, rows: list[dict]) -> dict:
        """Generate per-column summary statistics.
        
        Args:
            rows: Query result rows.
            
        Returns:
            dict: Dictionary of column statistics.
        """
        if not rows:
            return {}

        columns = rows[0].keys()
        data_by_column = {col: [row.get(col) for row in rows] for col in columns}
        categorical_cols = [
            col for col, values in data_by_column.items()
            if not col.lower().endswith('id') and not 
            all(isinstance(v, (int, float, type(None))) for v in values)
        ]

        column_stats = {}

        for col, values in data_by_column.items():
            non_null_values = [v for v in values if v is not None]
            data_type = type(non_null_values[0]).__name__ if non_null_values else ""

            stats = {"data_type": data_type}
            col_is_id = col.lower().endswith('id')
            is_numeric = all(isinstance(v, (int, float)) for v in non_null_values)

            if is_numeric and not col_is_id and non_null_values:
                min_value = min(non_null_values)
                max_value = max(non_null_values)
                avg_value = round(sum(non_null_values) / len(non_null_values), 2)

                min_rows_info = [
                    {k: row.get(k) for k in categorical_cols}
                    for row in rows if row.get(col) == min_value
                ]

                max_rows_info = [
                    {k: row.get(k) for k in categorical_cols}
                    for row in rows if row.get(col) == max_value
                ]

                stats.update({
                    "min": min_value,
                    "min_rows_info": min_rows_info,
                    "max": max_value,
                    "max_rows_info": max_rows_info,
                    "avg": avg_value
                })
            else:
                stats["aggregation"] = "skipped"

            column_stats[col] = stats

        return column_stats

    def _parse_sql_response(self, response) -> tuple[str, str]:
        """Parse the LLM response to extract SQL query and message.
        
        Args:
            response: The LLM response object
            
        Returns:
            tuple[str, str]: sql_query, message
        """
        content = response.choices[0].message.content.strip()
        print(content)

        try:
            result = json.loads(content)
        except json.JSONDecodeError:
            match = re.search(r'\{.*?\}', content, re.DOTALL)
            if not match:
                print("Error: LLM response is not valid JSON.")
                return "", "Failed to parse LLM output."

            try:
                result = json.loads(match.group(0))
            except json.JSONDecodeError:
                print("Error: Regex-extracted content is still not valid JSON.")
                return "", "Failed to parse LLM output."

        sql_query = result.get("GeneratedSQLQuery", "")
        message = result.get("Message", "")
        return sql_query, message
