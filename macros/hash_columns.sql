{% macro generate_hash(columns, alias, is_hashdiff=false) %}
    {% set null_placeholder = '^^' %}
    {% set delimiter = "'||'" %}
    
    MD5(
        CONCAT(
        {% for column in columns %}
            COALESCE(TRIM(CAST({{ column }} AS TEXT)), '{{ null_placeholder }}'){% if not loop.last %}, {{ delimiter }}, {% endif %}
        {% endfor %}
        )
    ) AS {{ alias }}
{% endmacro %}
