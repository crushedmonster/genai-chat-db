# Azure AI Search

**Official Docs:** [Create an Azure AI Search service](https://learn.microsoft.com/en-us/azure/search/search-create-service-portal)

**Setup Steps:**
1. Go to [Azure Portal](https://portal.azure.com/).
2. Create a new **Azure AI Search** resource.
3. Choose the pricing tier based on your needs (free tier recommended).
4. After creation, note the **Search Admin Key**, and **Endpoint URL**.
5. Ensure your **Azure SQL Database** is set up and populated with the in-house sample dataset before running the search index scripts. 
6. Clone the repository and navigate to the [search_service](../search_service) directory:
```sh
git clone https://github.com/crushedmonster/genai-chat-db.git
cd genai-chat-db/search_service
```
7. You can use **Conda** to manage your Python environment. 
Use the provided [`conda-env.yaml`](../conda-env.yaml) file to simplify environment setup:
```sh
conda env create -f conda-env.yaml
conda activate genai-chat-db
```
8. Set your environment variables in a `.env` file or export them in your shell. Make sure you have the following Azure SQL Database details ready (server, database name, username, and password) before proceeding:
```env
# Azure Search Config
AZURE_SEARCH_ENDPOINT=https://your-search-resource.search.windows.net
AZURE_SEARCH_KEY=your-azure-search-api-key

# Azure SQL Database
SQL_SERVER=sql-server.database.windows.net
SQL_DATABASE=your-database-name
SQL_USERNAME=your-sql-username
SQL_PASSWORD=your-sql-password
SQL_PORT=1433
```
9. Run the scripts to create the search indexes and upload documents to Azure AI Search:
```sh
python create_metadata_index.py
python create_relationships_index.py
```