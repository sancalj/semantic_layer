with job_satisfaction as (
    select
        e.employee_id,
        w.role,
        s.job_satisfaction
    from {{ ref('stg_employees') }} e
    left join {{ ref('stg_work_profile') }} w 
        on e.employee_id = w.employee_id
    left join {{ ref('stg_sentiment') }} s 
        on e.employee_id = s.employee_id
)
select *
from employee_satisfaction
