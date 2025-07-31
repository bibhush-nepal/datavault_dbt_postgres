{%- set yaml_metadata -%}
source_model: stg_raw_customer
hashed_columns: 
    hk_customer_h:
        - customer_id
    hd_customer_p_s:
        is_hashdiff: true
        columns:
            - first_name
            - last_name
            - email
    hd_customer_n_s:
        is_hashdiff: true
        columns:
            - activebool
            - create_date
            - last_update
            - active
    hk_address_h:
        - address_id
    hk_store_h:
        - store_id
    hk_customer_store_address_l:
        - customer_id
        - store_id
        - address_id
ldts: ldts
rsrc: rsrc
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict['source_model'],
                    ldts=metadata_dict['ldts'],
                    rsrc=metadata_dict['rsrc'],
                    hashed_columns=metadata_dict['hashed_columns'],
                    derived_columns=derived_columns,
                    missing_columns=none,
                    prejoined_columns=none,
                    include_source_columns=true) }}