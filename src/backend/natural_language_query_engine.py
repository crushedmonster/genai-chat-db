import re
import json
import sqlparse
from decimal import Decimal
from openai import AzureOpenAI

from backend.config import SETTINGS
from backend.search_router import SearchRouter
from backend.utils.database_helper import DatabaseConnector
from backend.utils.prompt_loader import PromptLoader

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
            raise RuntimeError(error_msg)

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
            temperature=0.3,
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
        if not query or query.strip() == "":
            print("Empty query provided. Execution skipped.")
            return None

        # Parse and validate the SQL command
        try:
            parsed = sqlparse.parse(query)
            if not parsed:
                print("Invalid SQL query provided.")
                return None
                
            statement = parsed[0]
            if statement.get_type() != 'SELECT':
                print("Only SELECT queries are allowed. Query execution skipped.")
                return None
        except Exception as e:
            print(f"Error parsing SQL query: {e}")
            return None

        # Safe to proceed with execution
        conn = DatabaseConnector.connect_to_db(SETTINGS.sql_connection_string)
        cursor = conn.cursor()
        try:
            cursor.execute(query)
            columns = [column[0] for column in cursor.description]
            rows = cursor.fetchall()
            # Convert Decimal values to float
            result = [
                {col: float(val) if isinstance(val, Decimal) else val for col, val in zip(columns, row)}
                for row in rows
            ]
            print(f"Query executed successfully. Rows fetched: {len(result)}")
            return result
        except Exception as e:
            print(f"Error executing query: {e}")
        finally:
            cursor.close()
            conn.close()

        return result

    def get_summary(
        self, 
        user_question: str, 
        results: list[dict], 
        sql_query: str, 
        message: str, 
        n_unique_value: int
    ) -> str:
        """
        Generate a data summary based on query results.

        Args:
            user_question (str): The user's input question.
            results (list[dict]): The SQL query results.
            sql_query: The executed SQL query.
            message: Additional explanatory message.
            n_unique_value: Number of unique sample values to include.

        Returns:
            str: Generated summary.
        """
        # Generate statistics for results
        col_summary_stats = self.get_column_statistics(results, n_unique_value)
        row_summary_stats = self.get_row_statistics(results)

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

    def get_column_statistics(self, rows: list[dict], n_unique_value: int) -> dict:
        """Generate per-column summary statistics.
        
        Args:
            rows: Query result rows.
            n_unique_value: Number of unique sample values to include.
            
        Returns:
            dict: Dictionary of column statistics.
        """
        if not rows:
            return {}

        column_stats = {}
        columns = rows[0].keys()

        # Group data by column
        data_by_column = {col: [] for col in columns}
        for row in rows:
            for col in columns:
                data_by_column[col].append(row.get(col))
                
        # Analyse each column
        for col, values in data_by_column.items():
            non_null_values = [v for v in values if v is not None]
            if not non_null_values:
                column_stats[col] = {"data_type": "", "sample_values": []}
                continue
                
            # Get unique sample values
            unique_values = list({v for v in non_null_values})
            sample_values = unique_values[:n_unique_value]
            
            stats = {
                "sample_values": sample_values,
                "data_type": type(non_null_values[0]).__name__
            }
            
            # Check if this is an ID column (contains 'id' or all values are unique)
            is_id_column = ('id' in col.lower() or 
                           len(set(non_null_values)) == len(non_null_values))
            
            # Calculate numeric statistics if appropriate
            if not is_id_column and all(isinstance(v, (int, float)) for v in non_null_values):
                stats.update({
                    "min": min(non_null_values),
                    "max": max(non_null_values),
                    "avg": round(sum(non_null_values) / len(non_null_values), 2)
                })
            elif is_id_column:
                stats.update({"aggregation": "skipped"})
                
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
