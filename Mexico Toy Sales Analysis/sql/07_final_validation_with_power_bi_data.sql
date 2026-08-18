-- EXECUTIVE OVERVIEW

-- 1) Total Sales
SELECT SUM(s.Units * p.Product_Price) AS [Total Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID

-- 2) Total Profit
SELECT SUM(s.Units * (p.Product_Price - p.Product_Cost)) AS [Total Profit]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID

-- 3) Total Units Sold
SELECT SUM(Units) AS [Total Units Sold]
FROM mexico_toy_sales_schema.vw_FactSales s

-- 4) Profit Margin %
SELECT 
    ROUND(SUM(s.Units * (p.Product_Price - p.Product_Cost)) / SUM(s.Units * p.Product_Price) * 100, 1) AS [Profit Margin %]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID

-- 5) Sales Trend
SELECT SUM(s.Units * p.Product_Price) AS [2022 Total Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
WHERE s.Date BETWEEN '2022-01-01' AND '2022-12-31'
-- WHERE s.Date BETWEEN '2023-01-01' AND '2023-12-31'

-- 6) Profit Trend
SELECT SUM(s.Units * (p.Product_Price - p.Product_Cost)) AS [2022 Total Profit]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
-- WHERE s.Date BETWEEN '2022-01-01' AND '2022-12-31'
WHERE s.Date BETWEEN '2023-01-01' AND '2023-12-31'

-- 7) Top 5 Products by Sales
SELECT 
    TOP 5
    p.Product_Name AS [Product Name],
    SUM(s.Units * p.Product_Price) AS [Total Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY [Total Sales] DESC

-- 8) Top 5 Stores by Sales
SELECT 
    TOP 5
    st.Store_Name AS [Stores],
    SUM(s.Units * p.Product_Price) AS [Total Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
JOIN mexico_toy_sales_schema.vw_DimStores st
ON s.Store_ID = st.Store_ID
GROUP BY st.Store_Name
ORDER BY [Total Sales] DESC



-- PRODUCT ANALYSIS

-- 1) Top 5 Best Selling Products
SELECT TOP 5 p.Product_Name [Product Name], SUM(s.Units) [Total Units Sold]
FROM mexico_toy_sales_schema.vw_DimProducts p
JOIN mexico_toy_sales_schema.vw_FactSales s
ON p.Product_ID = s.Product_ID
GROUP BY p.Product_Name
ORDER BY SUM(s.Units) DESC

-- 2) Top 5 Highest Profit Margin Products (%)
SELECT TOP 5
    p.Product_Name [Product Name], 
    ROUND(SUM(s.Units * (p.Product_Price - p.Product_Cost)) / SUM(s.Units * p.Product_Price) * 100, 1) [Profit Margin (%)]
FROM mexico_toy_sales_schema.vw_DimProducts p 
JOIN mexico_toy_sales_schema.vw_FactSales s
ON p.Product_ID = s.Product_ID
GROUP BY p.Product_Name
ORDER BY [Profit Margin (%)] DESC

-- 3) Top 5 Highest Cost Products
SELECT TOP 5 
    Product_Name [Product Name], 
    Product_Cost [Product Cost] 
FROM mexico_toy_sales_schema.vw_DimProducts 
ORDER BY Product_Cost DESC

-- 4) Product Price vs Total Profit
SELECT 
    p.Product_Name,
    MAX(p.Product_Price) [Product Price],
    SUM(s.Units) [Total Units Sold],
    SUM(s.Units * (p.Product_Price - p.Product_Cost)) [Total Profit]
FROM mexico_toy_sales_schema.vw_FactSales s 
JOIN mexico_toy_sales_schema.vw_DimProducts p 
ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY [Product Price] DESC

-- 5) Product Performance Overview
SELECT 
    p.Product_Name,
    MAX(p.Product_Price) [Product Price ($)],
    SUM(s.Units) [Total Units Sold],
    SUM(s.Units * p.Product_Price) [Total Sales ($)],
    SUM(s.Units * p.Product_Cost) [Total Cost ($)],
    SUM(s.Units * (p.Product_Price - p.Product_Cost)) [Total Profit ($)],
    ROUND(SUM(s.Units * (p.Product_Price - p.Product_Cost)) / SUM(s.Units * p.Product_Price) * 100, 0) [Profit Margin %]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p 
ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY [Profit Margin %] DESC

