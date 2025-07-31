{%- set yaml_metadata -%}
source_model: stg_raw_inventory
hashed_columns:
    hk_inventory_h:
        - inventory_id
    hk_film_h:
        - film_id
    hk_store_h:
        - store_id
    hk_inventory_film_store_l:
        - inventory_id
        - film_id
        - store_id
    hd_inventory_film_store_es:
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