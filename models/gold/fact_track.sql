{{ config(materialized='table') }}

with Track as (
    select * from {{ ref('stg_track') }} 
),
Album as (
    Select * From {{ ref('stg_album')}}
),
final as (
  SELECT t.TrackId,
    t.Name,
    t.MediaTypeId,
    t.GenreId,
    t.AlbumId,
    a.artistid,
    t.Milliseconds,
    t.Bytes,
    t.UnitPrice,
    a.prodyear
  FROM Track t
  LEFT JOIN ALBUM a ON t.ALBUMID=a.ALBUMID
)

select * from final