-- 6) Most Profitable Products with Sales Value
SELECT TOP 5 
    p.Product_Name [Product Name],
    SUM(s.Units * p.Product_Price) [Total Sales],
    SUM(s.Units * (p.Product_Price - p.Product_Cost)) [Total Profit]
FROM mexico_toy_sales_schema.vw_DimProducts p
JOIN mexico_toy_sales_schema.vw_FactSales s
ON p.Product_ID = s.Product_ID
GROUP BY p.Product_Name
ORDER BY [Total Profit] DESC



-- STORE ANALYSIS

-- 1) Sales by Store
SELECT 
    st.Store_Name [Store Name], SUM(s.Units * p.Product_Price) [Total Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimStores st
ON s.Store_ID = st.Store_ID
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
GROUP BY st.Store_Name
ORDER BY [Total Sales] DESC

-- 2) Revenue Contribution by City
SELECT 
    st.Store_City [Store Name], SUM(s.Units * p.Product_Price) [Total Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimStores st
ON s.Store_ID = st.Store_ID
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
GROUP BY st.Store_City
ORDER BY [Total Sales] DESC

-- 3) Average Sales Per Store by City
SELECT
    st.Store_City, 
    SUM(s.Units * p.Product_Price) / COUNT(DISTINCT st.Store_Name) as total_sales
FROM mexico_toy_sales_schema.vw_FactSales as s
JOIN mexico_toy_sales_schema.vw_DimStores as st
ON s.Store_ID = st.Store_ID
JOIN mexico_toy_sales_schema.vw_DimProducts as p
ON s.Product_ID = p.Product_ID
GROUP BY st.Store_City
ORDER BY total_sales DESC

-- 4) Inventory Distribution Across Stores
SELECT 
    st.Store_Name [Store Name], SUM(i.Stock_On_Hand) [Total Inventory]
FROM mexico_toy_sales_schema.vw_FactInventory i
JOIN mexico_toy_sales_schema.vw_DimStores st
ON i.Store_ID = st.Store_ID
GROUP BY st.Store_Name
ORDER BY [Total Inventory] DESC

-- 5) Profit V/s Sales by Store
SELECT 
    st.Store_Name AS [Store Name], 
    SUM(s.Units * p.Product_Price) AS [Store Sales],
    SUM(s.Units * (p.Product_Price - Product_Cost)) AS [Store Profit]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
JOIN mexico_toy_sales_schema.vw_DimStores st
ON s.Store_ID = st.Store_ID
GROUP BY st.Store_Name
ORDER BY [Store Sales] DESC

-- 6) Store Performance Overview
WITH total_profit AS (
    SELECT 
        SUM(s.Units * (p.Product_Price - p.Product_Cost)) AS [Total Profit]
    FROM mexico_toy_sales_schema.vw_FactSales s
    JOIN mexico_toy_sales_schema.vw_DimProducts p
    ON s.Product_ID = p.Product_ID
)

SELECT
    st.Store_Name,
    SUM(s.Units) AS [Total Units Sold],
    SUM(s.Units * p.Product_Price) AS [Total Sales],
    SUM(s.Units * p.Product_Cost) AS [Total Cost],
    SUM(s.Units * (p.Product_Price - p.Product_Cost)) AS [Total Profit],
    ROUND(SUM(s.Units * (p.Product_Price - p.Product_Cost)) / SUM(s.Units * p.Product_Price) * 100.0, 1) AS [Profit Margin %],
    ROUND(SUM(s.Units * (p.Product_Price - p.Product_Cost)) / (SELECT [Total Profit] FROM total_profit) * 100.0, 1) AS [Profit Contribution by Store %]
FROM mexico_toy_sales_schema.vw_DimStores st
JOIN mexico_toy_sales_schema.vw_FactSales s
ON st.Store_ID = s.Store_ID
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
GROUP BY st.Store_Name
ORDER BY [Total Profit] DESC



-- INVENTORY ANALYSIS

-- 1) Total Inventory
SELECT 
    SUM(i.Stock_On_Hand) AS [Total Inventory]
FROM mexico_toy_sales_schema.vw_FactInventory i
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON i.Product_ID = p.Product_ID

-- 2) Total Inventory Value
SELECT 
    SUM(i.Stock_On_Hand * p.Product_Price) AS [Total Inventory Value]
