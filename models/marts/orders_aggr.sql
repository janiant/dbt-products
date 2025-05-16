select * from {{ source('sales_data', 'fct_sales_order_value') }}
