"""
Exceptions used by the GenAI Chat DB application.
"""


class DatabaseAssistantError(Exception):
    """
    Base class for all exceptions raised by the database assistant.
    """


class DatabaseConnectionError(DatabaseAssistantError):
    """
    Raised when establishing a connection to the database fails.

    Examples:
    - Invalid connection string
    - Database server is unreachable
    - Authentication failure
    """


class PromptLoadingError(DatabaseAssistantError):
    """
    Raised when prompt files fail to load or contain errors.

    Scenarios:
    - Missing prompt files
    - Read/IO errors
    - Formatting errors in prompt templates
    """


class AzureOpenAIConfigurationError(DatabaseAssistantError):
    """
    Raised when there is a failure in configuring the Azure OpenAI client.

    Examples:
    - Invalid API key or endpoint
    - Missing deployment model settings
    - API version mismatch
    - Network/connectivity issues with Azure OpenAI
    """


class AzureSearchConfigurationError(DatabaseAssistantError):
    """
    Raised when there is a failure in configuring Azure Search services.

    Examples:
    - Invalid search service endpoint
    - Missing credentials
    - Network/connectivity issues with Azure Search
    """


class QueryExecutionError(DatabaseAssistantError):
    """
    Raised when executing a SQL query results in an error.

    Examples:
    - Database connection issues
    - Syntax errors in the SQL query
    - Runtime exceptions during query execution
    """
