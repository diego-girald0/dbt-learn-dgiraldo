with raw as (
    select 
    id,
    orderid,
    paymentmethod,
    status,
    amount,
    created

from {{ source('stripe','payment') }}
)

select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as status,
    amount as amount,
    created as created_at

from raw