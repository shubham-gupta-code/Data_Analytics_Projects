SELECT * FROM `project-f5c652cc-0001-48b1-b17.1.User Events` LIMIT 1000

--- 1) Define sales funnel and the different stages

with funnel_stages as (
  SELECT
    count(distinct case when event_type = 'page_view' then user_id END) as stage_1_views,
    count(distinct case when event_type = 'add_to_cart' then user_id END) as stage_2_cart,
    count(distinct case when event_type = 'checkout_start' then user_id END) as stage_3_checkout,
    count(distinct case when event_type = 'payment_info' then user_id END) as stage_4_payment,
    count(distinct case when event_type = 'purchase' then user_id END) as stage_5_purchase

    FROM `project-f5c652cc-0001-48b1-b17.1.User Events`

    where event_date >= timestamp(DATE_SUB(current_date(), INTERVAL 150 DAY))
)

SELECT * FROM funnel_stages


--- 2) Conversion rates through the funnel

with funnel_stages as (
  SELECT
    count(distinct case when event_type = 'page_view' then user_id END) as stage_1_views,
    count(distinct case when event_type = 'add_to_cart' then user_id END) as stage_2_cart,
    count(distinct case when event_type = 'checkout_start' then user_id END) as stage_3_checkout,
    count(distinct case when event_type = 'payment_info' then user_id END) as stage_4_payment,
    count(distinct case when event_type = 'purchase' then user_id END) as stage_5_purchase

    FROM `project-f5c652cc-0001-48b1-b17.1.User Events`

    where event_date >= timestamp(DATE_SUB(current_date(), INTERVAL 150 DAY))
)

SELECT 

  stage_1_views,
  stage_2_cart,
  ROUND(stage_2_cart * 100 / stage_1_views) as view_to_cart_rate,
  stage_3_checkout,
  ROUND(stage_3_checkout * 100 / stage_2_cart) as cart_to_checkout_rate,
  stage_4_payment,
  ROUND(stage_4_payment * 100 / stage_3_checkout) as checkout_to_payment_rate,
  stage_5_purchase,
  ROUND(stage_5_purchase * 100 / stage_4_payment) as payment_to_purchase_rate,

  ROUND(stage_5_purchase * 100 / stage_1_views) as overall_conversion_rate

FROM funnel_stages


--- 3) funnel by source

select traffic_source, count(distinct user_id) from `project-f5c652cc-0001-48b1-b17.1.User Events`
group by traffic_source

WITH source_funnel as (
SELECT
  traffic_source,
  count(distinct case when event_type = 'page_view' then user_id END) as views,
  count(distinct case when event_type = 'add_to_cart' then user_id END) as carts,
  count(distinct case when event_type = 'purchase' then user_id END) as purchases

FROM `project-f5c652cc-0001-48b1-b17.1.User Events`
group by traffic_source
)

select
  traffic_source,
  views,
  carts,
  purchases,
  ROUND(carts * 100 / views) as cart_conversion_rate,
  ROUND(purchases * 100 / views) as purchase_conversion_rate,
  ROUND(purchases * 100 / carts) as cart_to_purchase_conversion_rate

from source_funnel
order by purchases


--- 4) Time to conversion analysis

WITH user_journey AS (
  SELECT
    user_id,
    MIN(CASE WHEN event_type = 'page_view' THEN event_date END) as view_time,
    MIN(CASE WHEN event_type = 'add_to_cart' THEN event_date END) as cart_time,
    MIN(CASE WHEN event_type = 'purchase' THEN event_date END) as purchase_time
  from `project-f5c652cc-0001-48b1-b17.1.User Events`

  GROUP BY user_id
  HAVING MIN(CASE WHEN event_type = 'purchase' THEN event_date END) is not null
)

select

  COUNT(*) as converted_users,
  ROUND(AVG(TIMESTAMP_DIFF(cart_time, view_time, MINUTE)),2) as avg_view_to_cart_minutes,
  ROUND(AVG(TIMESTAMP_DIFF(purchase_time, cart_time, MINUTE)),2) as avg_cart_to_purchase_minutes,
  ROUND(AVG(TIMESTAMP_DIFF(purchase_time, view_time, MINUTE)),2) as avg_total_journey_minutes,
  

from user_journey


--- 5) Revenue Funnnel Analysis

WITH revenue_funnel as (
  SELECT
    COUNT(DISTINCT CASE WHEN event_type = 'page_view' THEN user_id END) as total_visitors,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) as total_buyers_or_orders,
    SUM(CASE WHEN event_type = 'purchase' THEN amount END) as total_revenue,

  FROM `project-f5c652cc-0001-48b1-b17.1.User Events`

  WHERE event_date >= TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 150 DAY))

)

SELECT 
  total_visitors,
  total_buyers_or_orders,
  total_revenue,
  total_revenue / total_buyers_or_orders AS revenue_per_buyer_or_order,
  total_revenue / total_visitors AS revenue_per_visito,

FROM revenue_funnel

