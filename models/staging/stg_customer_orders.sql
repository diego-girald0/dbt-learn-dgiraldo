select
    customer_id
    , min(order_date) as first_order_date
    , max(order_date) as most_recent_order_date
    , count(order_id) as number_of_orders
    , sum(amount) as lifetimevalue
    
from {{ ref('orders') }}
group by 1