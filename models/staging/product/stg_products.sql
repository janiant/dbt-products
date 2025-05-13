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
    p_retailprice as effective_from
from {{ source('product_data', 'part') }}
