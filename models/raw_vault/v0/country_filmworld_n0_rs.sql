{%- set yaml_metadata -%}
source_model: stg_dv_country
parent_ref_keys: country_id
src_hashdiff: hd_country_filmworld_n_rs
src_payload:
    - country
    - last_update
{%- endset -%}      

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ datavault4dbt.ref_sat_v0(source_model=metadata_dict['source_model'],
                    parent_ref_keys=metadata_dict['parent_ref_keys'],
                    src_hashdiff=metadata_dict['src_hashdiff'],
                    src_payload=metadata_dict['src_payload']) }}