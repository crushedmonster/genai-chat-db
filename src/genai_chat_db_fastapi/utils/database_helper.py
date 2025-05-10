import pyodbc


class DatabaseConnector:
    """
    A utility class for establishing a connection to a database using pyodbc.
    """
    @staticmethod
    def connect_to_db(connection_string: str) -> pyodbc.Connection:
        """
        Establish a connection to the database.

        Args:
            connection_string (str): The connection string used to connect 
            to the database.

        Returns:
            pyodbc.Connection: A live connection object to the database.

        Raises:
            Exception: If the database connection attempt fails.
        """
        try:
            conn = pyodbc.connect(connection_string)
            return conn
        except pyodbc.Error as error:
            raise Exception(f'Database connection failed: {str(error)}') from error


# NOTE: This class is currently not in use.
# The functionality has been replaced with Azure Search to save token inputs.
# Additionally, if the database is very large, it is recommended to use Azure Search
# to efficiently retrieve metadata and foreign key information, instead of querying
# the database directly.
class DatabaseSchemaLoader:
    """
    A utility class for connecting to a database and extracting schema
    and table relationship information.
    """
    def __init__(self, connection_string: str):
        """
        Initialize the DatabaseSchemaLoader.

        Args:
            connection_string (str): The connection string for the database.
        """
        self.connection_string = connection_string

    def get_database_schema(self) -> dict:
        """
        Connect to the database and dynamically retrieve schema information.

        Returns:
            dict: A dictionary mapping table names to their columns and data types.
        """
        schema = {}

        # Connect to the database
        conn = DatabaseConnector.connect_to_db(self.connection_string)
        cursor = conn.cursor()

        query = """
        SELECT TABLE_NAME
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_TYPE = 'BASE TABLE';
        """
        # Fetch all tables
        cursor.execute(query)
        tables = [row[0] for row in cursor.fetchall()]
        
        # Iterate through tables to fetch their columns and data types
        for table in tables:
            cursor.execute("""
            SELECT COLUMN_NAME, DATA_TYPE
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_NAME = ?
            """, (table,))
            columns = cursor.fetchall()
            
            # Add each table's schema to the dictionary
            schema[table] = [{"column_name": col[0], "data_type": col[1]} for col in columns]
        
        cursor.close()
        conn.close()

        return schema
    
    def get_tables_relationship(self) -> dict:
        """
        Connect to the database and retrieve foreign key relationships between tables.

        Returns:
            dict: A dictionary mapping constraint names to parent and referenced table/column details.
        """
        # Connect to the database
        conn = DatabaseConnector.connect_to_db(self.connection_string)
        cursor = conn.cursor()

        query = """
        SELECT 
            fk.name AS constraint_name,
            tp.name AS parent_table,
            cp.name AS parent_column,
            tr.name AS referenced_table,
            cr.name AS referenced_column
        FROM 
            sys.foreign_keys fk
        INNER JOIN 
            sys.foreign_key_columns fkc ON fkc.constraint_object_id = fk.object_id
        INNER JOIN 
            sys.tables tp ON fk.parent_object_id = tp.object_id
        INNER JOIN 
            sys.columns cp ON fkc.parent_column_id = cp.column_id AND cp.object_id = tp.object_id
        INNER JOIN 
            sys.tables tr ON fk.referenced_object_id = tr.object_id
        INNER JOIN 
            sys.columns cr ON fkc.referenced_column_id = cr.column_id AND cr.object_id = tr.object_id
        ORDER BY 
            parent_table;
        """

        cursor.execute(query)

        relationships = {row[0]: {"parent_table": row[1], "parent_column": row[2], 
                                  "referenced_table": row[3], "referenced_column": row[4]} 
                                  for row in cursor.fetchall()}

        cursor.close()
        conn.close()

        return relationships
    
    def schema_to_text(self, schema: dict) -> str:
        """
        Format schema information into a readable text format.

        Example output:
            - products (sku, product_name, brand, ...)
            - sales (sale_id, outlet_id, employee_id, ...)

        Args:
            schema (dict): The database schema.

        Returns:
            str: A formatted string representing the schema.
        """
        # Generate the formatted text
        output = ""
        for table_name, columns in schema.items():
            column_names = ", ".join(col['column_name'] for col in columns)
            output += f"- {table_name} ({column_names})\n"
        return output

    def table_relation_to_text(self, table_relation: dict) -> str:
        """
        Format table relationship information into a readable text format.

        Args:
            table_relation (dict): Table relationships.

        Returns:
            str: A formatted string representing the table relationships.
        """
        # Generate the formatted text
        output = []
        for relation in table_relation.values():
            parent = f"{relation['parent_table']}.{relation['parent_column']}"
            referenced = f"{relation['referenced_table']}.{relation['referenced_column']}"
            output.append(f"{parent} -> {referenced}")
        return "\n".join(output)
