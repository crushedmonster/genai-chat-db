# Setup guide for Azure SQL Server

## Pre-requisites
- **SQL Server Management Studio (SSMS)**

If SSMS is not installed, download it [here](https://learn.microsoft.com/en-us/ssms/download-sql-server-management-studio-ssms).

We will use SSMS to set up and manage the database.

## Step 1: Create a new database called "shoemart" in SQL Server

Create a new database called **`shoemart`** in your Azure SQL Server.

You can do this easily via the **Azure Portal** by creating a new database instance named `shoemart`.

> **Note**: Ensure the database is successfully created before proceeding to the next steps.

## Step 2: Load Data into the Database
### 2.1 Create Schema

Run the script in `schema.sql` to create the necessary tables and structures inside the `shoemart` database.

### 2.2 Insert Data

After the schema is created, run the following SQL scripts to insert data into the tables:

- `outlets.sql`
- `employees.sql`
- `product_catalog.sql`
- `detailed_transactions_jan_week1_somerset.sql`
- `detailed_transactions_jan_week1_jurong.sql`
- `detailed_transactions_jan_week1_nex.sql`
- `detailed_transactions_jan_week1_tamp.sql`
- `detailed_transactions_jan_week1_vivo.sql`

> **Tip**: Run these scripts in the order listed above to ensure data dependencies are maintained (e.g., inserting outlets and employees before inserting transactions).
