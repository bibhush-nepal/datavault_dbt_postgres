{%- set yaml_metadata -%}
source_model: stg_raw_film
hashed_columns: 
    hk_film_h:
        - film_id
    hd_film_s:
        is_hashdiff: true
        columns:
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