
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
WHERE name in ('Aditya', 'Emylee');
/*  We use in when we have to pass different value to one properties */

-- Between operator (range)
SELECT *
FROM users
WHERE id BETWEEN 1 AND 20;

-- Like operator
select *
from users
WHERE bio like '%Software%';
/*  % means something there */
select *
from users
WHERE bio like 'Software___________';
/*  _ means that length of character */

-- iLike operator is just like like but not case sensitive

-- Group By operator
select bio,
    count(*)
from users
Group By bio
ORDER by bio asc;
select bio,
    count(*)
from users
Group By bio
having count(*) > 3
ORDER by count(*) asc;

-- Max and Min function
select Max(money)
from cars;
/* Returns the maximum amount present in the table */