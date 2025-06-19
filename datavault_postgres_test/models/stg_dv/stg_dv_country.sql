with source_data as (
    select
        *
    from "sakila_db"."public"."stg_raw_country"
),

column_hash as (
    select
        *,
        MD5(CONCAT(COALESCE(TRIM(CAST(country_id as TEXT)),'^^'))) as hk_country_h,
        MD5(CONCAT(
            COALESCE(TRIM(CAST(country as TEXT)),'^^'),'||',
            COALESCE(TRIM(CAST(last_update as TEXT)),'^^')
        )) as hd_country_s
    from "sakila_db"."public"."stg_raw_country"
),

ghost_records as (
    select 
        0 as country_id,
        '(unknown)' as country,
        to_timestamp('0001-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') as last_update,
        to_timestamp('0001-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') as ldts,
        '(unknown)' as rsrc,
        '00000000000000000000000000000000' as hk_country_h,
        '00000000000000000000000000000000' as hd_country_s
    union all
    select
        -1 as country_id,
        '(error)' as country,
        to_timestamp('8888-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS') as last_update,
        to_timestamp('8888-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS') as ldts,
        '(error)' as rsrc,
        'ffffffffffffffffffffffffffffffff' as hk_country_h,
        'ffffffffffffffffffffffffffffffff' as hd_country_s
),

selected_columns as (
    select * from column_hash
    union all
    select * from ghost_records
)

select * from selected_columns