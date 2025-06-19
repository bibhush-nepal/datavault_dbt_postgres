select *,
    current_timestamp as ldts,
    'sakila_db.public.film' as rsrc
from {{ source('public','film') }}