
1.What are the names of all the languages in the database? Sort the languages alphabetically.

select distinct(name) from language order by name;

2.Return the full names (first and last) of all actors with "BER" in their last name. Sort the returned names by their first name. (Hint: use the CONCAT() function to add two or more strings together.)

select CONCAT(first_name, " ", last_name) AS name from actor where last_name like '%ber%' order by first_name;

3.How many last names are not repeated in the actor table?

select distinct(last_name) as new, count(last_name) as f from actor group by last_name having f=1 ;

4.How many films involve a "Crocodile" and a "Shark"?

SELECT COUNT(film_id) FROM film WHERE description like  "%Crocodile%shark%";

5.Return the full names of the actors who played in a film involving a "Crocodile" and a "Shark", along with the release year of the movie, sorted by the actors last names.

select concat(first_name," ", last_name) as name, release_year
from actor tbla inner join film tblb
where (SELECT COUNT(film_id) 
	FROM film tblb
	WHERE description 
	like  "%Crocodile%shark%") 
order by last_name;

6.Find all the film categories in which there are between 40 and 60 films. Return the names of these categories and the number of films in each category, sorted in descending order of the number of films.

SELECT category, Count(*) AS FilmsCount
FROM Film_List
GROUP BY Category
HAVING Count(*) BETWEEN 40 AND 60
ORDER BY FilmsCount;

7.Return the full names of all the actors whose first name is the same as the first name of the actor with ID 24.

SELECT actor_id AS id, concat(first_name," ", last_name) as full_name
 FROM actor
 WHERE actor_id = 24 AND 
       first_name = (SELECT first_name FROM actor WHERE actor_id = 24);

8.Return the full name of the actor who has appeared in the most films.

SELECT count(film_actor.actor_id) as number, actor.first_name, actor.last_name 
FROM actor INNER JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id 
order by number desc
limit 1;

9.Return the film categories with an average movie length longer than the average length of all movies in the sakila database.



SELECT name, AVG(length)
FROM film tbla inner join category tblb inner join film_category tblc
on tbla.film_id=tblc.film_id
and tblb.category_id=tblc.category_id
GROUP BY name
having avg(length)> (select avg(length) from film);





10.Return the total sales of each store.

select distinct(store.store_id), sum(payment.amount) 
from store inner join payment
on payment.staff_id=store.store_id
group by store.store_id;





