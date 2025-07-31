{%- set yaml_metadata -%}
source_model: stg_raw_rental
hashed_columns:
    hk_rental_h:
        - rental_id
    hk_inventory_h:
        - inventory_id
    hk_customer_h:
        - customer_id
    hk_staff_h:
        - staff_id
    hk_rental_inventory_customer_staff_l:
        - rental_id
        - inventory_id
        - customer_id
        - staff_id
    hd_rental_inventory_customer_staff_s:
        - rental_date
        - return_date
    hd_rental_inventory_customer_staff_es:
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