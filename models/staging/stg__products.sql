{{ config(materialized='view') }}

with 
  stg__products as (
    select
      product_id
      , product_category_name
      , product_name_lenght as product_name_length
      , product_description_lenght as product_description_length
      , product_photos_qty
      , product_weight_g as product_weight
      , product_length_cm as product_length
      , product_height_cm as product_height
      , product_width_cm as product_width_cm
    from `dbt_arthurblb.olist_products_dataset`
  )

select *
from stg__products
