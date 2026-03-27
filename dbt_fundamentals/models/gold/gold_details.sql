{{ config(
    materialized='incremental',
    unique_key='customer_id'
) }}

SELECT
    customer_id,
    customer_name,
    city,
    email,
    updated_at
FROM {{ source('my_source', 'raw_details') }}

{% if is_incremental() %}

WHERE updated_at > (
    SELECT COALESCE(MAX(updated_at), '1900-01-01')
    FROM {{ this }}
)

{% endif %}