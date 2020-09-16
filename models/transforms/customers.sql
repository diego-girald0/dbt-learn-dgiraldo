{{
  config(
    materialized='view'
  )
}}

with final as (
    select
        c.customer_id,
        c.first_name,
        c.last_name,
        co.first_order_date,
        co.most_recent_order_date,
        coalesce(co.number_of_orders, 0) as number_of_orders,
        coalesce(lifetimevalue,0) as lifetimevalue
    from {{ ref('stg_customers') }} c
    left join  {{ ref('stg_customer_orders') }} co 
    on  c.customer_id = co.customer_id
)

select * 
from final