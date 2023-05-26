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
-- select all  from users
SELECT *
FROM users;
-- select a custom column from table
SELECT *
FROM users
ORDER BY id ASC;
-- select a custom column but with unique rows
SELECT bio
FROM users
ORDER BY bio ASC;
-- select column with condition 
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
select *
from cars;
-- Arthemtic oprator just like any other languages
-- +(add) -(sub) *(multiply) /(divide) ^(power of) %(remainder)
-- Advanced arthemtic operator
select *,
    round(money *.10, 2) as discount,
    round(money - money *.10, 2) as discounted_price
from cars;
-- Coalesce keyword 
select Coalesce(null, 1);
/*  It gives the other value if first on is null */
-- Nullif / nullif takes two arguement and if both are equal then return null
select nullif(0, 0);
-- it is used to error handling in postgres
-- Now() operator / returns the timestamp when the function is called 
select Now();
select Now()::Date;
/* return only date */
select Now()::Time;
/* return only time */
-- Interval Operator
select Now() - INTERVAL '1 Year';
-- Extract operator
select Extract(
        Year
        from now()
    );
-- Age operator
select age(now(), '2023-05-26');
/* Age takes two arguements / first now current timestamp / second date */
-- Primary Keys
insert into users (id, name, bio)
values (1, 'Madelene', 'Chemical Engineer');
 /* Gives error :duplicate key value violates unique constraint "users_pkey" */

-- Constraints
-- Check Constraints
Alter TABLE users ADD  UNIQUE (name);