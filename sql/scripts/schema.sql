-- schema.sql
-- Creates the database structure for ShoeMart Singapore

-- Create `outlets` table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'outlets')
BEGIN
    CREATE TABLE outlets (
        outlet_id VARCHAR(10) PRIMARY KEY, -- Example: OUT001
        outlet_name NVARCHAR(100) NOT NULL,
        location NVARCHAR(100), -- Mall name
        address NVARCHAR(200),
        postal_code NVARCHAR(6),
        region NVARCHAR(20) -- East, West, North, South, Central
    );
END
GO

-- Create `employees` table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'employees')
BEGIN
    CREATE TABLE employees (
        employee_id VARCHAR(10) PRIMARY KEY,
        full_name NVARCHAR(100) NOT NULL,
        job_title NVARCHAR(50) NOT NULL,
        department NVARCHAR(50) NOT NULL,
        business_unit VARCHAR(10),
        gender NVARCHAR(10) NOT NULL,
        date_of_birth DATE NOT NULL,
        hire_date DATE NOT NULL,
        status NVARCHAR(20) NOT NULL,
        end_date DATE
    );
END
GO

-- Create `products` table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'products')
BEGIN
    CREATE TABLE products (
        sku VARCHAR(10) PRIMARY KEY,
        product_name NVARCHAR(100) NOT NULL,
        brand NVARCHAR(50) NOT NULL,
        category NVARCHAR(50) NOT NULL,
        cost_price DECIMAL(10, 2) NOT NULL,
        retail_price DECIMAL(10, 2) NOT NULL,
        current_stock INT NOT NULL DEFAULT 0,
        status NVARCHAR(20) NOT NULL DEFAULT 'Active', -- 'Active' or 'Discontinued'
        discontinue_date DATE NULL
    );
END
GO

-- Create `sales` table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'sales')
BEGIN
    CREATE TABLE sales (
        sale_id VARCHAR(15) PRIMARY KEY,
        outlet_id VARCHAR(10) NOT NULL,
        employee_id VARCHAR(10) NOT NULL,
        sale_date DATETIME NOT NULL,
        payment_method NVARCHAR(20) NOT NULL,
        subtotal DECIMAL(10, 2) NOT NULL,
        gst_amount DECIMAL(10, 2) NOT NULL,
        discount_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
        total_amount DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (outlet_id) REFERENCES outlets(outlet_id),
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
    );
END
GO

-- Create `sale_items` table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'sale_items')
BEGIN
    CREATE TABLE sale_items (
        sale_item_id INT PRIMARY KEY IDENTITY(1,1),
        sale_id VARCHAR(15) NOT NULL,
        sku VARCHAR(10) NOT NULL,
        quantity INT NOT NULL,
        unit_price DECIMAL(10, 2) NOT NULL,
        discount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
        item_total DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
        FOREIGN KEY (sku) REFERENCES products(sku)
    );
END
GO
