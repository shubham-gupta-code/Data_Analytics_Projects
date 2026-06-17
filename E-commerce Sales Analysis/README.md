# E-Commerce Sales Analysis

## Problem Statement
No problem statement, Just for practice

### Steps followed 
- Step 1 : Bringing CSV data into Google BigQuery
- Step 2 : Data is already cleaned. So directly started writing sql queries
- Step 3 : Getting insights from the query results and making decisions based on that results


# Insights

Following inferences can be drawn from the SQL Query results;
- Defining sales funnel and different stages:
<img width="772" height="77" alt="Screenshot 2026-06-04 222222" src="https://github.com/user-attachments/assets/0614a876-be98-4dd8-935a-cd6af84129a8" />

      In the above image we can see that how users from viewing the product to actually purchasing
        5000 users view the product
        826 users actually purchased the product

- Conversion rates through the funnel
<img width="1241" height="48" alt="Screenshot 2026-06-04 223205" src="https://github.com/user-attachments/assets/8f098553-3cd8-48a2-88da-5c399ef9622b" />

In this we can see the conversion rates of the users at different stages
      
      The lowest conversion rate is between 'views' and 'cart'
      
- Funnel by sources
<img width="980" height="131" alt="image" src="https://github.com/user-attachments/assets/61903f3f-dc9b-4b5f-ba85-f428ab9ab226" />

Most users traffic are organically but email source has high rate of purchasing the product.
All the sources has same 'cart to purchase' rate which is ~50%

      They should double down the Email Marketing as they have high rate to buy the product
      And should less focus on social marketing as they have low purchasing rate

- Time to conversion analysis
<img width="731" height="53" alt="image" src="https://github.com/user-attachments/assets/04b91610-24dd-432e-a190-522a09d1d8b6" />

      They have 826 users who has purchased the product
      Each customer averagely adding the item in cart after spending ~11 minutes of viewing product
      From the cart, users purchase the item after ~14 minutes averagely
      Overall from viewing the product to purchase it, users spends ~25 minutes averagely

- Revenue Funnnel Analysis
<img width="781" height="53" alt="image" src="https://github.com/user-attachments/assets/b81e8cb8-b912-4ede-ae31-63205f457eed" />

      Total Revenue: ~$88000
      Revenue per buyer: $106.51
      Revenue per visitor: 17.6