FROM mexico_toy_sales_schema.vw_FactInventory i
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON i.Product_ID = p.Product_ID

-- 3) Avg Inventory / Store
SELECT 
    SUM(Stock_On_Hand) / COUNT(DISTINCT Store_ID) AS [Average Inventory Per Store]
FROM mexico_toy_sales_schema.vw_FactInventory

-- 4) Avg Inventory / Product
SELECT 
    SUM(Stock_On_Hand) / COUNT(DISTINCT Product_ID) AS [Average Inventory Per Product]
FROM mexico_toy_sales_schema.vw_FactInventory

-- 5) Inventory Distribution by Category
WITH stock AS (
SELECT 
    p.Product_Category,
    SUM(i.Stock_On_Hand) AS [Total Stock]
FROM mexico_toy_sales_schema.vw_FactInventory i
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON i.Product_ID = p.Product_ID
GROUP BY p.Product_Category
)

SELECT
Product_Category,
[Total Stock],
ROUND(([Total Stock] * 100.0) / (SELECT SUM(Stock_On_Hand) FROM mexico_toy_sales_schema.vw_FactInventory), 2) AS [Stock Percentage]
FROM stock

-- 6) Inventory Distribution by Product
SELECT 
    p.Product_Name,
    SUM(i.Stock_On_Hand) AS [Total Inventory]
FROM mexico_toy_sales_schema.vw_FactInventory i
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON i.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY [Total Inventory] DESC

-- 7) Inventory Performance Overview
WITH product_inventory AS (
    SELECT
        p.Product_ID,
        p.Product_Category,
        st.Store_ID,
        SUM(i.Stock_On_Hand) AS [Total Inventory],
        SUM(i.Stock_On_Hand * p.Product_Price) AS [Total Inventory Value]
    FROM mexico_toy_sales_schema.vw_DimProducts p
    JOIN mexico_toy_sales_schema.vw_FactInventory i
    ON p.Product_ID = i.Product_ID
    JOIN mexico_toy_sales_schema.vw_DimStores st
    ON i.Store_ID = st.Store_ID
    GROUP BY p.Product_ID, p.Product_Category, st.Store_ID
),
product_sales AS (
    SELECT
        p.Product_ID,
        st.Store_ID,
        SUM(s.Units * p.Product_Price) AS [Total Sales]
    FROM mexico_toy_sales_schema.vw_FactSales s
    JOIN mexico_toy_sales_schema.vw_DimProducts p
    ON s.Product_ID = p.Product_ID
    JOIN mexico_toy_sales_schema.vw_DimStores st
    ON s.Store_ID = st.Store_ID
    GROUP BY p.Product_ID, st.Store_ID
)

SELECT
    p.Product_Name,
    pi.Product_Category,
    st.Store_Name,
    COALESCE(pi.[Total Inventory], ' ') AS [Total Inventory],
    COALESCE(pi.[Total Inventory Value], 0) AS [Total Inventory Value],
    COALESCE(ps.[Total Sales], 0) AS [Total Sales]
FROM product_inventory pi
LEFT JOIN product_sales ps
ON pi.Product_ID = ps.Product_ID AND pi.Store_ID = ps.Store_ID
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON pi.Product_ID = p.Product_ID
JOIN mexico_toy_sales_schema.vw_DimStores st
ON pi.Store_ID = st.Store_ID
ORDER BY pi.[Total Inventory] DESC



-- TIME INTELLIGENCE ANALYSIS

-- 1) Last 30 Days Sales
SELECT
    SUM(s.Units * p.Product_Price) AS [Last 30 Days Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
WHERE s.Date > (SELECT DATEADD(day, -30, MAX(Date)) FROM mexico_toy_sales_schema.vw_DimCalendar)

-- 2) Last 30 Days Profit
SELECT
    SUM((p.Product_Price - p.Product_Cost) * s.Units) AS [Last 30 Days Profit]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
WHERE s.Date > (SELECT DATEADD(day, -30, MAX(Date)) FROM mexico_toy_sales_schema.vw_DimCalendar)

-- 3) YTD Sales
SELECT
    SUM(s.Units * p.Product_Price) AS [YTD Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
WHERE YEAR(Date) = (SELECT YEAR(MAX(Date)) FROM mexico_toy_sales_schema.vw_DimCalendar)

-- 4) YTD Profit
SELECT
    SUM(s.Units * (p.Product_Price - p.Product_Cost)) AS [YTD Profit]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
