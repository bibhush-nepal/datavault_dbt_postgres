{%- set yaml_metadata -%}
link_hashkey: 'hk_customer_staff_rental_filmworld_nl'
foreign_hashkeys:
    - 'hk_customer_filmworld_h'
    - 'hk_staff_filmworld_h'
    - 'hk_rental_filmworld_h'
payload:
    - payment_id
    - amount
    - payment_date
source_models:
    - name: stg_dv_payment
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set link_hashkey = metadata_dict['link_hashkey'] -%}
{%- set foreign_hashkeys = metadata_dict['foreign_hashkeys'] -%}
{%- set payload = metadata_dict['payload'] -%}
{%- set source_models = metadata_dict['source_models'] -%}


{{ datavault4dbt.nh_link(link_hashkey=link_hashkey,
                        foreign_hashkeys=foreign_hashkeys,
                        payload=payload,
                        source_models=source_models) }}