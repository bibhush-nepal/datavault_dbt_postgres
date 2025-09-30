{%- set yaml_metadata -%}
parent_hashkey: 'hk_address_filmworld_h'
src_hashdiff: 'hd_address_filmworld_p_s'
src_payload:
    - address
    - address2
    - district
    - city_id
    - postal_code
    - phone
    - last_update
source_model: stg_dv_address
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set parent_hashkey = metadata_dict['parent_hashkey'] -%}
{%- set src_hashdiff = metadata_dict['src_hashdiff'] -%}
{%- set source_model = metadata_dict['source_model'] -%}
{%- set src_payload = metadata_dict['src_payload'] -%}


{{ datavault4dbt.sat_v0(parent_hashkey=parent_hashkey,
                        src_hashdiff=src_hashdiff,
                        source_model=source_model,
                        src_payload=src_payload) }}