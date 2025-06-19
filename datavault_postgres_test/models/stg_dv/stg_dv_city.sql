with source_data as (
    select
        *
    from "sakila_db"."public"."stg_raw_city"
),

column_hash as (
    select
        *,
        {{ generate_hash(['city_id'], 'hk_city_h') }},
        {{ generate_hash(['country_id'], 'hk_country_h') }},
        {{ generate_hash(['city_id','country_id'], 'hk_city_country_l') }},
        {{ generate_hash(['city','last_update'], 'hd_city_s') }}
    from "sakila_db"."public"."stg_raw_city"
),

ghost_records as (
    select 
        0 as city_id,
        '(unknown)' as city,
        0 as country_id,
        to_timestamp('0001-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') as last_update,
        to_timestamp('0001-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') as ldts,
        '(unknown)' as rsrc,
        '00000000000000000000000000000000' as hk_city_h,
        '00000000000000000000000000000000' as hk_country_h,
        '00000000000000000000000000000000' as hk_city_country_l,
        '00000000000000000000000000000000' as hd_city_s
    union all
    select
        -1 as city_id,
        '(error)' as city,
        -1 as country_id,
        to_timestamp('8888-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS') as last_update,
        to_timestamp('8888-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS') as ldts,
        '(error)' as rsrc,
        'ffffffffffffffffffffffffffffffff' as hk_city_h,
        'ffffffffffffffffffffffffffffffff' as hk_country_h,
        'ffffffffffffffffffffffffffffffff' as hk_city_country_l,
        'ffffffffffffffffffffffffffffffff' as hd_city_s
),

selected_columns as (
    select * from column_hash
    union all
    select * from ghost_records
)

select * from selected_columns