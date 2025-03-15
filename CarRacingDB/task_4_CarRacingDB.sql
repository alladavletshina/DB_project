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
RankCarResults as (
	select 
		car_name,
		car_class,
		average_position,
		race_count,
		car_country,
		row_number() over (partition by car_class order by average_position) as rank
	from CarResults
)

select 
	car_name,
	car_class,
	average_position,
	race_count,
	car_country
from RankCarResults
where rank = 1 and car_class in (
	select car_class
	from RankCarResults
	where rank > 1
);

