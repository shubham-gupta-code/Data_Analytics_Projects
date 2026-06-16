
# AtliQ Hardware Sales Analysis

### Dashboard Link : https://app.powerbi.com/groups/226c7e02-a7c1-4019-ac13-cb4b544d36af/dashboards/44fdb3ae-7854-4725-a5f9-522c290ab782?experience=power-bi

## Problem Statement
AtliQ Hardware facing low sales so their sales manager wants to identify the key reasons where they facing heavy reduction in sales.

### Steps followed 

- Step 1 : Bringing data to Power BI Desktop from Microsoft SQL Server.
- Step 2 : There are few sales occurred in USD currency, created a normalized sales amount column which have all sales currency in INR
- Step 3 : Created another 2 column 'profit margin' (using sales amount & profit margin % column) AND 'cost price' (using sales amount & profit margin column)
- Step 4 : Started creating report and finding key insights such as total sales, total quantity sold, sales trend, revenue generated in different markets, quantity sold in different markets and top 5 customers/products.
- Step 5 : In the 2nd page report analyzed the profit of the business by creating useful visuals such as total profit margin, profit trend, revenue & profit contribution percentage for all the markets.
- Step 6 : And lastly in 3rd report the business performance analyzed by showing the profit margin %, profit % by zone, revenue comparisona & profit trend as well the customer's revenue and profit contribution. Also created a parameter as a slicer which is able to show which zone has completed the profit target in percentage (used conditional formatting).

# Snapshot of Dashboard (Power BI Service)
<img width="1787" height="562" alt="Screenshot 2026-06-16 131108" src="https://github.com/user-attachments/assets/dace88c0-0c68-4c4e-b310-075289556eca" />

# Report Snapshot (Power BI DESKTOP)

## Page 1
<img width="1267" height="711" alt="Screenshot 2026-06-16 130818" src="https://github.com/user-attachments/assets/c650c362-6453-44a3-8931-e14848a2dbc8" />

## Page 2
<img width="1271" height="712" alt="Screenshot 2026-06-16 130829" src="https://github.com/user-attachments/assets/464857fb-6199-4b0c-9b4b-6327bd942d12" />

## Page 3
<img width="1266" height="712" alt="Screenshot 2026-06-16 130838" src="https://github.com/user-attachments/assets/c56200ef-4370-403d-bb67-9bdab961b7ef" />


# Insights

Following inferences can be drawn from the dashboard:
### [1] Revenue/Sales
- ~$985 million revenue generated
- Top 3 high revenue contribution markets Delhi NCR (~53%), Mumbai (~15%), and Ahmedabad (~13%)
- The peak revenue is in 2018 (+345% than 2017) but after that constantly reducing from 2019 (-18% than 2018),
  But the profit is increased in 2019 around $1 million even less revenue generated than previous year (2018)
- Highest Revenue/Profit Contribution by Customer: Electricalsara has 42% of revenue contribution and 37.7% of profit contribution
- Brick & Mortar products has higher revenue and sales quantity

### [2] Profit Margin
- ~$24 million profit out of total revenue of ~$985 million
- 2.5% total profit margin
- Delhi NCR has ~50% of contribution in profit out of total profit
- Surat has highest rate of profit margin (~5%) out of its total revenue
- Profit trend shows $10 million profit in 2019 and only $2 million in 2020 Jan to Jun (6 months) whereas year 2019 Jan to Jun has $6 million profit margin (3x more than 2020).
- Bengaluru are not generating profit in fact it is ~20% in loss.
- Leader, Electricalsquipo Stores, & Power has high profit margin percentage (~7%) but they have only ~1% of contribution in revenue
- Central zone has high profit margin percent

## Business Decisions
1. Increase profit margin percent in Delhi NCR, Mumbai, and Ahmedabad because they are generating most of the revenue especially 'Delhi NCR' (more than 50%).
2. Find same domain or customers as Electricalsara because they giving more sales or you can look at different customers at same location as Electricalsara to generate more revenue.
3. Find the factors (discount, ads, offers, etc.) that is applied in 2018 to increase revenue.
4. Increase Brick & Mortar productions because they are generating most of the sales.
5. Increase the sales in Surat because of high profit margin percent from there.
6. Decrease the sales or try diffferent strategy in Bengaluru to increase sales.
7. Increase sales in Central zone to generate more profit.
