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
values ('Aditya', 'Student');
SELECT *
FROM users;