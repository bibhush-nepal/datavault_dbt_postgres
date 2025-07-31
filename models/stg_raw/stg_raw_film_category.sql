select *,
    current_timestamp as ldts,
    'sakila_db.public.film_category' as rsrc
from {{ source('public','film_category') }}