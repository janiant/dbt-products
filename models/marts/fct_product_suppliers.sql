select * 
from {{ ref('int_top_3_suppliers', version=1) }}
