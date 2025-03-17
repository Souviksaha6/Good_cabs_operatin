-- identify cities with highest and lowest total new passengers

with cte1 as (
select c.city_name, sum(p.new_passengers) as total_new_passengers
from fact_passenger_summary p left join dim_city c on p.city_id = c.city_id
group by c.city_name
),

cte2 as (
select *, rank() over(order by total_new_passengers desc) as top_3, rank() over(order by total_new_passengers asc) as bottom_3
from cte1
)

select 
	city_name, 
    total_new_passengers, 
    case
		when top_3 < 4 then "top_3"
        when bottom_3 < 4 then "bottom_3"
    end as city_category
from cte2
where top_3 < 4 or bottom_3 < 4

