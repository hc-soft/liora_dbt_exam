{{ config(materialized='view') }}

with track AS (
    SELECT * FROM  {{ ref( 'fact_track') }}
),
PLAYLISTTRACK AS (
    SELECT * FROM {{ ref( 'bridge_playlisttrack') }}
),
PLAYLIST AS (
    SELECT * FROM {{ ref( 'dim_playlist') }}
),
Artist AS (
    SELECT * FROM {{ ref( 'dim_artist') }}
),
final AS (
    SELECT DISTINCT pl.name
    FROM TRACK tf
    INNER JOIN PLAYLISTTRACK pt ON tf.trackid=pt.trackid
    INNER JOIN PLAYLIST pl on pt.playlistid=pl.playlistid
    INNER JOIN ARTIST a on tf.artistid=a.artistid
    WHERE a.birthyear<1990
)

SELECT * FROM final
