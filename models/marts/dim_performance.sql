with dim_performance as (
    select 
        employeeid as employee_id, 
        environmentsatisfaction as overall_satisfaction, 
        jobinvolvement as job_involvement, 
        jobsatisfaction as job_satisfaction,
        performancerating as performance_rating,
        relationshipsatisfaction as relationship_satisfaction,
        worklifebalance as work_life_balance

    from {{ ref('hr_raw') }}
)
select * from dim_performance