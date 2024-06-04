{% macro ml_transformations(model_name, scaler_type='standard') %}

WITH scaled_data AS (
    SELECT
        {% for col in ref(model_name).columns %}
            {% if loop.index > 1 %},{% endif %}
            ({{ col }} - AVG({{ col }}) OVER ()) / STDDEV_POP({{ col }}) OVER () AS {{ col }}_scaled
        {% endfor %}
    FROM {{ ref(model_name) }}
),

final_data AS (
    {% if scaler_type == 'minmax' %}
    SELECT
        {% for col in ref(model_name).columns %}
            {% if loop.index > 1 %},{% endif %}
            ({{ col }} - MIN({{ col }}) OVER ()) / (MAX({{ col }}) OVER () - MIN({{ col }}) OVER ()) AS {{ col }}_scaled
        {% endfor %}
    FROM scaled_data
    {% else %}
    SELECT * FROM scaled_data
    {% endif %}
)

SELECT * FROM final_data

{% endmacro %}

