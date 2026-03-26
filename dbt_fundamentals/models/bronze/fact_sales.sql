select
  *
from {{ source('my_source', 'fact_sales') }}
