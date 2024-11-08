{{ config(materialized='view') }}

with stg_orders as (
    select 
        order_id
        , customer_id
        , order_status
        , CAST(order_purchase_timestamp AS DATE) AS order_date
        , CAST(order_purchase_timestamp AS TIME) AS order_datetime
        , order_approved_at
        , order_delivered_carrier_date
        , order_delivered_customer_date
        , CAST(order_estimated_delivery_date AS DATE) AS order_estimated_delivery_date
    from {{ source('dbt_arthurblb', 'olist_orders_dataset') }} --`olist-422022.dbt_arthurblb.olist_orders_dataset`
)

select *
from stg_orders
