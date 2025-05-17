"""
Configuration module for the application.
"""
import os
from dotenv import load_dotenv

# Load .env file if it exists
load_dotenv()

class Settings:
    """
    Settings for the application.
    """
    # Azure OpenAI settings
    azure_openai_endpoint: str = os.getenv("AZURE_OPENAI_ENDPOINT")
    azure_openai_key: str = os.getenv("AZURE_OPENAI_KEY")
    azure_deployment_model: str = os.getenv("AZURE_DEPLOYMENT_MODEL")
    azure_deployment_model_api_version: str = os.getenv("AZURE_DEPLOYMENT_MODEL_API_VERSION")

    # Database settings
    sql_driver: str = "{ODBC Driver 18 for SQL Server}"
    sql_connection_string: str = f'Driver={sql_driver};Server=tcp:{os.getenv("SQL_SERVER")},' \
                                f'{os.getenv("SQL_PORT")};Database={os.getenv("SQL_DATABASE")};' \
                                f'Uid={os.getenv("SQL_USERNAME")};Pwd={os.getenv("SQL_PASSWORD")};'

    # Azure Search settings
    azure_search_endpoint: str = os.getenv("AZURE_SEARCH_ENDPOINT")
    azure_search_key: str = os.getenv("AZURE_SEARCH_KEY")

    # Security settings
    ## Define sensitive data patterns and terms
    sensitive_pii_columns = {
        'PasswordHash', 'PasswordSalt', 'EmailAddress', 'Phone'
    }
    ## SQL injection patterns
    sql_injection_patterns = [
        r';\s*(\w+)',  # Multiple statements (although already handled by sqlparse)
        r'--',  # Comment indicators
        r'\bUNION\b[\s\S]*?\bSELECT\b', # UNION injections
        r'OR\s+1\s*=\s*1',  # Tautology attack
        r'OR\s+\'1\'\s*=\s*\'1\'',
        r'OR\s+\"1\"\s*=\s*\"1\"',
        r'WHERE\s+1\s*=\s*1',  # WHERE 1=1 specifically (full-table scan)
    ]

# Instantiate Settings
SETTINGS = Settings()
