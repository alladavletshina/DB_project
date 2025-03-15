select 
	v.maker,
	m.model
from Vehicle v
join Motorcycle m on m.model = v.model
where m.price < 20000 and m.type = 'Sport' and m.horsepower > 150
order by m.horsepower desc;