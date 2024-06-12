with dim_salary as ( 
    select  
        employeeid as employee_id,
        dailyrate as daily_rate,
        hourlyrate as hourly_rate,
        monthlyincome as montlhy_income, 
        monthlyrate as monthly_rate,
        percentsalaryhike as salary_hike,
        stockoptionlevel as stock_option_level
    
    from {{ ref('hr_raw') }}
)
select * from dim_salary