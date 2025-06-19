select *,
    current_timestamp as ldts,
    'sakila_db.public.film_actor' as rsrc
from {{ source('public','film_actor') }}