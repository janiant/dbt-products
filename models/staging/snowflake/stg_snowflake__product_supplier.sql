with source as (
    select * from {{ source('product_supplier', 'partsupp') }}
), 

renamed as (
    select
        ps_partkey as product_id,
        ps_suppkey as suppkey,
        ps_availqty as available_quantity,
        ps_supplycost as supply_cost,
        ps_comment as comment
    from source
)
    
select * from renamed