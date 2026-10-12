{{ config(materialized='view') }}

with track AS (
    SELECT * FROM  {{ ref( 'fact_track') }}
),
album AS (
    SELECT * FROM {{ ref( 'dim_album') }}
),
final AS (
    SELECT a.title, SUM(tf.milliseconds/60000) Duree_minutes
    FROM TRACK tf
    INNER JOIN ALBUM a ON tf.albumid=a.albumid
    GROUP BY a.title
    ORDER BY 1 DESC LIMIT 10
    )

SELECT * FROM final
