{%- set yaml_metadata -%}
source_model: stg_raw_city
hashed_columns:
    hd_city_s:
        is_hashdiff: true
        columns:
            - city
            - country_id
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