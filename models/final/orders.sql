{{
  config(
    materialized='view'
  )
}}

select 
  o.order_id,
  , o.order_date
  , o.customer_id
  , o.order_status
  , p.payment_status
  , p.amount 

from {{ ref('stg_orders') }} o
join {{ ref('stg_payments') }} p 
on o.order_id = p.order_id
order by customer_id, order_id