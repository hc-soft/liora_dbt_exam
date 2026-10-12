{{ config(materialized='table') }}

WITH track_composers AS (
    SELECT DISTINCT
        t.trackid,
        compos.value::string AS name
    FROM {{ source('bronze', 'track') }} t,
         LATERAL FLATTEN(INPUT => SPLIT(t.composer, ';')) compos
    WHERE compos.value IS NOT NULL

)

SELECT
    tc.trackid,
    c.composerid
FROM track_composers tc
INNER JOIN {{ ref('stg_composer') }} c
    ON tc.name = c.name