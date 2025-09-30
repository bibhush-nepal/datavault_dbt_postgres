{%- set yaml_metadata -%}
source_models: stg_dv_customer
hashkey: hk_customer_h
business_keys: customer_id
{%- endset -%}      

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ datavault4dbt.hub(source_models=metadata_dict['source_models'],
                     hashkey=metadata_dict['hashkey'],
                     business_keys=metadata_dict['business_keys']) }}