WHERE YEAR(Date) = (SELECT YEAR(MAX(Date)) FROM mexico_toy_sales_schema.vw_DimCalendar)

-- 5) Last 3 Months Sales
SELECT
    SUM(s.Units * p.Product_Price) AS [Last 3 Months Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
WHERE s.Date > (SELECT DATEADD(MONTH, -3, MAX(Date)) FROM mexico_toy_sales_schema.vw_DimCalendar)

-- 6) Last 3 Months Profit
SELECT
    SUM(s.Units * (p.Product_Price - p.Product_Cost)) AS [Last 3 Months Profit]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
WHERE s.Date > (SELECT DATEADD(MONTH, -3, MAX(Date)) FROM mexico_toy_sales_schema.vw_DimCalendar)

-- 7.1) Sales Trend
SELECT SUM(s.Units * p.Product_Price) AS [2022 Total Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
-- WHERE s.Date BETWEEN '2022-01-01' AND '2022-12-31'
WHERE s.Date BETWEEN '2023-01-01' AND '2023-12-31'

-- 7.2) Profit Trend
SELECT SUM(s.Units * (p.Product_Price - p.Product_Cost)) AS [2022 Total Profit]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
WHERE s.Date BETWEEN '2022-01-01' AND '2022-12-31'
-- WHERE s.Date BETWEEN '2023-01-01' AND '2023-12-31'

-- 8.1) Current Year V/s Last Year Sales
SELECT SUM(s.Units * p.Product_Price) AS [2022 Total Sales]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
-- WHERE s.Date BETWEEN '2022-01-01' AND '2022-12-31'  -- 2022 Sales
WHERE s.Date BETWEEN '2023-01-01' AND '2023-12-31'  -- 2023 Sales

-- WHERE s.Date BETWEEN '2022-01-01' AND '2022-03-31'  -- 2022 Q1 Sales
-- WHERE s.Date BETWEEN '2023-01-01' AND '2023-03-31'  -- 2023 Q1 Sales

-- WHERE s.Date BETWEEN '2022-04-01' AND '2022-06-30'  -- 2022 Q2 Sales
-- WHERE s.Date BETWEEN '2023-04-01' AND '2023-06-30'  -- 2023 Q2 Sales

-- WHERE s.Date BETWEEN '2022-07-01' AND '2022-09-30'  -- 2022 Q3 Sales
-- WHERE s.Date BETWEEN '2023-07-01' AND '2023-09-30'  -- 2023 Q3 Sales

-- WHERE s.Date BETWEEN '2022-10-01' AND '2022-12-31'  -- 2022 Q4 Sales
-- WHERE s.Date BETWEEN '2023-10-01' AND '2023-12-31'  -- 2023 Q4 Sales

-- 8.2) Current Year V/s Last Year Profit
SELECT SUM(s.Units * (p.Product_Price - p.Product_Cost)) AS [2022 Total Profit]
FROM mexico_toy_sales_schema.vw_FactSales s
JOIN mexico_toy_sales_schema.vw_DimProducts p
ON s.Product_ID = p.Product_ID
-- WHERE s.Date BETWEEN '2022-01-01' AND '2022-12-31'  -- 2022 Profit
-- WHERE s.Date BETWEEN '2023-01-01' AND '2023-12-31'  -- 2023 Profit

-- WHERE s.Date BETWEEN '2022-01-01' AND '2022-03-31'  -- 2022 Q1 Profit
-- WHERE s.Date BETWEEN '2023-01-01' AND '2023-03-31'  -- 2023 Q1 Profit

-- WHERE s.Date BETWEEN '2022-04-01' AND '2022-06-30'  -- 2022 Q2 Profit
-- WHERE s.Date BETWEEN '2023-04-01' AND '2023-06-30'  -- 2023 Q2 Profit

-- WHERE s.Date BETWEEN '2022-07-01' AND '2022-09-30'  -- 2022 Q3 Profit
-- WHERE s.Date BETWEEN '2023-07-01' AND '2023-09-30'  -- 2023 Q3 Profit

-- WHERE s.Date BETWEEN '2022-10-01' AND '2022-12-31'  -- 2022 Q4 Profit
-- WHERE s.Date BETWEEN '2023-10-01' AND '2023-12-31'  -- 2023 Q4 Profit
