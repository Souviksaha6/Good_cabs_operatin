# Monthly city level trips target performance report

with cte1 as (
select t.month, c.city_name,sum(p.total_passengers) as actual_trips, sum(t.total_target_trips) target_trips
from targets_db.monthly_target_trips t join fact_passenger_summary p on t.month = p.month and t.city_id = p.city_id
	join dim_city c on t.city_id = c.city_id
group by t.month, c.city_name)

select *, if (actual_trips > target_trips, "Above Target" , "Below Target") as performance_status, (actual_trips-target_trips)*100/target_trips as differ_pct
from cte1