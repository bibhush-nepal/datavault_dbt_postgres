select 
    *,
    current_timestamp as ldts,
    'sakila_db.public.category' as rsrc
from {{ source('public','category') }}