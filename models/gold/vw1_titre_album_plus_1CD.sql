{{ config(materialized='view') }}

with track AS (
    SELECT * FROM  {{ ref( 'fact_track') }}
),
album AS (
    SELECT * FROM {{ ref( 'dim_album') }}
),
final AS (
SELECT a.albumid, a.title, ROUND(SUM(Milliseconds) / 60000, 2) AS duree_minutes,ROUND(SUM(MILLISECONDS)/4800000)+1 as Nombre_CD, Count(Trackid) as Nombre_Track
FROM track tf 
INNER JOIN album a on tf.albumid=a.albumid
WHERE mediatypeid in (2,4,5)   -- Je ne prend que les Audio pas les Video/Serie car Album=Audio pas serie
GROUP BY a.albumid, a.title
HAVING (SUM(MILLISECONDS)>4800000)  -- Depasse la duree max d'un CD Audio
)

SELECT * FROM final