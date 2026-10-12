{{ config(materialized='table') }}

with Track as (
    select * from {{ source('bronze', 'track') }} 
),
final as (
    SELECT
        ROW_NUMBER() OVER (ORDER BY Name) AS ComposerId,
        Name
    FROM (
        SELECT DISTINCT
            compos.value::string AS Name
        FROM Track,
            LATERAL FLATTEN(INPUT => SPLIT(composer, ';')) compos
    )
    WHERE Name != 'nan'
)

select * from final