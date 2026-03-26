select
  *
from {{ source('my_source', 'dim_product') }}
