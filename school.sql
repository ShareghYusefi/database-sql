-- This is a comment in a SQL file
-- What is a Database and Data? 
-- Data is a fact about an object or event.
-- Database is a collection of related data records.

-- What are Database Management Systems (DBMS)? 
-- A DBMS is a software that allows users to create, store, retrieve, update, and manage data in a database.
-- There are different types of DBMS's, such Herarchical, Network, Relational, Object-Oriented, and NoSQL. 

-- What is a Relational DBMS? 
-- This is essentially when we store data in tables which have rows and columns.

-- What is SQL? 
-- SQL stands for Structured Query Language. It is a standar language for accessing and manipulating databases. 

-- What is a Database Schema? 
-- A database schema is a blueprint of how the database is constructed. It defines the tables, fields, relationships, etc.. 

-- What makes up a SQL Query?
-- A SQL query is made up of clauses, expressions, predicates, queries, and statements. 
-- Queries are used to retrieve data from a database. They are used to perform operations such as SELECT, FROM, WHERE, etc. 
-- Statements are used to perform operations such as CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, and TRUNCATE.
-- Predicates are used to filter data based on conditions: There are WHERE, HAVING, JOIN.

-- Data Definition Language (DDL)?
-- DDL is used to define the structure of the database. This includes commands like CREATE, ALTER, DROP, TRUNCATE, and RENAME. 
-- Common Data types: INT, VARCHAR, CHAR, TEXT, DATE, TIME, TIMESTAMP, and BLOB.

-- Creating a Database
-- CREATE DATABASE school;

-- The USE statement selects a database. 
USE school;

-- Create a students table
CREATE TABLE students (
    id int,
    name varchar(100), -- varchar is used to store variable-length character strings.
    email varchar(100),
    age int
);

-- Alter students table to add a new column
ALTER TABLE students
ADD `password` varchar(100);

-- Modify the data type of a column
 ALTER TABLE students
 MODIFY COLUMN `name` varchar(150);
 
 -- Renaming a column 
 ALTER TABLE students
 CHANGE COLUMN name fullname varchar(100);
 
 -- Drop/Delete a column
 ALTER TABLE students
 DROP COLUMN age;
 
 -- Drop/Delete Table
 -- DROP TABLE students;

-- Data Manipulation Language (DML)?
-- DML is used to manipulate data in the database. 

-- Insert data into the students table
INSERT INTO students (id, fullname, email, `password`)
VALUES (1, "John Doe", "John@doe.ca", "password123");

-- Insert multiple rows into the students table
INSERT INTO students (id, fullname, email, `password`)
VALUES (2, "Jane Doe", "Jane@doe.ca", "password123"),
(3, "Alice Doe", "Alice@doe.ca", "password123");

-- Selecting all data columns from the students table
SELECT * FROM students;

-- Selecting spoecific columns from the students table
SELECT id, fullname FROM students;

-- Selecting data based on a condition
SELECT * FROM students WHERE id > 1;


-- Update data in students table
UPDATE students 
SET `password` = "newPassword"
WHERE id = 1;

-- Update multiple records
UPDATE students 
SET `password` = "newPassword123"
WHERE id in (1,3);

-- DELETE data from students table 
DELETE FROM students WHERE id = 1;








