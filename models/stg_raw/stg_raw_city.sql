select *,
    current_timestamp as ldts,
    'sakila_db.public.city' as rsrc
from {{ source('public','city') }}