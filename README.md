# Building a Chat with a Database using Generative AI
This solution leverages Generative AI to enable non-technical users to interact with a structured database through natural language. It uses Azure OpenAI Service with the GPT-4o model to convert user questions into SQL queries, and Azure AI Search to provide additional context through data indexing and retrieval. The system connects to a sample dataset hosted in an Azure SQL Database, allowing users to ask questions about orders, products, and customers without needing knowledge of SQL.

This solution's backend is written in Python.

##  Architecture Overview
- **Frontend:** Streamlit
- **Backend:** Python (using modular imports)
- **AI Models:** Azure OpenAI
- **Search Service:** Azure AI Search
- **Database:** Azure SQL Database

## Approach
The solution follows a Retrieval-Augmented Generation (RAG) approach to enable natural language interaction with a structured database:
- **Azure SQL Database** is used to host the in-house sample dataset.
- Two indexes were created in **Azure AI Search** to store database metadata:
  - The first index contains metadata such as table names, column names, data types, and sample values. This data is extracted from `INFORMATION_SCHEMA.TABLES` and `INFORMATION_SCHEMA.COLUMNS`.
  - The second index stores relationship data, specifically foreign key relationships between tables.
- **Azure OpenAI Service** is used with the RAG approach to interpret user queries. The system determines which tables are relevant based on the user's question. It then queries Azure Search to retrieve related metadata and relationships, which are provided to the GPT-4o model as context (e.g., "You have these tables, columns, and relationships"). Based on this context, the model generates an appropriate SQL query to answer the user's question. The generated SQL is executed against the Azure SQL Database to retrieve the relevant data. To avoid passing large volumes of data into the language model (which could exceed token limits), the system summarises the data first (e.g., generating statistical summaries). These statistical summaries are then sent to the GPT-4o model for interpretation. The final response includes the original user query, relevant data, and natural language explanations of the data.

### Security Guardrails
There are database security measures in place to protect data integrity and ensure safe usage:
- **Only SELECT statements are allowed.** Any attempt to execute modifying commands such as DELETE, UPDATE, or DROP is explicitly blocked.
- **SQL injection prevention:** Malicious query patterns—even within SELECT statements—such as UNION SELECT, tautologies like WHERE 1=1, or other suspicious constructs used for table dumping are detected and rejected.
- **Sensitive data masking** is applied to hide confidential information such as phone, emails, and private fields.