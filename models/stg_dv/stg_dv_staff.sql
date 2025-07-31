{%- set yaml_metadata -%}
source_model: stg_raw_staff
hashed_columns: 
    hk_staff_h:
        - staff_id
    hd_staff_n_s:
        is_hashdiff: true
        columns:
          - last_update
          - active
    hd_staff_p_s:
        is_hashdiff: true
        columns:
          - first_name
          - last_name
          - email
          - username
          - password
          - picture
    hk_address_h:
        - address_id
    hk_staff_address_l:
        - staff_id
        - address_id
    hk_store_h:
        - store_id
    hk_staff_store_l:
        - staff_id
        - store_id
    hd_staff_store_es:
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