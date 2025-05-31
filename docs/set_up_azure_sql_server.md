# Azure SQL Database

**Official Docs:** [Create a single database in Azure SQL Database](https://learn.microsoft.com/en-us/azure/azure-sql/database/single-database-create-quickstart)

**Setup Steps:**
1. Browse to the [Select SQL Deployment](https://portal.azure.com/#create/Microsoft.AzureSQL) option page.
2. Under **SQL databases**, leave **Resource type** set to **Single database**, and select **Create**.
3. On the **Basics** tab:
   - **Subscription**: Select your Azure subscription
   - **Resource Group**: Select your Azure resource group
   - **Database name**: e.g., `sample`
   - **Server**: Click **Create new**
     - **Server name**: e.g., `genai-chat-db-sql-server`
     - **Location**: Select a region (e.g., Southeast Asia)
     - **Authentication**: Use SQL authentication
     - **Login**: e.g., `sqladmin`
     - **Password**: Enter and confirm a secure password
4. Leave **SQL elastic pool** set to **No**
5. For **Workload environment**, select **Development** (recommended for test setups)
   - This defaults to locally redundant storage and serverless compute
6. Select **Next: Networking** at the bottom of the page. On the **Networking** tab:
   - **Connectivity method**: For security, select **Private endpoint** (recommended)
     - Create a **Private Endpoint** and associate it with a **Virtual Network (VNet)**
     - Otherwise, just select **Public endpoint**.
7. For Firewall rules, set **Add current client IP address** to **Yes**. Leave **Allow Azure services and resources to access this server** set to **No**.
8. Under Connection policy, choose the **Default** connection policy, and leave the Minimum TLS version at the default of **TLS 1.2**.
9. Click **Next: Security**. On the **Security** tab:
   - For **Enable Microsoft Defender for SQL**, select **No**.
   - Leave the other options at their default values.
10. Click **Next: Additional settings**. On the **Additional settings** tab, in the Data source section, for **Use existing data**, select **Sample**.  
    This creates an `AdventureWorksLT` sample database with tables and data to query and experiment with.
11. Click **Review + create**, verify your settings, then click **Create**.

---

## Creating a Read-Only User

After setting up your Azure SQL Database, it's a best practice to create a read-only user for your application to enhance security and limit permissions.

1. Connect to your database using either **SQL Server Management Studio (SSMS)** or the **Query Editor** in the Azure portal, using an admin account.
2. Run the following SQL commands, replacing the placeholders as needed:

```sql
-- Replace <YourUserName> and <YourStrongPasswordHere> with your chosen username and secure password
CREATE USER <YourUserName> WITH PASSWORD = '<YourStrongPasswordHere>';

-- Grant read-only access
EXEC sp_addrolemember 'db_datareader', '<YourUserName>';
```