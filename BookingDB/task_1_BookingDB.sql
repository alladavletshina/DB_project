select 
	c.name,
	c.email,
	c.phone,
	count(b.ID_booking) as booking_сount,
	STRING_AGG(distinct h.name, ' ,' ORDER BY h.name) as all_hotels,
	round(avg(check_out_date - check_in_date), 4) as avg_stay_length
from customer c
join booking b on b.ID_customer = c.ID_customer
join room r on r.ID_room = b.ID_room
join hotel h on h.ID_hotel = r.ID_hotel
group by c.name, c.email, c.phone
having count(b.ID_booking) > 2 and count(distinct h.ID_hotel) > 1
order by booking_сount desc
