select *,
    current_timestamp as ldts,
    'sakila_db.public.payment' as rsrc
from {{ source('public','payment') }}