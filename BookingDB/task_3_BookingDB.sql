With hotel_type as (select
	h.name,
	h.ID_hotel,
	avg(price) as avg_hotel_price,
	case 
		when avg(price) < 175 then 'Дешевый'
		when avg(price) >= 175 and avg(price) <= 300 then 'Средний'
		when avg(price) > 300 then 'Дорогой'
	end as hotel_type
from room r
join hotel h on r.ID_hotel = h.ID_hotel
group by h.ID_hotel),

preferred_hotel as (select 
	c.ID_customer,
	c.name as name,
	COUNT(DISTINCT case when ht.hotel_type = 'Дешевый' then ht.ID_hotel end) as cheap_hotels,
	COUNT(DISTINCT case when ht.hotel_type = 'Средний' then ht.ID_hotel end) as avg_hotels,
	COUNT(DISTINCT case when ht.hotel_type = 'Дорогой' then ht.ID_hotel end) as expensive_hotels,
	STRING_AGG(Distinct ht.name, ' ,' ORDER BY ht.name) AS visited_hotels
from customer c
join booking b on b.ID_customer = c.ID_customer
join room r on r.ID_room = b.ID_room
join hotel_type ht on ht.ID_hotel = r.ID_hotel
group by c.ID_customer, c.name),

itog_table as (select 
	ph.ID_customer as ID_customer,
	ph.name,
	case
		when cheap_hotels > 0 and expensive_hotels <= 0 and avg_hotels <= 0 then 'Дешевый'
		when expensive_hotels > 0 then 'Дорогой'
		when avg_hotels > 0 then 'Средний'
	end as preferred_hotel_type,
		visited_hotels
from preferred_hotel ph
group by ph.ID_customer, ph.name, preferred_hotel_type, visited_hotels)

select
	*
from itog_table
order by
	case
		when preferred_hotel_type = 'Дешевый' then 1
		when preferred_hotel_type = 'Средний' then 2
		when preferred_hotel_type = 'Дорогой' then 3
	end,
	id_customer;