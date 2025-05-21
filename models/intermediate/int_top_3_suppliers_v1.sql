
with products as (
    select * from {{ ref('stg_salesforce__products') }}
),

suppliers as (
    select * from {{ ref('stg_salesforce__product_supplier') }}
)

select 
    s.suppkey, 
    count(distinct p.product_id) as product_count
from products p
join suppliers s on p.product_id = s.product_id
group by s.suppkey
order by product_count desc
limit 3
