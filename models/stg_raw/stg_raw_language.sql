select *,
    current_timestamp as ldts,
    'sakila_db.public.language' as rsrc
from {{ source('public','language') }}