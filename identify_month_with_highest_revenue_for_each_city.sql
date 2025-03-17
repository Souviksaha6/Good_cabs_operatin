-- identify month with highest revenue for each city

with cte1 as(
select city_id, month(date) as month, sum(fare_amount) as revenue
from fact_trips
group by city_id, month(date)
),

cte2 as (
select city_id, max(revenue) as max_revenue
from cte1
group by city_id
),

cte3 as (
select cte1.*
from cte2 join cte1 using (city_id)
where cte2.max_revenue = cte1.revenue
),

cte4 as (
select a.city_id, b.city_name, a.month, a.revenue
from cte3 a join dim_city b using (city_id)
)

select 
	city_name,
    case
		when month = 1 then "January"
        when month = 2 then "February"
        when month = 3 then "March"
        when month = 4 then "April"
        when month = 5 then "May"
        when month = 6 then "June"
        when month = 7 then "July"
        when month = 8 then "August"
        when month = 9 then "Septhember"
        when month = 10 then "October"
        when month = 11 then "November"
        when month = 12 then "December"
    end as highest_revenue_month,
    revenue as highest_revenue
from cte4

