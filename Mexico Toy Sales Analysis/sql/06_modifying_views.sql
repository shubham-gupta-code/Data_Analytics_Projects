
ALTER VIEW mexico_toy_sales_schema.vw_DimStores AS
SELECT 
    Store_ID,
    REPLACE(Store_Name, 'Maven Toys ', '') AS Store_Name,
    Store_City,
    Store_Location,
    Store_Open_Date
FROM mexico_toy_sales_schema.dim_stores_new

ALTER VIEW mexico_toy_sales_schema.vw_FactSales
ALTER COLUMN Sale_ID 