{{ config(materialized='view') }}

with track AS (
    SELECT * FROM {{ ref( 'fact_track') }}
),
genre AS (
    SELECT * FROM {{ ref( 'dim_genre') }}
),
trackcomposer AS (
    SELECT * FROM {{ ref( 'bridge_trackcomposer') }}
),
composer AS (
    SELECT * FROM {{ ref( 'dim_composer') }}
),
artist AS (
    SELECT * FROM {{ ref( 'dim_artist') }}
),
final AS (
    SELECT tf.name as Morceau, LISTAGG(c.Name,', ')  WITHIN GROUP (ORDER BY c.Name) as composer_names
    FROM track tf
    INNER JOIN genre g on tf.genreid=g.genreid
    LEFT JOIN trackcomposer tc ON tf.trackid=tc.trackid
    LEFT JOIN composer c ON tc.composerid=c.composerid
    LEFT JOIN artist a ON tf.artistid=a.artistid
    WHERE g.name IN ('Rock','Jazz')
    GROUP BY tf.TRACKID,tf.name
)

SELECT * FROM final
