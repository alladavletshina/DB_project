WITH ResultsCar as (
    select 
		c.name as car_name, 
		c.class as car_class,
		round(avg(r.position), 4) as average_position,
        count(r.race) as race_count, 
		cl.country as car_country
    from Results r
    join Cars c on r.car = c.name
    join Classes cl on cl.class = c.class
    group by c.class, c.name, cl.country
    having avg(r.position) > 3.0
),

ResultsClass as (
	select 
		c.class as car_class, 
		count(r.race) AS total_races,
		count(c.name) as low_position_count
    from results r
    join Cars c on r.car = c.name
    group by c.class)

select
	rc.car_name,
	rc.car_class,
	rc.average_position,
	rc.race_count,
	rc.car_country,
	rcl.total_races,
	rcl.low_position_count
from ResultsClass rcl
join ResultsCar rc on rcl.car_class = rc.car_class
order by low_position_count desc