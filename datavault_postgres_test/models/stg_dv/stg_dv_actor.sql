with source_data as (
    select
        *
    from "sakila_db"."public"."stg_raw_actor"
),

column_hash as (
    select
        *,
        {{ generate_hash(['actor_id'], 'hk_actor_h') }},
        {{ generate_hash(['first_name', 'last_name', 'last_update'], 'hd_actor_h') }}
    from "sakila_db"."public"."stg_raw_actor"
),

{{ generate_ghost_records(
    regular_columns=[
        {'name': 'actor_id', 'dtype': 'integer'},
        {'name': 'first_name', 'dtype': 'text'},
        {'name': 'last_name', 'dtype': 'text'},
        {'name': 'last_update', 'dtype': 'timestamp'},
        {'name': 'ldts', 'dtype': 'timestamp'},
        {'name': 'rsrc', 'dtype': 'text'}
    ],
    hash_columns=[
        {'name': 'hk_actor_h'},
        {'name': 'hd_actor_s'}
    ]
) }}

selected_columns as (
    select * from column_hash
    union all
    select * from ghost_records
)

select * from selected_columns