#  City level fare and trip summary report
 
with cte1 as (
select c.city_name, count(t.trip_id) as total_trips, sum(t.distance_travelled_km) as total_distance, sum(t.fare_amount) as total_fare
from fact_trips t join dim_city c using (city_id)
group by c.city_name)
 
select city_name, total_trips,
        total_fare/total_distance as avg_fare_per_km, 
        total_fare/total_trips as avg_fare_per_trip, 
        (total_trips*100)/(select count(trip_id) from fact_trips) as contribution_to_total_tips_pct
from cte1