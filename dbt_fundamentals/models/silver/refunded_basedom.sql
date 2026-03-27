with bronze_returns as(
    select
    *
    from  {{ref('fact_returns')}}
),
bronze_product as(
    select
    *
    from  {{ref('dim_product')}}
),
bronze_date as(
    select
    *
    from  {{ref('dim_date')}}
),
bronze_store as(
    select
    *
    from  {{ref('dim_store')}}
),
bronze_sales as(
    select
    *
    from  {{ref('fact_sales')}}
)
select
    r.*, 
    p.product_sk as product_sk_dim,
    d.date_sk as date_sk_dim,
    s.sales_id as sales_id_dim,
    ss.store_sk as store_sk_dim
from bronze_returns r
left join bronze_product p
    on r.product_sk = p.product_sk
left join bronze_date d
    on r.date_sk = d.date_sk
left join bronze_sales s
    on r.sales_id = s.sales_id
left join bronze_store ss
    on r.store_sk = ss.store_sk
