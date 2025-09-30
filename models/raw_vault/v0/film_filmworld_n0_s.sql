{%- set yaml_metadata -%}
parent_hashkey: 'hk_film_filmworld_h'
src_hashdiff: 'hd_film_filmworld_n_s'
src_payload:
    - film_id
    - title
    - description
    - release_year
    - language_id
    - original_language_id
    - rental_duration
    - rental_rate
    - length
    - replacement_cost
    - rating
    - last_update
    - special_features
    - fulltext
source_model: stg_dv_film
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set parent_hashkey = metadata_dict['parent_hashkey'] -%}
{%- set src_hashdiff = metadata_dict['src_hashdiff'] -%}
{%- set source_model = metadata_dict['source_model'] -%}
{%- set src_payload = metadata_dict['src_payload'] -%}


{{ datavault4dbt.sat_v0(parent_hashkey=parent_hashkey,
                        src_hashdiff=src_hashdiff,
                        source_model=source_model,
                        src_payload=src_payload) }}