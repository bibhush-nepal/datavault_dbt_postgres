{%- set yaml_metadata -%}
source_model: stg_raw_address
hashed_columns: 
    hk_address_h:
        - address_id
    hd_address_s:
        is_hashdiff: true
        columns:
            - address
            - address2
            - district
            - city_id
            - postal_code
            - phone
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