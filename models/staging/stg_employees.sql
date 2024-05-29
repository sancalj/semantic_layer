with
    employees as (
        select

            employeeid as employee_id,
            age,
            gender,
            department,
            hiredate as hire_date,
            terminationdate as termination_date,
            educationfield as education_field,
            maritalstatus as marital_status,
            over18 as is_adult

        from {{ ref('hr_raw') }}
    )
select *
from employees
