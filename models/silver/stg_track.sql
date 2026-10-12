{{ config(materialized='table') }}

with Track as (
    select * from {{ source('bronze', 'track') }} 
)

-- Remove Composer as Composer list put in external table
select TrackId,
    Name,
    AlbumId,
    MediaTypeId,
    GenreId,
    Milliseconds,
    Bytes,
    UnitPrice from Track