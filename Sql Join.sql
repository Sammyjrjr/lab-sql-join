-- 1List the number of films per category.
select * from category; -- category_id
select * from film_category; -- category_id
select * from film; -- category_id
select name as category_id, count(title)
from category 
join film_category on category.category_id= film_category.category_id
join film  on film.film_id =film_category.film_id
group by category_id
order by count(title) asc;

-- 2 Display the first and the last names, as well as the address, of each staff member.
select * from staff;	  -- address_id
select * from address; -- address_id
select first_name,last_name, address
from staff
join address on staff.address_id= address.address_id;


-- 3 Display the total amount rung up by each staff member in August 2005.
select * from payment; -- staff_id
select * from staff;  -- staff_id
select s.staff_id, sum(amount) as total_amount_rung
from payment p
join staff s on p.staff_id = s.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by staff_id; 
	


-- 4List all films and the number of actors who are listed for each film.
select * from film; -- film_id
select * from film_actor; -- film_id
select f.title,count(fa.actor_id) as actors
from film f 
join film_actor fa on fa.film_id= f.film_id
group by f.title
order by count(fa.actor_id) desc;

-- 5 Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

select * from payment; -- customer_id, amount
select * from customer; -- customer_id, last_name, first_name
select sum(p.amount) as "total amount paid" ,c.first_name,c.last_name 
from payment p
join customer c on c.customer_id=p.customer_id
group by c.customer_id
order by c.first_name asc;





