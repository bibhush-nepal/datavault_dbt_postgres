select *,
    current_timestamp as ldts,
    'sakila_db.public.actor' as rsrc
from {{ source('public','actor') }}