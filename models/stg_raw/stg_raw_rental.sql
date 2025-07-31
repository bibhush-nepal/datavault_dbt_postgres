select *,
    current_timestamp as ldts,
    'sakila_db.public.rental' as rsrc
from {{ source('public','rental') }}