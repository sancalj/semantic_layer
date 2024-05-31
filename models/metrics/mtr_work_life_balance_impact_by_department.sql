with work_life_balance as (
    select
        w.role,
        count(e.employee_id) as total_employees,
        count(case when w.attrition = 'Yes' then 1 end) as employees_with_attrition,
        count(case when w.attrition = 'Yes' then 1 end) * 1.0 / count(e.employee_id) as attrition_rate
    from {{ ref('stg_employees') }} e
    left join {{ ref('stg_work_profile') }} w 
        on e.employee_id = w.employee_id
    left join {{ ref('stg_sentiment') }} s 
        on e.employee_id = s.employee_id
    group by w.role
)
select * 
from work_life_balance
order by role, attrition_rate DESC
