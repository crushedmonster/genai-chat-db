import os
import pyodbc
from dotenv import load_dotenv
from azure.search.documents import SearchClient
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex, SimpleField, SearchableField, ComplexField
from azure.core.credentials import AzureKeyCredential

# Load .env file 
load_dotenv()

# ---------- Extract Relationships Metadata ----------

def extract_sql_relationships(sql_connection_string):
    conn = pyodbc.connect(sql_connection_string)
    cursor = conn.cursor()

    cursor.execute("""
    SELECT 
        fk.name AS FK_Name,
        tp.name AS ParentTable,
        cp.name AS ParentColumn,
        tr.name AS ReferencedTable,
        cr.name AS ReferencedColumn
    FROM 
        sys.foreign_keys AS fk
    INNER JOIN 
        sys.foreign_key_columns AS fkc ON fk.object_id = fkc.constraint_object_id
    INNER JOIN 
        sys.tables AS tp ON fkc.parent_object_id = tp.object_id
    INNER JOIN 
        sys.columns AS cp ON fkc.parent_object_id = cp.object_id AND fkc.parent_column_id = cp.column_id
    INNER JOIN 
        sys.tables AS tr ON fkc.referenced_object_id = tr.object_id
    INNER JOIN 
        sys.columns AS cr ON fkc.referenced_object_id = cr.object_id AND fkc.referenced_column_id = cr.column_id;
    """)

    relationships = []
    for row in cursor.fetchall():
        relationships.append({
            "id": row.FK_Name,
            "parent_table": row.ParentTable,
            "parent_column": row.ParentColumn,
            "referenced_table": row.ReferencedTable,
            "referenced_column": row.ReferencedColumn
        })

    conn.close()
    return relationships

# ---------- Create Azure Search Index ----------

def create_search_index(azure_search_endpoint, azure_search_key, index_name):
    index_client = SearchIndexClient(endpoint=azure_search_endpoint,
                                     credential=AzureKeyCredential(azure_search_key))

    fields = [
        SimpleField(name="id", type="Edm.String", key=True, filterable=True),
        SimpleField(name="parent_table", type="Edm.String", filterable=True, searchable=True),
        SimpleField(name="parent_column", type="Edm.String", filterable=True, searchable=True),
        SimpleField(name="referenced_table", type="Edm.String", filterable=True, searchable=True),
        SimpleField(name="referenced_column", type="Edm.String", filterable=True, searchable=True)
    ]

    index = SearchIndex(name=index_name, fields=fields)

    # Delete existing index if it exists
    try:
        index_client.delete_index(index_name)
        print(f"Deleted existing index: {index_name}")
    except Exception:
        pass  # Index may not exist

    index_client.create_index(index)
    print(f"Created new index: {index_name}")

# ---------- Upload Relationships to Search ----------

def upload_relationships_to_search(relationships, azure_search_endpoint, azure_search_key):
    search_client = SearchClient(endpoint=azure_search_endpoint,
                                 index_name=index_name,
                                 credential=AzureKeyCredential(azure_search_key))

    batch = []
    for record in relationships:
        batch.append(record)

    result = search_client.upload_documents(documents=batch)
    print(f"Uploaded {len(result)} relationships to Azure Search.")

# ---------- Main Execution ----------
# SQL Server connection details
sql_driver = "{ODBC Driver 18 for SQL Server}"
sql_connection_string = f'Driver={sql_driver};Server=tcp:{os.getenv("SQL_SERVER")},' \
                f'{os.getenv("sql_port")};Database={os.getenv("SQL_DATABASE")};Uid={os.getenv("SQL_USERNAME")};' \
                f'Pwd={os.getenv("SQL_PASSWORD")};' 

# Azure Search details
azure_search_endpoint = os.getenv("AZURE_SEARCH_ENDPOINT")
azure_search_key = os.getenv("AZURE_SEARCH_KEY")
index_name = "sample-relationships-index"

if __name__ == "__main__":
    relationships = extract_sql_relationships(sql_connection_string)
    print(relationships)
    print(f"Extracted {len(relationships)} foreign key relationships from SQL Server.")
    create_search_index(azure_search_endpoint, azure_search_key, index_name)
    upload_relationships_to_search(relationships, azure_search_endpoint, azure_search_key)
    print("Done!")
