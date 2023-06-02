-- create database
CREATE DATABASE aditya;
-- delete database
DROP DATABASE aditya;
DROP TABLE users;
-- create tables in database without constraints
CREATE TABLE users(id INT, name VARCHAR(30), bio VARCHAR(50));
-- create tables in database with constraints
CREATE TABLE users(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(30),
    bio VARCHAR(50)
);
-- insert into is tricky 
-- insert into the table using schema
INSERT INTO users(name, bio)
values ('Aditya', 'Aditya');
-- SELECT all  FROM users
SELECT *
FROM users;
-- SELECT a custom column FROM table
SELECT *
FROM users
ORDER BY id ASC;
-- SELECT a custom column but with unique rows
SELECT bio
FROM users
ORDER BY bio ASC;
-- SELECT column with condition 
SELECT name
FROM users
WHERE name = 'Aditya';
/* Normal  */
SELECT *
FROM users
WHERE name = 'Aditya'
    AND (
        bio = 'student'
        or id = 1
    );
/* With and and or condition */
-- Comparision operator
SELECT 1 = 1;
SELECT 1 <> 1;
/* Not equal to */
-- Limit Operator
SELECT *
FROM users
ORDER BY id ASC
LIMIT 10;
/*  Limit means limiting the data coming  */
SELECT *
FROM users
ORDER BY id ASC OFFSET 5
LIMIT 10;
/* Offset means starting after the number of rows */
SELECT *
FROM users
ORDER BY id ASC
FETCH FIRST 10 ROWS ONLY;
SELECT *
FROM users
WHERE name IN ('Aditya', 'Emylee');
/*  We use in when we have to pass different value to one properties */
-- Between operator (range)
SELECT *
FROM users
WHERE id BETWEEN 1 AND 20;
-- Like operator
SELECT *
FROM users
WHERE bio LIKE '%Software%';
/*  % means something there */
SELECT *
FROM users
WHERE bio LIKE 'Software___________';
/*  _ means that length of character */
-- iLike operator is just like like but not case sensitive
-- Group By operator
SELECT bio,
    count(*)
FROM users
GROUP BY bio
ORDER BY bio ASC;
SELECT bio,
    count(*)
FROM users
GROUP BY bio
HAVING count(*) > 3
ORDER BY count(*) ASC;
-- Max , Min and AVG function
/* Returns the maximum amount present in the table */
SELECT Max(money)
FROM cars;
/* Returns the minimum amount present in the table */
SELECT MIN(money)
FROM cars;
/* Returns the average amount present in the table */
SELECT AVG(money)
FROM cars;
/* Returns the sum of all amount present in the table */
SELECT SUM(money)
FROM cars;
SELECT *
FROM cars;
-- Arthemtic oprator just like any other languages
-- +(add) -(sub) *(multiply) /(divide) ^(power of) %(remainder)
-- Advanced arthemtic operator
SELECT *,
    round(money *.10, 2) AS discount,
    round(money - money *.10, 2) AS discounted_price
FROM cars;
-- Coalesce keyword 
SELECT Coalesce(null, 1);
/*  It gives the other value if first on is null */
-- Nullif / nullif takes two arguement and if both are equal then return null
SELECT nullif(0, 0);
-- it is used to error handling in postgres
-- Now() operator / returns the timestamp when the function is called 
SELECT Now();
SELECT Now()::Date;
/* return only date */
SELECT Now()::Time;
/* return only time */
-- Interval Operator
SELECT Now() - INTERVAL '1 Year';
-- Extract operator
SELECT Extract(
        Year
        FROM now()
    );
-- Age operator
SELECT age(now(), '2023-05-26');
/* Age takes two arguements / first now current timestamp / second date */
-- Primary Keys
insert into users (id, name, bio)
values (1, 'Madelene', 'Chemical Engineer');
/* Gives error :duplicate key value violates unique constraint "users_pkey" */
-- Constraints
-- Check Constraints
Alter TABLE users
ADD UNIQUE (name);
-- Delete 
Delete FROM users
where name = 'Aditya';
/* Dont use this ever */
Delete FROM users;
/* It will delete whole table */
SELECT *
FROM users;
-- Update operator 
update users
SET name = 'Aditya Bada'
WHERE name = 'Aditya';
update users
SET name = 'Aditya',
    bio = 'Full Stack developer'
WHERE name = 'Aditya Bada';
/*  if want to update multiple values */
/* Always use where clause with delete and update */
-- Error handling
-- On Conflict only works on unique column
INSERT INTO users (id, name, bio)
values (1, 'Aditya', 'Full Stack Developer');
/* This will give error that this key is already used */
INSERT INTO users (id, name, bio)
values (1, 'Aditya', 'Full Stack Developer') on Conflict(id) Do Nothing;
/* So this is error handled */
-- Foreign keys for relationship between tables
SELECT *
FROM person;
-- Inner joins
SELECT *
FROM person
    JOIN car on person.car_id = car.id;
/*  This gives only row which both have same reference no */
-- Left Joins
SELECT *
FROM person
    LEFT JOIN car on person.car_id = car.id;
/*Left join means take all row from a and only join row from b and return and which dot have relationship will also get included*/
-- Delete record with foreign key
/* Just remove the car id which we want to delete from the row it is using and then delete */
-- Alter sequence 
ALTER SEQUENCE person_id_seq RESTART WITH 1;
-- Extensions 
SELECT *
from pg_available_extensions;
create EXTENSION if not exists "uuid-ossp";
select uuid_generate_v4();
select *
from car
where price = (
        select min(price)
        from car
    );
--Extra
Show ALL;
Show TIMEZONE;
select *
from users
where name = 'Aditya';
insert into users (name, bio)
values ('Aditya', 'Full Stack Developer');
select *
from people
where first_name in(
        select name
        from users
    );
-- Exists
select *
from people
where first_name in Exists(
        select name
        from users
    );
SELECT '5'::integer;
SELECT CAST('5' as integer);
--Views
/* Views are just virtual table or snippets for a query so we can use view instead of writing the query more and more */
create View aditya as
select *
from users
where name = 'Aditya';
/* This will create a virtual table using the query */
create or replace View aditya as
select *
from users
where name = 'Aditya';
/* This will overwrite existing table */
drop view if exists aditya;
-- Materialized view 
create materialized view mv_rand_table as
select id,
    avg(val),
    count(*)
from rand_table
group by id;
/* This will store the data came from the query and will store it */
-- So it will not give updated data
-- Refresh Materialized view
refresh materialized view mv_rand_table;
/* This will refresh the data */
-- Trigger
/* Trigger will is a function which will run on changes based given condition */
/* Two types of triiger  */
-- Row level
-- Statement level
/* First create a function */
CREATE FUNCTION trigger_function() RETURNS TRIGGER LANGUAGE PLPGSQL AS $$ BEGIN -- trigger logic
END;
$$;
CREATE TRIGGER trigger_name
AFTER
INSERT ON people FOR EACH ROW EXECUTE PROCEDURE trigger_function();

insert into people
select 1,random() ;

select * from people cross join person on people.id = person.id;