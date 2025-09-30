{%- set yaml_metadata -%}
source_models: stg_dv_staff
hashkey: hk_staff_filmworld_h
business_keys: staff_id
{%- endset -%}      

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ datavault4dbt.hub(source_models=metadata_dict['source_models'],
                     hashkey=metadata_dict['hashkey'],
                     business_keys=metadata_dict['business_keys']) }}