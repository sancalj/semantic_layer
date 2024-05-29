with hr_raw as (
    select * 
    from {{ source('hbi', 'hr_raw') }}
)

select * from hr_raw