with
    work_profile as (
        select

            employeeid as employee_id,
            department, overtime, attrition,
            jobrole as role,
            joblevel as level,
            hourlyrate as hourly_rate,
            educationfield as major,
            yearsatcompany as years_within_company,
            yearsincurrentrole as years_in_current_role,
            totalworkingyears as working_years,
            hiredate as hire_date,
            terminationdate as termination_date,
            businesstravel as business_travel,
            dailyrate as daily_rate,
            distancefromhome as commute_distance,
            education,
            employeenumber as employee_number,
            monthlyincome as monthly_income,
            monthlyrate as monthly_rate,
            numcompaniesworked as previous_companies,
            percentsalaryhike as salary_hike,
            performancerating as performance_rating,
            standardhours as standard_hours,
            trainingtimeslastyear as trainings,
            yearssincelastpromotion as last_promotion,
            yearswithcurrmanager as years_with_current_manager

        from {{ ref('hr_raw') }}

    )
select *
from work_profile
