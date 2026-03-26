SELECT *
FROM {{ ref('dim_product') }}
WHERE list_price < 0