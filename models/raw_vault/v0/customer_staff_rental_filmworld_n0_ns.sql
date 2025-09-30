{%- set yaml_metadata -%}
parent_hashkey: 'hk_customer_staff_rental_filmworld_nl'
src_payload:
    - amount
    - payment_date
source_model: stg_dv_payment
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set parent_hashkey = metadata_dict['parent_hashkey'] -%}
{%- set src_payload = metadata_dict['src_payload'] -%}
{%- set source_model = metadata_dict['source_model'] -%}


{{ datavault4dbt.nh_sat(parent_hashkey=parent_hashkey,
                        src_payload=src_payload,
                        source_model=source_model) }}          