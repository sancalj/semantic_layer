{{
    config(
        materialized = 'table',
    )
}}


with employees as (
    select * 
    from {{ ref('stg_employees') }}
),

attrition as (
    select
        department,
        count(employee_id) as terminated_count
    from employees
    where termination_date is not null
    group by department
),

total_employees as (
    select
        department,
        count(employee_id) as total_count
    from employees
    group by department
)

select
    t.department,
    terminated_count,
    total_count,
    (terminated_count::float / total_count::float) as attrition_rate
from attrition a
join total_employees t
    on a.department = t.department
