{%- set yaml_metadata -%}
source_model: stg_raw_film_actor
hashed_columns: 
    hk_film_actor_l:
        - actor_id
        - film_id
    hd_film_actor_s:
        is_hashdiff: true
        columns:
            - last_update
    hk_actor_h:
        - actor_id
    hk_film_h:
        - film_id
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