-- city level repeat passenger trip frequency report

select c.city_name, 
	SUM(CASE WHEN trip_count = '10-Trips' THEN repeat_passenger_count ELSE 0 END)*100/(SELECT sum(repeat_passenger_count) FROM trips_db.dim_repeat_trip_distribution where trip_count = '10-Trips') AS 10_trips,
    SUM(CASE WHEN trip_count = '9-Trips' THEN repeat_passenger_count ELSE 0 END)*100/(SELECT sum(repeat_passenger_count) FROM trips_db.dim_repeat_trip_distribution where trip_count = '9-Trips') AS 9_trips,
    SUM(CASE WHEN trip_count = '8-Trips' THEN repeat_passenger_count ELSE 0 END)*100/(SELECT sum(repeat_passenger_count) FROM trips_db.dim_repeat_trip_distribution where trip_count = '8-Trips') AS 8_trips,
    SUM(CASE WHEN trip_count = '7-Trips' THEN repeat_passenger_count ELSE 0 END)*100/(SELECT sum(repeat_passenger_count) FROM trips_db.dim_repeat_trip_distribution where trip_count = '7-Trips') AS 7_trips,
    SUM(CASE WHEN trip_count = '6-Trips' THEN repeat_passenger_count ELSE 0 END)*100/(SELECT sum(repeat_passenger_count) FROM trips_db.dim_repeat_trip_distribution where trip_count = '6-Trips') AS 6_trips,
    SUM(CASE WHEN trip_count = '5-Trips' THEN repeat_passenger_count ELSE 0 END)*100/(SELECT sum(repeat_passenger_count) FROM trips_db.dim_repeat_trip_distribution where trip_count = '5-Trips') AS 5_trips,
    SUM(CASE WHEN trip_count = '4-Trips' THEN repeat_passenger_count ELSE 0 END)*100/(SELECT sum(repeat_passenger_count) FROM trips_db.dim_repeat_trip_distribution where trip_count = '4-Trips') AS 4_trips,
    SUM(CASE WHEN trip_count = '3-Trips' THEN repeat_passenger_count ELSE 0 END)*100/(SELECT sum(repeat_passenger_count) FROM trips_db.dim_repeat_trip_distribution where trip_count = '3-Trips') AS 3_trips,
    SUM(CASE WHEN trip_count = '2-Trips' THEN repeat_passenger_count ELSE 0 END)*100/(SELECT sum(repeat_passenger_count) FROM trips_db.dim_repeat_trip_distribution where trip_count = '2-Trips') AS 2_trips
from dim_repeat_trip_distribution t join dim_city c using(city_id)
group by c.city_name