{%- set yaml_metadata -%}
ref_sat_v0: category_filmworld_n0_rs
ref_keys: category_id
hashdiff: hd_category_filmworld_n_rs
add_is_current_flag: true
{%- endset -%}      

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ datavault4dbt.ref_sat_v1(ref_sat_v0=metadata_dict['ref_sat_v0'],
                    ref_keys=metadata_dict['ref_keys'],
                    hashdiff=metadata_dict['hashdiff'],
                    add_is_current_flag=metadata_dict['add_is_current_flag']) }}