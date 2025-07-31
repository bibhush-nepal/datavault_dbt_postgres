{%- set yaml_metadata -%}
source_model: stg_raw_store
hashed_columns: 
    hk_store_h:
        - store_id
    hd_store_s:
        is_hashdiff: true
        columns:
          - last_update
    hk_address_h:
        - address_id
    hk_store_address_l:
        - store_id
        - address_id
    hk_staff_h:
        - manager_staff_id
    hk_store_manager_staff_l:
        - store_id
        - manager_staff_id
    hd_store_manager_staff_es:
        is_hashdiff: true
        columns:
          - last_update
ldts: ldts
rsrc: rsrc
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict['source_model'],
                    ldts=metadata_dict['ldts'],
                    rsrc=metadata_dict['rsrc'],
                    hashed_columns=metadata_dict['hashed_columns'],
                    derived_columns=none,
                    missing_columns=none,
                    prejoined_columns=none,
                    include_source_columns=true) }}