import re
import sqlparse

from genai_chat_db.config import SETTINGS


class DatabaseSecurityGuardrails:
    """
    Security guardrails for database queries to prevent destructive operations,
    SQL injection, and ensure data compliance.
    """

    sensitive_pii_columns = SETTINGS.sensitive_pii_columns 
    sql_injection_patterns = SETTINGS.sql_injection_patterns

    @classmethod
    def validate_query(cls, query: str) -> tuple[bool, str | None]:
        """
        Validate a SQL query against security and privacy guardrails.
        """
        if not query or query.strip() == "":
            return False, "Empty query provided"
            
        # Check for destructive operations
        destructive_check = cls.check_for_destructive_operations(query)
        if not destructive_check[0]:
            return destructive_check
            
        # Check for SQL injection attempts
        injection_check = cls.check_for_sql_injection(query)
        if not injection_check[0]:
            return injection_check
            
        return True, None
    
    @classmethod
    def check_for_destructive_operations(cls, query: str) -> tuple[bool, str | None]:
        """
        Check if the query contains destructive SQL operations.
        """
        # Parse and validate the SQL command
        try:
            parsed = sqlparse.parse(query)
            if not parsed:
                return (False, "Invalid SQL query provided.")
            
            statement = parsed[0]
            if statement.get_type() != 'SELECT':
                return (
                        False, 
                        f"[Security block] Destructive operation '{statement.get_type()}' "
                        f"is not allowed"
                    )
            return True, None
            
        except Exception as e:
            # If parsing fails, block the query to be safe
            return False, f"Failed to validate query safety: {str(e)}"
        
    @classmethod
    def check_for_sql_injection(cls, query: str) -> tuple[bool, str | None]:
        """
        Check if the query contains SQL injection patterns.
        """
        for pattern in cls.sql_injection_patterns :
            match = re.search(pattern, query, re.IGNORECASE)
            if match:
                return (
                    False,
                    f"[Security block] Potential SQL injection detected with "
                    f"pattern: {match.group(0)}"
                )
                
        return True, None
    
    @classmethod
    def mask_sensitive_data(cls, results: list[dict]) -> list[dict]:
        """
        Mask sensitive data in query results.
        
        Args:
            results (list[dict]): Query results as a list of dictionaries.
            
        Returns:
             list[dict]: Results with sensitive data masked.
        """
        if not results:
            return results
            
        masked_results = []
        
        for row in results:
            masked_row = {}
            for col, val in row.items():
                col_lower = col.lower()
                
                # Check if column contains sensitive data
                is_sensitive = col_lower in cls.sensitive_pii_columns

                # Mask sensitive values
                if is_sensitive and val is not None:
                    if isinstance(val, str) and len(val) > 4:
                        masked_row[col] = f"{val[0]}{'*' * (len(val) - 2)}{val[-1]}"
                    else:
                        masked_row[col] = "****"
                else:
                    masked_row[col] = val
            masked_results.append(masked_row)

        return masked_results
