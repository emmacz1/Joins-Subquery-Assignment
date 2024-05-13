-- 1. List all customers who live in Texas (use JOINs)
select *
from customer
inner join address on customer.address_id = address.address_id
inner join city on address.city_id = city.city_id
where city.customer_state = 'TX';

-- 2. Get all payments above $6.99 with the Customer's Full Name
select concat(customer.first_name, ' ', customer.last_name) as full_name, payment.amount
from payment
inner join customer on payment.customer_id = customer.customer_id
where payment.amount > 6.99;

-- 3. Show all customers names who have made payments over $175 (use subqueries)
select concat(first_name, ' ', last_name) as full_name
from customer
where customer.customer_id in (
    select customer_id
    from payment
    group by customer_id
    having sum(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)
select *
from customer
inner join address on customer.address_id = address.address_id
inner join city on address.city_id = city.city_id
where city.country = 'Nepal';

-- 5. Which staff member had the most transactions?
select staff_id, count(*) as num_transactions
from rental
group by staff_id
order by num_transactions desc
limit 1;

-- 6. How many movies of each rating are there?
select rating, count(*) as num_movies
from film
group by rating;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
select concat(first_name, ' ', last_name) as full_name
from customer
where customer.customer_id in (
    select customer_id
    from payment
    where amount > 6.99
    group by customer_id
    having count(*) = 1
);

-- 8. How many free rentals did our stores give away?
select count(*) as num_free_rentals
from rental
where rental_rate = 0;