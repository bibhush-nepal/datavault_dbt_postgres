select *,
    current_timestamp as ldts,
    'sakila_db.public.staff' as rsrc
from {{ source('public','staff') }}