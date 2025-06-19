with source_data as (
    select
        *
    from "sakila_db"."public"."stg_raw_category"
),

column_hash as (
    select
        *,
        {{ generate_hash(['category_id'], 'hk_category_h') }},
        {{ generate_hash(['name','last_update'], 'hd_category_h') }}
    from "sakila_db"."public"."stg_raw_category"
),

ghost_records as (
    select 
        0 as category_id,
        '(unknown)' as name,
        to_timestamp('0001-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') as last_update,
        to_timestamp('0001-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') as ldts,
        '(unknown)' as rsrc,
        '00000000000000000000000000000000' as hk_category_h,
        '00000000000000000000000000000000' as hd_category_s
    union all
    select
        -1 as category_id,
        '(error)' as name,
        to_timestamp('8888-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS') as last_update,
        to_timestamp('8888-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS') as ldts,
        '(error)' as rsrc,
        'ffffffffffffffffffffffffffffffff' as hk_category_h,
        'ffffffffffffffffffffffffffffffff' as hd_category_s
),

selected_columns as (
    select * from column_hash
    union all
    select * from ghost_records
)

select * from selected_columns