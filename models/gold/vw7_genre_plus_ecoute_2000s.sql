{{ config(materialized='view') }}

with track AS (
    SELECT * FROM  {{ ref( 'fact_track') }}
),
genre AS (
    SELECT * FROM {{ ref( 'dim_genre') }}
),
final AS (
    -- Donnez le genre de musique le plus écouté dans les années 2000.
    -- Annes 2000 -> 2000 a 2009
        SELECT g.name, Count(*) as Nombre_Morceau
        FROM TRACK tf 
        INNER JOIN Genre g On tf.genreid=g.genreid
        WHERE tf.prodyear between 2000 and 2009
        GROUP BY g.name
        ORDER BY 2 DESC
)

SELECT * FROM final
