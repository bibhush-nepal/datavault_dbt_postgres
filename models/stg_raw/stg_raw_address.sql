select *,
    current_timestamp as ldts,
    'sakila_db.public.address' as rsrc
from {{ source('public','address') }}