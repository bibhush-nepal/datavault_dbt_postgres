select *,
    current_timestamp as ldts,
    'sakila_db.public.store' as rsrc
from {{ source('public','store') }}