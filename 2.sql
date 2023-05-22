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
SELECT * FROM users ORDER BY id ASC;
-- select a custom column but with unique rows
SELECT  bio FROM users ORDER BY bio ASC;