-- 01) Creating dim_calendar_new table
CREATE TABLE mexico_toy_sales_schema.dim_calendar_new (
    Date DATE
)

-- Copying data from old calendar table to new table with "DATE" data type
INSERT INTO mexico_toy_sales_schema.dim_calendar_new
SELECT
    CAST(Date AS DATE)
FROM mexico_toy_sales_schema.dim_calendar

-- Validating new calendar table
SELECT * FROM mexico_toy_sales_schema.dim_calendar_new

-----------------x---------------------x-----------------------x-----------------

-- 02) Creating dim_inventory_new table
CREATE TABLE mexico_toy_sales_schema.dim_inventory_new (
    Store_ID INT,
    Product_ID INT,
    Stock_On_Hand INT
)

-- Copying data from old inventory table to new inventory table with corrected data types
INSERT INTO mexico_toy_sales_schema.dim_inventory_new
SELECT
    CAST(Store_ID AS INT),
    CAST(Product_ID AS INT),
    CAST(Stock_On_Hand AS INT)
FROM mexico_toy_sales_schema.dim_inventory

-- Validating new inventory table
SELECT * FROM mexico_toy_sales_schema.dim_inventory_new

-----------------x---------------------x-----------------------x-----------------

-- 03) Creating dim_products_new table
CREATE TABLE mexico_toy_sales_schema.dim_products_new (
    Product_ID INT NOT NULL,
    Product_Name VARCHAR(255),
    Product_Category VARCHAR(255),
    Product_Cost VARCHAR(50),
    Product_Price VARCHAR(50)
)

-- Copying data from old products table to new products table with corrected data types
INSERT INTO mexico_toy_sales_schema.dim_products_new
SELECT
    CAST(Product_ID AS INT),
    CAST(Product_Name AS VARCHAR(255)),
    CAST(Product_Category AS VARCHAR(255)),
    CAST(Product_Cost AS VARCHAR(50)),
    CAST(Product_Price AS VARCHAR(50))
FROM mexico_toy_sales_schema.dim_products

-- Validating new products table
SELECT * FROM mexico_toy_sales_schema.dim_products_new

-----------------x---------------------x-----------------------x-----------------

-- 04) Creating dim_stores_new table
CREATE TABLE mexico_toy_sales_schema.dim_stores_new (
    Store_ID INT NOT NULL,
    Store_Name VARCHAR(255),
    Store_City VARCHAR(255),
    Store_Location VARCHAR(255),
    Store_Open_Date DATE
)

-- Copying data from old stores table to new stores table with corrected data types
INSERT INTO mexico_toy_sales_schema.dim_stores_new
SELECT
    CAST(Store_ID AS INT),
    CAST(Store_Name AS VARCHAR(255)),
    CAST(Store_City AS VARCHAR(255)),
    CAST(Store_Location AS VARCHAR(255)),
    CAST(Store_Open_Date AS DATE)
FROM mexico_toy_sales_schema.dim_stores

-- Validating new products table
SELECT * FROM mexico_toy_sales_schema.dim_stores_new

-----------------x---------------------x-----------------------x-----------------

-- 05) Creating fact_sales_new table
CREATE TABLE mexico_toy_sales_schema.fact_sales_new (
    Sale_ID INT NOT NULL,
    Date DATE,
    Store_ID INT,
    Product_ID INT,
    Units INT
)

-- Copying data from old sales table to new sales table with corrected data types
INSERT INTO mexico_toy_sales_schema.fact_sales_new
SELECT
    CAST(Sale_ID AS INT),
    CAST(Date AS DATE),
    CAST(Store_ID AS INT),
    CAST(Product_ID AS INT),
    CAST(Units AS INT)
FROM mexico_toy_sales_schema.fact_sales

-- Validating new products table
SELECT * FROM mexico_toy_sales_schema.fact_sales_new


