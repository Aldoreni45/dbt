with dummy as(
    select 
    *,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY updated_at DESC) as rn
    from {{ source('my_source', 'raw_customer') }}
)
select
    customer_id, 
    customer_name,
    city, 
    updated_at 
from dummy
where rn = 1