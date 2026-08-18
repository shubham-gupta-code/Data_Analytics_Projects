# Mexico Toy Sales — Microsoft Fabric & Power BI Business Intelligence Project

## Project Links

- **Report:** https://app.fabric.microsoft.com/groups/a797c325-aa92-46a6-8c75-d47d41251594/reports/208a8028-5624-46b7-8986-c1f46ef82f26/a3ead60a4368de17ec97?experience=fabric-developer
- **Dashboard:** https://app.fabric.microsoft.com/groups/a797c325-aa92-46a6-8c75-d47d41251594/dashboards/61a1f52f-0d6f-42c0-9b5d-d6d70deeb04d?experience=fabric-developer

## Overview

This project is an end-to-end Business Intelligence solution built using **Microsoft Fabric** and **Power BI Desktop** to analyze Mexico toy sales performance across products, stores, inventory, and time.

The final Power BI report is organized into five analytical areas:

1. Executive Overview
2. Product Analysis
3. Store Analysis
4. Inventory Analysis
5. Time Intelligence

The report focuses on practical business questions such as:

- Which products generate the most sales and profit?
- Which products have the highest costs or profit margins?
- Which stores and cities perform best?
- Where is inventory concentrated?
- How are recent and year-over-year sales and profit changing?

## Data Source

- **Source:** Maven Analytics
- **Format:** CSV
- **Data domain:** Toy sales, products, stores, inventory, and calendar/time information

The published report identifies Maven Analytics as the data source and covers sales, profit, inventory, and performance across products, stores, and time.

## Technology Stack

- Microsoft Fabric
- Fabric Lakehouse
- Fabric Pipelines
- Fabric Warehouse
- T-SQL
- SQL Views
- Power BI Desktop
- Power BI Semantic Model
- Power Query
- DAX
- Microsoft Fabric Service / Power BI Service

## Architecture

```text
CSV Data
   ↓
Microsoft Fabric Workspace
   ↓
Lakehouse
   ↓
Pipeline
   ↓
Structured data in Parquet format
   ↓
Fabric Warehouse
   ↓
Data validation & corrected tables
   ↓
SQL Views
   ↓
Power BI Desktop
   ↓
Semantic Model + Power Query + DAX
   ↓
Power BI Report
   ↓
Publish to Microsoft Fabric
   ↓
Dashboard
```

## Project Workflow

### Step 1 — Finding and Downloading Data

The project started by finding and downloading the required toy sales dataset in CSV format.

### Step 2 — Creating a Dedicated Microsoft Fabric Workspace

A separate workspace was created in Microsoft Fabric specifically for this project so that the Lakehouse, Warehouse, Pipelines, and BI artifacts could be organized together.

### Step 3 — Importing Data into the Fabric Lakehouse

The CSV data was imported into the Microsoft Fabric Lakehouse.

### Step 4 — Converting the File Data into Structured Parquet Data

The source files were transferred from the Lakehouse **Files** area into the structured table/folder workflow used in the project through a Fabric Pipeline, resulting in Parquet-based structured data.

> Project note: this step was performed through a pipeline so the source CSV data could be converted into a structured Parquet representation before loading it into the Warehouse.

### Step 5 — Transferring Data from Lakehouse to Fabric Warehouse

The Parquet-based data was transferred from the Lakehouse to the Fabric Warehouse using Fabric Pipelines.

### Step 6 — Validating Warehouse Data

The Warehouse data was validated against the original CSV data by comparing row counts using **T-SQL** in Microsoft Fabric. This helped confirm that the pipeline movement had not unexpectedly dropped or duplicated rows.

### Step 7 — Creating Corrected Warehouse Tables

New tables were created with corrected data types for the project tables so that the Warehouse data had an appropriate structure for downstream analysis.

### Step 8 — Removing the Old Tables

After the corrected tables were created and validated, the old versions were deleted.

### Step 9 — Creating SQL Views

SQL Views were created for the project tables.

### Why Views?

The views provided a clean reporting layer while keeping the underlying Warehouse data separate. The views were used as the reporting source so that the original tables would not be directly modified for report-specific analysis.

### Step 10 — Modifying the Views as Required

The views were adjusted to clean or prepare the data required for analysis. This included applying transformations and business logic in the SQL reporting layer while keeping the original Warehouse data protected.

### Step 11 — Connecting Power BI to the Reporting Layer

The data was brought into Power BI Desktop through the Fabric/SQL connection workflow used in the project.

The model was initially brought in using the Fabric Direct Lake workflow, then converted to **DirectQuery** for the reporting model and later used in a **Mixed / composite model** when a dedicated Measures table was introduced for DAX measures.

This enabled the project to use:

- Power Query for report-level transformations where needed
- Relationships in the Power BI semantic model
- DAX measures for KPIs and business calculations
- A dedicated measures area without requiring the core warehouse tables to become imported tables

### Step 12 — Building the Power BI Report

The report was developed by:

- Creating DAX measures
- Creating relationships between fact and dimension tables
- Adding slicers
- Creating charts and tables
- Building report pages
- Formatting and arranging visuals
- Adding business insights and recommendations

