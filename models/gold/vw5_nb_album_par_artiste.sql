{{ config(materialized='view') }}

with album AS (
    SELECT * FROM {{ ref( 'dim_album') }}
),
artist AS (
    SELECT * FROM {{ ref( 'dim_artist') }}
),
final AS (
    SELECT ar.name, Count(distinct al.albumid) as Nombre_Album
    FROM ALBUM al 
    INNER JOIN ARTIST ar ON al.artistid=ar.artistid
    GROUP BY ar.name
)

SELECT * FROM final
