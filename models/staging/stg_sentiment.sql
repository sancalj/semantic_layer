with
    sentiment as (
        select

            employeeid as employee_id,
            department,
            attrition,
            age,
            gender,
            dailyrate as daily_rate,
            environmentsatisfaction as env_satisfaction,
            jobinvolvement as job_involvement,
            jobsatisfaction as job_satisfaction,
            relationshipsatisfaction as rel_satisfaction,
            worklifebalance as work_life_balance

        from {{ ref('hr_raw') }}
    )
select *
from sentiment
