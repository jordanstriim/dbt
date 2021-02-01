
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with dbt_lineitem as (

    select CAST(TRUNC(_l_extendedprice * ((RAND()*10000) + (RAND()*1000) + (RAND()*100)), 0) as INT64) as rand_price,
    _l_orderkey____ as orderkey,
    CAST(TRUNC(_l_quantity * (RAND()*100), 0) as INT64) as quantity,
    CONCAT(_l_shipinstruct, 'ions DBT!') instructions,
    CAST(TRUNC(_l_suppkey * (RAND()*100), 0) as INT64) as suppkey,
    from `ancient-yeti-175123.mysql_rds_mysql_demo.lineitem`

)

select *
from dbt_lineitem

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
