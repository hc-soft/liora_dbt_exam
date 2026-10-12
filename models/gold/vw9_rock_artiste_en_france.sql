{{ config(materialized='view') }}

with track AS (
    SELECT * FROM {{ ref( 'fact_track') }}
),
genre AS (
    SELECT * FROM {{ ref( 'dim_genre') }}
),
album AS (
    SELECT * FROM {{ ref( 'dim_album') }}
),
artist AS (
    SELECT * FROM {{ ref( 'dim_artist') }}
),
final AS (
    -- Q9
    -- Donnez les morceaux de Rock dont les artistes sont en France.
    SELECT tf.Name as Track_name, a.name as artist_name
    FROM TRACK tf
    INNER JOIN Genre g on tf.genreid=g.genreid
    INNER JOIN album aa on tf.albumid=aa.albumid
    INNER JOIN artist a on aa.artistid= a.artistid
    WHERE g.name='Rock' AND a.country='France'
)

SELECT * FROM final
