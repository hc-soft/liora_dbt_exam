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
final AS (
    -- Q8
    -- Donnez les noms de toutes les playlists où figurent des morceaux de plus de 4 minutes.
    SELECT DISTINCT pl.name
    FROM TRACK tf
    INNER JOIN PLAYLISTTRACK pt ON tf.trackid=pt.trackid
    INNER JOIN PLAYLIST pl on pt.playlistid=pl.playlistid
    WHERE tf.milliseconds> 4 * 60 * 1000
)

SELECT * FROM final
