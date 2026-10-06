{% macro dynamic_partition(col_name, interval) %}

    CASE
        WHEN DATE({{ col_name }}) >= DATE_SUB(
            CURRENT_DATE(),
            INTERVAL 2 {{ interval }} 
        )
        THEN 'recent'

        ELSE 'historical'
    END AS partition_group

{% endmacro %}

{# macro 1#}