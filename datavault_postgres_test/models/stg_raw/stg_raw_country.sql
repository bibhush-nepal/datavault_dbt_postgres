select *,
    current_timestamp as ldts,
    'sakila_db.public.country' as rsrc
from {{ source('public','country') }}