with dim_job as (
    select 
        employeeid as employee_id,
        jobrole as role,
        joblevel as role_level, 
        department, education, 
        educationfield as education_field, 
    
    from {{ ref('hr_raw') }}
) 
select * from dim_job