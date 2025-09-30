{%- set yaml_metadata -%}
parent_hashkey: 'hk_rental_inventory_customer_staff_filmworld_l'
src_hashdiff: 'hd_rental_inventory_customer_staff_filmworld_n_es'
src_payload:
    - last_update
source_model: stg_dv_rental
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