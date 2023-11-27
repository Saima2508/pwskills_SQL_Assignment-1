-- Identify the primary keys and foreign keys in maven movies db. Discuss the differences-- 
use mavenmovies;
-- Primary Key:- A column in a particular table that carries the unique values to identify a particular row/record. It can never be null. A table can have only one primary key.
-- Foreign Key:- A common column between two tables that creates a relation between the tables. It provides a link between the tables. A table can have more than one foreign key.
-- Through the below queries it is easily identifiable the primary and foreign key in each table present in mavenmovies db--
desc actor;
-- Primary Key:- actor_id and Foreign Key:- last_name
desc actor_award;
-- Primary Key:- actor_award_id and Foreign Key:- last_name
desc address;
-- Primary Key:- address_id and Foreign Key:- city_id
desc advisor;
-- Primary Key:- advisor_id
desc category;
-- Primary Key:- category_id
desc city;
-- Primary Key:- city_id and Foreign Key:- country_id
desc country;
-- Primary Key:- country_id 
desc customer;
-- Primary Key:- customer_id and Foreign Key:- store_id,last_name, address_id
desc film;
-- Primary Key:- film_id and Foreign Key:- title, language_id, original_language_id
desc film_actor;
-- Primary Key:- actor_id, film_id
desc film_category;
-- Primary Key:- category_id
desc film_text;
-- Primary Key:- film_id and Foreign Key:- title
desc inventory;
-- Primary Key:- inventory_id and Foreign Key:- film_id, store_id
desc investor;
-- Primary Key:- investor_id
desc language;
-- Primary Key:- language_id
desc payment;
-- Primary Key:- payment_id and Foreign Key:- staff_id, rental_id, customer_id
desc rental;
-- Primary Key:- rental_id and Foreign Key:- rental_date, inventory_id, customer_id
desc staff;
-- Primary Key:- staff_id and Foreign Key:- address_id, store_id
desc store;
-- Primary Key:- store_id and Foreign Key:- address_id

-- List all details of actors
select *from actor;

-- List all customer information from DB
select *from customer;

-- List different countries.
select distinct(country) from country;

-- Display all active customers.
select *from customer where active = 1;

-- List of all rental IDs for customer with ID 1.
select rental_id, customer_id from rental where customer_id = 1;

-- Display all the films whose rental duration is greater than 5
select title, rental_duration from film where rental_duration > 5;

-- List the total number of films whose replacement cost is greater than $15 and less than $20.
select count(film_id) from film where replacement_cost > 15 and replacement_cost < 20;

-- Find the number of films whose rental rate is less than $1
select count(film_id) from film where rental_rate < 1;

-- Display the count of unique first names of actors. 
select count(distinct first_name) from actor;

-- Display the first 10 records from the customer table 
select *from customer limit 10;

-- Display the first 3 records from the customer table whose first name starts with ‘b’.
select *from customer where first_name like 'b%' limit 3;

-- Display the names of the first 5 movies which are rated as ‘G
select title from film where rating = 'G' limit 5;

-- Find all customers whose first name starts with "a".
select  *from customer where first_name like 'a%';

-- Find all customers whose first name ends with "a".
select  *from customer where first_name like '%a';

-- Display the list of first 4 cities which start and end with ‘a’ .
 select city from city where city like 'a%a' limit 4;
 
 -- Find all customers whose first name have "NI" in any position.
 select *from customer where first_name like '%NI%';
 
 -- Find all customers whose first name have "r" in the second position 
 select *from customer where first_name like '_r%';
 
 -- Find all customers whose first name starts with "a" and are at least 5 characters in length. 
 select *from customer where first_name like 'a____%';
 
 -- Find all customers whose first name starts with "a" and ends with "o".
 select *from customer where first_name like 'a%o';
 
 -- Get the films with pg and pg-13 rating using IN operator.
 select *from film where rating in ('pg', 'pg-13');
 
 -- Get the films with length between 50 to 100 using between operator
 select title, length from film where length between 50 and 100 ;
 
-- Get the top 50 actors using limit operator. 
select *from actor limit 50;

-- Get the distinct film ids from inventory table.
 select distinct film_id from inventory;