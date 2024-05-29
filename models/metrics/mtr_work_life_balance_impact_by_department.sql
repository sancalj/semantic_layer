with work_life_balance as (
    select
        w.department,
        s.work_life_balance,
        count(s.employee_id) as total_employees,
        sum(case when s.attrition = 'Yes' then 1 else 0 end) as total_attrition,
        (sum(case when s.attrition = 'Yes' then 1 else 0 end) * 100.0 / count(s.employee_id)) as attrition_rate
    from {{ ref('stg_sentiment') }} s
    left join {{ ref('stg_work_profile') }} w 
        on s.employee_id = w.employee_id
    group by w.department, s.work_life_balance
)
select * 
from work_life_balance
order by department, work_life_balance DESC
