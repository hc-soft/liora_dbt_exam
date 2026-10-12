{{ config(materialized='view') }}

with track AS (
    SELECT * FROM  {{ ref( 'fact_track') }}
),
artist AS (
    SELECT * FROM {{ ref( 'dim_artist') }}
),
final AS (
    SELECT a.name Artist, count(trackid) as Nombre_Morceaux
    FROM track tf 
    Inner Join artist a on tf.artistid=a.artistid
    GROUP BY a.name
)

SELECT * FROM final
