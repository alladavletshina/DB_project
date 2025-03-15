WITH car_reasult as (
select 
	c.class as car_class,
	c.name as car_name,
	round(avg(r.position), 4) as average_position,
	count(r.race) as race_count
from cars c
join results r on c.name = r.car 
group by car_class, car_name),

min_avg_position_car_class as (
	SELECT car_class, car_name, average_position, race_count, RANK() OVER (PARTITION BY car_class ORDER BY average_position) AS rank
	FROM car_reasult) 

select
	car_name,
	car_class,
	average_position,
	race_count
from min_avg_position_car_class
where rank = 1
order by average_position
