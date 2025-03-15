select 
	c.id_customer,
	c.name,
	count(b.id_booking) as total_bookings,
	sum((check_out_date - check_in_date)* r.price) as total_spent,
	count(distinct r.ID_hotel) as unique_hotels
from customer c
join booking b on b.ID_customer = c.ID_customer
join room r on r.ID_room = b.ID_room
group by c.id_customer, c.name
having count(distinct r.ID_hotel) > 1 
	and 
		sum((check_out_date - check_in_date) * r.price) > 500 
	and 
		count(b.ID_booking) > 2 
order by total_spent