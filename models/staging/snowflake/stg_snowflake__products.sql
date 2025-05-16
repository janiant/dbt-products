{{ config(
    materialized='incremental',
    unique_key='product_id',
    on_schema_change='fail'
) }}

with source as (

    select * from 
    {{ source('product_data', 'part') }}
    
    ), 

renamed as (
    select
    p_partkey as product_id,
    p_name as product_name,
    p_mfgr as manufacturer,
    p_brand as brand,
    p_type as product_type,
    p_size as size,
    p_container as container,
    cast(p_retailprice as number) as retail_price,
    p_comment as comment,
    current_timestamp()::timestamp_ntz as record_inserted_at,
    current_timestamp()::timestamp_ntz as effective_from
from source
)

select * from renamed 

{% if is_incremental() %}
where record_inserted_at > (select max(record_inserted_at) from {{ this }})
{% endif %}
