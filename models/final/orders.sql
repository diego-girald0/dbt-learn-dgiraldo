{{
  config(
    materialized='table',
    schema = 'jaffle_shop'
  )
}}

select 
  o.order_id
  , o.order_date
  , o.customer_id
  , SUM(p.amount) AS amount 

from {{ ref('stg_orders') }} o
join {{ ref('stg_payments') }} p 
on o.order_id = p.order_id
group by 1,2,3
order by order_id