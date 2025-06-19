with source_data as (
    select
        *
    from "sakila_db"."public"."stg_raw_address"
),

column_hash as (
    select
        *,
        MD5(COALESCE(TRIM(CAST(address_id as TEXT)),'^^')) as hk_address_h,
        MD5(COALESCE(TRIM(CAST(city_id as TEXT)),'^^')) as hk_city_h,
        MD5(CONCAT(
            COALESCE(TRIM(CAST(address_id as TEXT)),'^^'),'||', 
            COALESCE(TRIM(CAST(city_id as TEXT)),'^^')
        )) as hk_address_city_l,
        MD5(CONCAT(
            COALESCE(TRIM(CAST(address as TEXT)),'^^'),'||',
            COALESCE(TRIM(CAST(address2 as TEXT)),'^^'),'||',
            COALESCE(TRIM(CAST(district as TEXT)),'^^'),'||',
            COALESCE(TRIM(CAST(postal_code as TEXT)),'^^'),'||',
            COALESCE(TRIM(CAST(phone as TEXT)),'^^'),'||',
            COALESCE(TRIM(CAST(last_update as TEXT)),'^^')
        )) as hd_address_s
    from "sakila_db"."public"."stg_raw_address"
),

ghost_records as (
    select 
        0 as address_id,
        '(unknown)' as address,
        '(unknown)' as address2,
        '(unknown)' as district,
        0 as city_id,
        '(unknown)' as postal_code,
        '(unknown)' as phone,
        to_timestamp('0001-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') as last_update,
        to_timestamp('0001-01-01 00:00:01', 'YYYY-MM-DD HH24:MI:SS') as ldts,
        '(unknown)' as rsrc,
        '00000000000000000000000000000000' as hk_address_h,
        '00000000000000000000000000000000' as hk_city_h,
        '00000000000000000000000000000000' as hk_address_city_l,
        '00000000000000000000000000000000' as hd_address_s
    union all
    select
        -1 as address_id,
        '(error)' as address,
        '(error)' as address2,
        '(error)' as district,
        0 as city_id,
        '(error)' as postal_code,
        '(error)' as phone,
        to_timestamp('8888-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS') as last_update,
        to_timestamp('8888-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS') as ldts,
        '(error)' as rsrc,
        'ffffffffffffffffffffffffffffffff' as hk_address_h,
        'ffffffffffffffffffffffffffffffff' as hk_city_h,
        'ffffffffffffffffffffffffffffffff' as hk_address_city_l,
        'ffffffffffffffffffffffffffffffff' as hd_address_s
),

selected_columns as (
    select * from column_hash
    union all
    select * from ghost_records
)

select * from selected_columns