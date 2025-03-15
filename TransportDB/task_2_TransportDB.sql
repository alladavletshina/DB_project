SELECT maker, model, horsepower, engine_capacity, vehicle_type
FROM (

select
	v.maker,
	c.model,
	c.horsepower,
	c.engine_capacity,
	v.type as vehicle_type
from car c
join vehicle v on c.model = v.model
where c.horsepower > 150 and c.engine_capacity < 3 and c.price < 35000

Union all

select
	v.maker,
	m.model,
	m.horsepower,
	m.engine_capacity,
	v.type as vehicle_type
from motorcycle m
join vehicle v on m.model = v.model
where m.horsepower > 150 and m.engine_capacity < 1.5 and m.price < 20000

Union all

select
	v.maker,
	b.model,
	null as horsepower,
	null as engine_capacity,
	v.type as vehicle_type
from bicycle b
join vehicle v on b.model = v.model
where b.gear_count > 18 and b.price < 4000

) AS combined_data
order by horsepower is null, horsepower desc;

