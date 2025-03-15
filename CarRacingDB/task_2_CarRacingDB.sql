WITH CarResult as (
   select
        c.class as car_class,
        c.name as car_name,
        round(avg(r.position), 4) as average_position,
        count(r.race) as race_count,
        cl.country as car_country,
		rank() over (order by avg(r.position)) AS rank
    from cars c
    join results r on c.name = r.car
    join classes cl on c.class = cl.class
    group by c.name, cl.country)

select
     car_name,
	 car_class,
     average_position,
     race_count,
     car_country
from CarResult
where rank = 1
order by car_name
limit 1
