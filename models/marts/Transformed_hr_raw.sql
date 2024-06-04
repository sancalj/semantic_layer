with transformed_hr_raw as (
    select * 
    from {{ source('transformed_hbi', 'transformed_hr_raw') }}
) 
select * from transformed_hr_raw