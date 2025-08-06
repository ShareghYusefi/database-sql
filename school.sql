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
VALUES (3, "John Doe", "John@doe.ca", "password123");

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

-- What is a Primary Key (PK)? 
-- primary key: a unique identifier for a record in a table. It's used to establish a relationship between tables.
-- auto_increment: automatically generate a unique value for the primary key.

-- Change id columns to auto incrementing PK.
  ALTER TABLE students
 CHANGE COLUMN id id int primary key auto_increment;

-- Insert multiple rows into the students table without an id
INSERT INTO students (fullname, email, `password`)
VALUES ("Jane Doe", "Jane@doe.ca", "password123"),
("Alice Doe", "Alice@doe.ca", "password123");

-- What is a Foreign Key (FK)? 
-- A foreign key is a column in a table which references the primary key of another table. It's used to establish a relationship between the tables.

-- What are Cascading actions? 
-- They are used to define what happens when a record in a parent table is deleted.
-- There are different types of cascading actions: RESTRICT, CASCADE, SET NULL, and NO ACTION. 

-- RESTRICT: This the default behavior. It prevents the deletion or update of a record in the parent table(students) if there are relatd records in the child table(course).
-- CASCADE: This will automatically delete or update related records in child table(courses) when the parent table(students) is deletes or updates a record.
-- SET NULL: This will set the foreign key colum in the child table (courses) to NULL when a record in the parent table is deleted. 
-- NO ACTION: This is similar to RESTRICT. PREvents the deletion or udpate of a record in the parent table if there are related records in the child table.

-- Courses Table
CREATE TABLE courses (
	id int primary key auto_increment, 
    `name` varchar(100), 
    student_id int,
    -- student_id(fk) column in the courses table references the id(pk) column in students
    foreign key (student_id) references students(id) 
    on delete CASCADE on update CASCADE
);

-- Insert data into courses 
INSERT INTO courses (name, student_id)
VALUES ("Math", 2), ("Science", 4), ("History", 5), ("English", 2), ("Art", 1);

-- Inserting a student_id which does not exist in the students table, we will get an error.
INSERT INTO courses (name, student_id) VALUES ("Math", 10);

-- Ordering by a column in descending/ascending order
SELECT * FROM courses ORDER BY `name` asc;

-- Limiting the number of rows returned
SELECT * FROM courses ORDER BY `name` asc limit 3;

-- Aggregate functions
-- An aggregate function is a function that performs a calculation on a set of values, and returns a single value.
-- This query will return the student_id column and a count column that shows the number of courses each student is taking. This is accomplished by using the COUNT function with the GROUP BY clause. 
SELECT student_id, count(student_id) as "Records in Table" FROM courses GROUP BY student_id;

-- Joining Tables 
-- There are different ways to join tables: Inner Join, Left Join, Right Join, and Full Join. 

-- Inner Join: This returns rows when there is at least one match on both tables. 
SELECT * 
FROM students
JOIN courses
ON student.id = courses.student_id;











