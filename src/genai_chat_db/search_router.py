from azure.core.credentials import AzureKeyCredential
from azure.search.documents import SearchClient
from azure.search.documents.indexes import SearchIndexClient

from genai_chat_db.utils.prompt_loader import PromptLoader


class SearchRouter:
    """
    Search indexed metadata and database relationships.
    """
    def __init__(self, azure_openai_client, settings):
        self.azure_openai_client = azure_openai_client
        self.settings = settings

    def retrieve_table_names(self, user_question: str) -> list:
        """
        Retrieve a list of relevant table names based on the user's question.

        This function uses an Azure OpenAI model to analyze the user's input and predict
        the database tables that are relevant. It sends a system prompt and a formatted 
        user prompt to the model, then processes the model's response into a clean list
        of table names.

        Args:
            user_question (str): The user's natural language question.

        Returns:
            list: A list of relevant table names.
        """
        system_prompt = PromptLoader.load_prompt("retrieve_metadata_system_prompt.txt")
        user_template = PromptLoader.load_prompt("retrieve_metadata_user_prompt.txt")
        user_prompt = PromptLoader.format_prompt(user_template, user_question=user_question)

        response = self.azure_openai_client.chat.completions.create(
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt}
            ],
            temperature=0.0,
            model=self.settings.azure_deployment_model,
        )

        content = response.choices[0].message.content.strip()
        table_names = [idx.strip() for idx in content.split(",") if idx.strip()]

        return table_names
    
    def get_index_fields(self, index_name) -> list:
        """
        Retrieve the list of field names for the given Azure Search index.
        
        Args:
            index_name (str): The name of the Azure Search index.

        Returns:
            list: A list containing the names of the fields in the index.
        """
        index_client = SearchIndexClient(
            endpoint=self.settings.azure_search_endpoint,
            credential=AzureKeyCredential(self.settings.azure_search_key)
        )
        index_schema = index_client.get_index(index_name)

        fields = [
            field.name for field in index_schema.fields
            ]
        return fields
    
    def search_relationships_index(self, user_question: str) -> str:
        """
        Perform a search on Azure Search Service and return the 
        table relationships in a readable format.

        Args:
            user_question (str): The user's natural language question.

        Returns:
            str: A formatted string that details table relationships, 
            or an empty string if no results are found.
        """
        context = ""
        table_names = self.retrieve_table_names(user_question)

        if table_names:
            search_client = SearchClient(
                endpoint=self.settings.azure_search_endpoint,
                index_name="sample-relationships-index",
                credential=AzureKeyCredential(self.settings.azure_search_key)
            )

            relationship_lines = ["Table Relationships:"]

            for table_name in table_names:
                search_results = search_client.search(table_name)

                for result in search_results:
                    parent_table = result.get("parent_table", "")
                    parent_column = result.get("parent_column", "")
                    referenced_table = result.get("referenced_table", "")
                    referenced_column = result.get("referenced_column", "")

                    if parent_table and parent_column and referenced_table and referenced_column:
                        relationship_lines.append(
                            f"- {parent_table}.{parent_column} -> {referenced_table}.{referenced_column}"
                        )

            context = "\n".join(relationship_lines)

        return context


    def search_metadata_index(self, user_question: str) -> str:
        """
        Search the Azure Search Service for metadata and return it
        in a formatted output.

        Args:
            user_question (str): The user's natural language question.

        Returns:
            str: A formatted string containing the metadata for the relevant tables, 
            or an empty string if no results are found.
        """
        context = ""
        table_names = self.retrieve_table_names(user_question)
        grouped_metadata = {}

        if table_names:
            search_client = SearchClient(
                endpoint=self.settings.azure_search_endpoint,
                index_name="sample-metadata-index",
                credential=AzureKeyCredential(self.settings.azure_search_key)
            )

            for table_name in table_names:
                search_results = search_client.search(table_name)

                for result_item in search_results:
                    # Extract fields
                    schema = result_item.get("schema", "")
                    table = result_item.get("table", "")
                    column = result_item.get("column", "")
                    data_type = result_item.get("data_type", "")
                    sample_values = result_item.get("sample_values", [])

                    # Check if schema, table, and column are available
                    if schema and table and column:
                        key = (schema, table)

                        # Add the key if it's not already in the dictionary
                        if key not in grouped_metadata:
                            grouped_metadata[key] = []

                        # Format column entry with sample values if available
                        column_entry = f"{column} ({data_type})"
                        if sample_values:
                            samples_text = ", ".join(map(str, sample_values))
                            column_entry += f" [Sample values: {samples_text}]"
                        
                        grouped_metadata[key].append(column_entry)
            
            context = self._format_metadata(grouped_metadata)
            
        return context

    def _format_metadata(self, grouped_metadata: dict) -> str:
        """
        Helper function to format the grouped metadata into a readable string.

        Args:
            grouped_metadata (dict): The grouped metadata.

        Returns:
            str: A formatted string representing the metadata.
        """
        output_lines = []
        for (schema, table), columns in grouped_metadata.items():
            output_lines.append(f"Schema: {schema}")
            output_lines.append(f"Table: {table}")
            output_lines.append("Columns:")
            for column_entry in columns:
                output_lines.append(f"  - {column_entry}")
            output_lines.append("")
        return "\n".join(output_lines)
