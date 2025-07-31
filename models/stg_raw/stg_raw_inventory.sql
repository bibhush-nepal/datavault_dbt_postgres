select *,
    current_timestamp as ldts,
    'sakila_db.public.inventory' as rsrc
from {{ source('public','inventory') }}