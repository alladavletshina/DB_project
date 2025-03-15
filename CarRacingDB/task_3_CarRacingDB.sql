WITH CarResults as (
    select c.class as car_class,
		r.car as car_name, 
		round(avg(r.position), 4) as average_position, 
		count(r.race) as race_count, 
		cl.country as car_country
    from results r
    join Cars c on r.car = c.name
	join classes cl on c.class = cl.class
    group by c.class, r.car, cl.country
),

ClassResults as (
	select 
		car_class,
		avg(average_position) as average_class_position,
		sum(race_count) as total_races,
		rank() over (order by avg(average_position)) as rank
	from CarResults
	group by car_class
)

select
	cr.car_name,
	cr.car_class,
	cr.average_position,
	cr.race_count,
	cr.car_country,
	clr.total_races
from ClassResults clr
join CarResults cr on cr.car_class = clr.car_class
where clr.rank = 1
order by cr.car_name