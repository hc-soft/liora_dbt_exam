{{ config(materialized='view') }}

with track AS (
    SELECT * FROM  {{ ref( 'fact_track') }}
),
album AS (
    SELECT * FROM {{ ref( 'dim_album') }}
),
final AS (
    SELECT tf.name as Title
    FROM track tf
    INNER JOIN album a ON tf.albumid=a.albumid
    WHERE a.prodyear in (2000,2002)
)
SELECT * FROM final