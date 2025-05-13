{% macro find_datatypes(stg_products) %}
    {% set cols=adapter.get_columns_in_relation(stg_products) %}
    {%- for col in cols %}
        - name:{{ col.name | lower }} data_type:{{ col.dtype | lower }}
    {%- endfor %}
{% endmacro %}
