select
    id as payment_id
    , orderid as order_id
    , paymentmethod as payment_method
    , status as payment_status
    , amount/100 as amount -- Changing amount to dollars
    , created as created_at

from {{ source('stripe','payment') }}
where payment_status = 'success'