-- Lab | SQL Joins on multiple tables
-- 1. Write a query to display for each store its store ID, city, and country.
select s.store_id, c.city, co.country from store s
join address a
on s.address_id = a.address_id
join city c
on a.city_id = c.city_id
join country co
on c.country_id = co.country_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(p.amount) as 'Total money brought' from staff s
join payment p
on s.staff_id = p.staff_id
group by s.staff_id;

-- 3. What is the average running time of films by category?
select c.category_id, c.name, round(avg(f.length), 2) as 'Average Length' from category c
join film_category fc
on c.category_id = fc.category_id
join film f
on fc.film_id = f.film_id
group by c.category_id;

-- 4. Which film categories are longest?
select c.category_id, c.name, round(avg(f.length), 2) as 'Average Length' from category c
join film_category fc
on c.category_id = fc.category_id
join film f
on fc.film_id = f.film_id
group by c.category_id
order by round(avg(f.length), 2) desc
limit 5;

-- 5. Display the most frequently rented movies in descending order.
select f.film_id, f.title, count(r.inventory_id) as 'Number of times rented' from film f
join inventory i
on f.film_id = i.film_id
join rental r
on i.inventory_id = r.inventory_id
group by f.film_id
order by count(r.inventory_id) desc;

-- 6. List the top five genres in gross revenue in descending order.
select c.category_id, c.name, sum(p.amount) 'Total grossed' from sakila.payment p
join rental r
on p.rental_id = r.rental_id
join inventory i
on r.inventory_id = i.inventory_id
join film_category f
on i.film_id = f.film_id
join category c
on f.category_id = c.category_id
group by c.category_id
order by sum(p.amount) desc;

-- 7. Is "Academy Dinosaur" available for rent from Store 1?
select f.film_id, f.title, i.store_id from film f
join inventory i
on f.film_id = i.film_id
where i.film_id = 1 and i.store_id = 1;


















