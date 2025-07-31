select *,
    current_timestamp as ldts,
    'sakila_db.public.customer' as rsrc
from {{ source('public','customer') }}