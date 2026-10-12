{{ config(materialized='view') }}

with track AS (
    SELECT * FROM  {{ ref( 'fact_track') }}
),
genre AS (
    SELECT * FROM {{ ref( 'dim_genre') }}
),
final AS (
    -- Q10
    -- Donnez la moyenne des tailles des morceaux par genre musical.
    SELECT g.name, ROUND(AVG(tf.milliseconds/60000),2) as Duree_Moyenne
    FROM TRACK tf 
    INNER JOIN Genre g ON tf.genreid=g.genreid
    GROUP BY g.name
)

SELECT * FROM final
