{%- set yaml_metadata -%}
source_models: stg_dv_film
hashkey: hk_film_filmworld_h
business_keys: film_id
{%- endset -%}      

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ datavault4dbt.hub(source_models=metadata_dict['source_models'],
                     hashkey=metadata_dict['hashkey'],
                     business_keys=metadata_dict['business_keys']) }}