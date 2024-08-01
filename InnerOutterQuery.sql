-- Inner query and Outer query
use besant;
create table innerouterquery(price int, products varchar(50));
insert into innerouterquery values(50,'Bread'),(30,'Milk'),(48,'Sugar'),(67,'Rice'),(45,'Wheat flour');
select * from innerouterquery;
select price,products from innerouterquery where price>(select min(price) from innerouterquery having price>65);
drop table innerouterquery;

-- Create tables
use besant;
CREATE TABLE departments1 (
    id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments1(id)
);

-- Insert data into departments
INSERT INTO departments1 (id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');

-- Insert data into employees
INSERT INTO employees1 (id, name, department_id) VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3),
(4, 'David', 2),
(5, 'Eve', 1);

-- Find the name of the employee who working in finance department
select name from employees1 where department_id=(select id from departments1 where department_name='Finance');
select name from employees1 where department_id=(select id from departments1 where department_name='it');
-- select name from employees1 where department_id=(select id from dapartments1 where department_name='finance');
select * from departments1;
select * from employees1;
drop table employees1;
drop table departments1;


CREATE TABLE students (
    id INT auto_increment primary key,
    name VARCHAR(50),
    class_id INT,
    score DECIMAL(5, 2)
);

CREATE TABLE classes (
    id INT auto_increment primary key,
    name VARCHAR(50)
);
INSERT INTO classes (name) VALUES
('Mathematics'),
('Science'),
('English'),
('History');
INSERT INTO students (name, class_id, score) VALUES
('Alice', 1, 85.5),
('Bob', 1, 78.0),
('Charlie', 2, 92.3),
('David', 2, 88.4),
('Eve', 3, 76.9),
('Frank', 3, 81.2),
('Grace', 4, 90.0),
('Hannah', 4, 85.0),
('Ivy', 1, 91.0),
('Jack', 2, 79.5);

use besant;
select * from classes;
drop table classes;
select * from students;
drop table students;

-- To find the name of students who are in mathematics class
select distinct name from students where class_id=(select id from classes where name='mathematics');

-- Nested query in select clause 
-- To display each student name along with their class name
select s.name,(select c.name from classes c where c.id=s.class_id) as class_name from students s;

-- To find classes name science in students name and group by classes name
select distinct s.name,(select c.name from classes c where c.id=s.class_id) as class_name,score  from students s;

-- select distinct s.name from students s where s.class_id>=(select c.id=s.class_id ); 
select name,class_id,score from students where class_id=(select id from classes where name='history');
-- Nested query with IN operator 

-- Find the student who belong with english and science
select name,class_id,score from students where class_id in (select id from classes where name in ('science','history'));