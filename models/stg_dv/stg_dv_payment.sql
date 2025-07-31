{%- set yaml_metadata -%}
source_model: stg_raw_payment
hashed_columns: 
    hk_payment_nhl:
        - payment_id
        - customer_id
        - staff_id
        - rental_id
    hk_customer_h:
        - customer_id
    hk_staff_h:
        - staff_id
    hk_rental_h:
        - rental_id
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