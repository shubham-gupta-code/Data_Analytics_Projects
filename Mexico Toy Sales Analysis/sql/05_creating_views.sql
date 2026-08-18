
-- Calendar View
CREATE VIEW mexico_toy_sales_schema.vw_DimCalendar AS
SELECT * 
FROM mexico_toy_sales_schema.dim_calendar_new

-- Inventory View
CREATE VIEW mexico_toy_sales_schema.vw_FactInventory AS
SELECT * 
FROM mexico_toy_sales_schema.dim_inventory_new

-- Sales View
CREATE VIEW mexico_toy_sales_schema.vw_FactSales AS
SELECT * 
FROM mexico_toy_sales_schema.fact_sales_new

-- Products View
CREATE VIEW mexico_toy_sales_schema.vw_DimProducts AS
SELECT 
    Product_ID,
    Product_Name,
    Product_Category,
    CAST(SUBSTRING(Product_Cost, 2, LEN(Product_Cost)) AS DECIMAL(10,2)) AS Product_Cost,
    CAST(SUBSTRING(Product_Price, 2, LEN(Product_Price)) AS DECIMAL(10,2)) AS Product_Price
FROM mexico_toy_sales_schema.dim_products_new

-- Stores View
CREATE VIEW mexico_toy_sales_schema.vw_DimStores AS
SELECT *
FROM mexico_toy_sales_schema.dim_stores_new


