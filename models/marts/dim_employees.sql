with dim_employees as (
    select 
        employeeid as employee_id,
        gender,
        maritalstatus as marital_status,
        over18 as is_adult
    
    from {{ ref('hr_raw') }}
) 
select * from dim_employees