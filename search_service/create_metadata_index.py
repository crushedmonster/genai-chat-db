import os
import pyodbc
from dotenv import load_dotenv
from azure.search.documents import SearchClient
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex, SimpleField, SearchableField, ComplexField
from azure.core.credentials import AzureKeyCredential

# Load .env file 
load_dotenv()

# ---------- Extract DB Metadata ----------

def extract_sql_metadata(sql_connection_string, columns_to_sample):
    conn = pyodbc.connect(sql_connection_string)
    cursor = conn.cursor()

    cursor.execute("""
    SELECT 
        c.TABLE_SCHEMA, 
        c.TABLE_NAME, 
        c.COLUMN_NAME, 
        c.DATA_TYPE
    FROM 
        INFORMATION_SCHEMA.COLUMNS AS c
    INNER JOIN 
        INFORMATION_SCHEMA.TABLES AS t
        ON c.TABLE_SCHEMA = t.TABLE_SCHEMA AND c.TABLE_NAME = t.TABLE_NAME
    WHERE 
        c.TABLE_SCHEMA = 'SalesLT'
        AND t.TABLE_TYPE = 'BASE TABLE';
    """)

    metadata = []
    for row in cursor.fetchall():
        entry = {
            "id": f"{row.TABLE_SCHEMA}_{row.TABLE_NAME}_{row.COLUMN_NAME}",
            "schema": row.TABLE_SCHEMA,
            "table": row.TABLE_NAME,
            "column": row.COLUMN_NAME,
            "data_type": row.DATA_TYPE,
            "sample_values": []
        }
        metadata.append(entry)

    # Add sample values
    for (schema, table, column) in columns_to_sample:
        print(f"Fetching samples for {schema}.{table}.{column}...")
        cursor.execute(f"""
            SELECT DISTINCT [{column}]
            FROM [{schema}].[{table}]
            WHERE [{column}] IS NOT NULL
            ORDER BY [{column}]
        """)
        rows = cursor.fetchmany(MAX_SAMPLE_VALUES)
        values = [str(row[0]) for row in rows if row[0] is not None]
        # Find the matching record
        for record in metadata:
            if record["schema"] == schema and record["table"] == table and record["column"] == column:
                record["sample_values"] = values
                break

    conn.close()
    return metadata

# ---------- Create Azure Search Index ----------

def create_search_index(azure_search_endpoint, azure_search_key, index_name):
    index_client = SearchIndexClient(endpoint=azure_search_endpoint,
                                     credential=AzureKeyCredential(azure_search_key))

    fields = [
        SimpleField(name="id", type="Edm.String", key=True, filterable=True),
        SearchableField(name="schema", type="Edm.String", filterable=True, sortable=True, facetable=True),
        SearchableField(name="table", type="Edm.String", filterable=True, sortable=True, facetable=True),
        SearchableField(name="column", type="Edm.String", filterable=True, sortable=True, facetable=True),
        SearchableField(name="data_type", type="Edm.String", filterable=True, sortable=True, facetable=True),
        SearchableField(name="sample_values", type="Edm.String", collection=True, filterable=True, sortable=False, facetable=True)
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

# ---------- Upload Metadata to Search ----------

def upload_metadata_to_search(metadata, azure_search_endpoint, azure_search_key):
    search_client = SearchClient(endpoint=azure_search_endpoint,
                                 index_name=index_name,
                                 credential=AzureKeyCredential(azure_search_key))

    batch = []
    for record in metadata:
        batch.append(record)

    result = search_client.upload_documents(documents=batch)
    print(f"Uploaded {len(result)} documents to Azure Search.")

# ---------- Main Execution ----------
# SQL Server connection details
sql_driver = "{ODBC Driver 18 for SQL Server}"
sql_connection_string = f'Driver={sql_driver};Server=tcp:{os.getenv("SQL_SERVER")},' \
                f'{os.getenv("sql_port")};Database={os.getenv("SQL_DATABASE")};Uid={os.getenv("SQL_USERNAME")};' \
                f'Pwd={os.getenv("SQL_PASSWORD")};' 

# Azure Search details
azure_search_endpoint = os.getenv("AZURE_SEARCH_ENDPOINT")
azure_search_key = os.getenv("AZURE_SEARCH_KEY")
index_name = "sample-metadata-index"

# Columns to fetch sample distinct values for
columns_to_sample = [
    ("SalesLT", "ProductCategory", "Name"),
    ("SalesLT", "ProductCategory", "ProductCategoryID"),
    ("SalesLT", "ProductDescription", "ProductDescriptionID"),
    ("SalesLT", "ProductDescription", "Description"),
    ("SalesLT", "Product", "ProductID"),
    ("SalesLT", "Product", "Name"),
    ("SalesLT", "ProductModel", "ProductModelID"),
    ("SalesLT", "ProductModel", "Name"),    
    ("SalesLT", "ProductModelProductDescription", "ProductModelID"),    
    ("SalesLT", "ProductModelProductDescription", "ProductDescriptionID"),    
    ("SalesLT", "Address", "StateProvince"),
    ("SalesLT", "Address", "CountryRegion")
]

MAX_SAMPLE_VALUES = 5  # Limit distinct values fetched for each column

if __name__ == "__main__":
    metadata = extract_sql_metadata(sql_connection_string, columns_to_sample)
    print(metadata)
    print(f"Extracted {len(metadata)} metadata records from SQL Server.")

    create_search_index(azure_search_endpoint, azure_search_key, index_name)
    upload_metadata_to_search(metadata, azure_search_endpoint, azure_search_key)
    print("Done!")