## Report Pages

### Page 1 — Executive Overview

Purpose: provide a high-level view of overall business performance.

Includes:

- Total Sales
- Total Profit
- Total Units Sold
- Profit Margin %
- Sales Trend
- Profit Trend
- Top 5 Products by Sales
- Top 5 Stores by Sales
- Interactive filters
- Business insights and recommendations

### Page 2 — Product Analysis

Purpose: understand product-level sales, profitability, pricing, and cost performance.

Includes:

- Top 5 Best Selling Products
- Most Profitable Products
- Top 5 Highest Cost Products
- Product Price vs Total Profit
- Top 5 Highest Profit Margin Products
- Product Performance Overview
- Product sales/profit comparisons

### Page 3 — Store Analysis

Purpose: compare stores and cities by sales, profit, margin, contribution, and inventory.

Includes:

- Sales by Store
- Revenue Contribution by City
- Profit vs Sales
- Inventory Distribution Across Stores
- Average Sales Per Store by City
- Store Performance Overview
- Profit Margin by Store
- Profit Contribution by Store

### Page 4 — Inventory Analysis

Purpose: understand inventory quantity, inventory value, and inventory distribution.

Includes:

- Total Inventory
- Total Inventory Value
- Inventory Distribution by Category
- Average Inventory per Store
- Average Inventory per Product
- Inventory Distribution by Product
- Inventory Performance Overview

### Page 5 — Time Intelligence

Purpose: analyze recent-period performance, year-to-date results, and year-over-year trends.

Includes:

- Last 30 Days Sales
- Last 30 Days Profit
- Last 3 Months Sales
- Last 3 Months Profit
- YTD Sales
- YTD Profit
- Current Year vs Last Year Profit
- CY vs LY Sales
- CY vs LY Profit
- Sales Trend
- Profit Trend

## Data Modeling Approach

The project uses a star-schema style reporting model with fact and dimension concepts.

Typical business entities in the model include:

- **DimProducts** — product attributes such as product name, category, price, and cost
- **DimStores** — store attributes such as store name, city, location, and related store information
- **DimCalendar** — date and time attributes used for time intelligence
- **FactSales** — sales activity and units sold
- **FactInventory** — inventory quantities and inventory-related measures

The Power BI semantic model contains relationships between the fact and dimension tables, while DAX measures are used for reporting KPIs and calculations.

## Key DAX / Analytical Concepts Used

Examples of calculations used in the project include:

- Total Sales
- Total Profit
- Total Units Sold
- Profit Margin %
- Inventory Value
- Average Inventory per Store
- Average Inventory per Product
- Recent-period sales and profit
- Year-to-date sales and profit
- Current Year vs Last Year comparisons
- Top N product/store analysis

For calculations that require values from different related tables, iterator functions such as `SUMX()` were used together with model relationships where appropriate.

## Business Questions Answered

### Executive

- What are the total sales, profit, units sold, and margin?
- Which products and stores contribute most to sales?
- How are sales and profit trending?

### Products

- Which products sell the most units?
- Which products generate the most sales and profit?
- Which products have the highest cost?
- Which products have the highest profit margins?
- How does product price relate to total profit?

### Stores

- Which stores generate the highest sales and profit?
- Which cities perform best?
- What is the average sales per store in each city?
- Which stores have the highest margin or contribution?
- How is inventory distributed across stores?

### Inventory

- What is the current inventory and inventory value?
- Which categories and products hold the most inventory?
- What is the average inventory per store/product?
- Which products are relatively low or high in inventory?

### Time Intelligence

- What were sales and profit in the last 30 days?
- What were sales and profit in the last 3 months?
- What are the YTD results?
- How do current-year sales and profit compare with the previous year?

## Important Analytical Note on Inventory

The inventory visuals use **Top N ranking** to identify products with relatively low and high inventory levels. They should not be interpreted as formal "low stock" or "overstocked" conditions unless the business provides explicit inventory thresholds.

## Example Business Insights

The final report surfaces insights such as:

- Lego Bricks generates very high sales but comparatively lower profit than Colorbuds.
- Colorbuds combines high sales volume with strong profitability.
- Products with similar sales can have very different profit outcomes because of their cost structure.
- Some stores contribute more strongly to profit than others even when sales levels are similar.
- Inventory is concentrated in particular product categories and products.

These insights are intended to support marketing, supply, pricing, profitability, and inventory decisions.

## Publication

The completed report was published to Microsoft Fabric.

The final dashboard was then created by pinning report visuals into a dashboard for a consolidated view.

## Project Outcome

This project demonstrates an end-to-end Microsoft Fabric and Power BI workflow that combines:

- Data ingestion
- Lakehouse storage
- Pipeline-based data movement
- Warehouse modeling
- T-SQL validation
- SQL views
- Data transformation
- Semantic modeling
- DirectQuery / composite-model concepts
- DAX measures
- Interactive reporting
- Business insight generation
- Dashboard publication

## Author

**Shubham Gupta**

## Data Source

**Maven Analytics**

## Report Refresh

The report PDF identifies the last refresh as **August 2026**.
