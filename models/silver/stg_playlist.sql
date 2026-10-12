{{ config(materialized='view') }}

select *
from {{ source('bronze', 'playlist') }}