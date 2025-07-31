{% macro generate_ghost_records(regular_columns, hash_columns) %}
ghost_records as (
    select 
        {% for col in regular_columns %}
            case 
                when '{{ col.dtype }}' in ('int', 'integer', 'int4', 'smallint', 'int2', 'bigint', 'int8', 'serial', 'bigserial', 'smallserial') 
                    then 0
                when '{{ col.dtype }}' in ('float4', 'float8', 'real', 'double precision') 
                    then 0.0
                when '{{ col.dtype }}' in ('numeric', 'decimal') 
                    then 0.0
                when '{{ col.dtype }}' in ('text', 'varchar', 'char', 'character', 'character varying', 'string', 'citext') 
                    then '(unknown)'
                when '{{ col.dtype }}' in ('boolean', 'bool') 
                    then FALSE
                when '{{ col.dtype }}' = 'date' 
                    then '0001-01-01'::date
                when '{{ col.dtype }}' = 'time' 
                    then '00:00:01'::time
                when '{{ col.dtype }}' in ('timestamp', 'timestamptz') 
                    then '0001-01-01 00:00:01'::timestamp
                else 
                    '(unknown)'
            end as {{ col.name }}{% if not loop.last or hash_columns %},{% endif %}
        {% endfor %}
        {% for hcol in hash_columns %}
            '00000000000000000000000000000000' as {{ hcol.name }}{% if not loop.last %},{% endif %}
        {% endfor %}
    union all
    select 
        {% for col in regular_columns %}
            case 
                when '{{ col.dtype }}' in ('int', 'integer', 'int4', 'smallint', 'int2', 'bigint', 'int8', 'serial', 'bigserial', 'smallserial') 
                    then -1
                when '{{ col.dtype }}' in ('float4', 'float8', 'real', 'double precision') 
                    then -1.0
                when '{{ col.dtype }}' in ('numeric', 'decimal') 
                    then -1.0
                when '{{ col.dtype }}' in ('text', 'varchar', 'char', 'character', 'character varying', 'string', 'citext') 
                    then '(error)'
                when '{{ col.dtype }}' in ('boolean', 'bool') 
                    then FALSE
                when '{{ col.dtype }}' = 'date' 
                    then '8888-12-31'::date
                when '{{ col.dtype }}' = 'time' 
                    then '23:59:59'::time
                when '{{ col.dtype }}' in ('timestamp', 'timestamptz') 
                    then '8888-12-31 23:59:59'::timestamp
                else 
                    '(error)'
            end as {{ col.name }}{% if not loop.last or hash_columns %},{% endif %}
        {% endfor %}
        {% for hcol in hash_columns %}
            'ffffffffffffffffffffffffffffffff' as {{ hcol.name }}{% if not loop.last %},{% endif %}
        {% endfor %}
),
{% endmacro %}
