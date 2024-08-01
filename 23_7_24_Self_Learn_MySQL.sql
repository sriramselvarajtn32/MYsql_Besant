-- example for not in operator
use besant;
select name,department from emp
where company not in('L&T','xxxx');

-- write a details of an employee who are working as a farmer and teacher checking IN clause
select  name,job from emp
where job in ('farmer','teacher');
select * from emp;

-- To check between operator 
select department,department_no,name,salary from emp where salary between 200000 and 500000;

-- To check NOT BETWEEN operator
select name,department_no from emp where Department_no not between 2000 and 5000;

-- To check IS operator
-- Create the employees table
CREATE TABLE employees2 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT
);
drop table employees2;
-- Insert values into the employees table
INSERT INTO employees2 (id, name, department, manager_id) VALUES
(1, 'Alice', 'HR', NULL),
(2, 'Bob', 'Sales', 1),
(3, 'Carol', 'IT', 1),
(4, 'Dave', 'HR', 2),
(5, 'Eve', 'Sales', NULL),
(6, 'Frank', 'IT', 3),
(7, 'Grace', 'IT', NULL),
(8, 'Heidi', 'Sales', 2);

select * from employees2;

-- To check IS operator 
-- Find employees who do not have a manager:
select name,manager_id from employees2 where manager_id is not null;
select name,manager_id from employees2 where manager_id is null;

/* LIKE operator */
-- Create the employees table
CREATE TABLE likeoperator (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- Insert values into the employees table
INSERT INTO likeoperator (id, name, department) VALUES
(1, 'Alice', 'HR'),
(2, 'Bob', 'Sales'),
(3, 'Carol', 'IT'),
(4, 'Dave', 'HR'),
(5, 'Eve', 'Sales'),
(6, 'Frank', 'IT'),
(7, 'Grace', 'IT'),
(8, 'Heidi', 'Sales'),
(9, 'Ivan', 'HR'),
(10, 'Jack', 'IT');
select * from likeoperator;
drop table likeoperator;
-- Find employees who start with ''A'
select id,name,department from likeoperator where name like 'A%';

-- Find employees who name ends with 'e'
select id,name,department from likeoperator where name like '%e';

-- Find employees who name have 'a'
select name from likeoperator where name like '%a%';

-- Find employees who's name second character have '_a%'
select name from likeoperator where name like '_a%';

-- Find an employees name those starts with 'A' and end with 'e'
select name from likeoperator where name like 'A%e';

-- Find employees whose name starts with 'H' and have only 5 characters
select name from likeoperator where name like 'h____';

-- Find an employee who name last 2nd character ends with 'c'
select name from likeoperator where name like '%c_';

-- using wildcard characters in like opoerator allows flexible and powerful pattern matching

/* Multi-row Function
For beginners, working with multiple rows in MySQL often involves using aggregate functions and grouping operations. These allow you to perform calculations and summaries over groups of rows. Here’s a simplified guide to some common multi-row functions in MySQL, complete with examples.

Common Aggregate Functions
COUNT(): Counts the number of rows.
SUM(): Adds up the values of a column.
AVG(): Calculates the average of a column.
MAX(): Finds the maximum value in a column.
MIN(): Finds the minimum value in a column.
Example Dataset
Let’s use the employees table with these columns:

id: Employee ID
name: Employee name
department: Department of the employee */

-- Create the employees table
use besant;
CREATE TABLE multirowfunction(
    id INT,
    name VARCHAR(50),
    department VARCHAR(50)
);
drop table multirowfunction;
-- Insert values into the employees table
INSERT INTO multirowfunction (id, name, department) VALUES
(1, 'Alice', 'HR'),
(2, 'Bob', 'Sales'),
(3, 'Carol', 'IT'),
(4, 'Dave', 'HR'),
(5, 'Eve', 'Sales'),
(6, 'Frank', 'IT'),
(7, 'Grace', 'IT'),
(8, 'Heidi', 'Sales'),
(9, 'Ivan', 'HR'),
(10, 'Jack', 'IT');

-- to count the number of employees in each department
select * from multirowfunction;

-- Count(*)
select department, count(*) as 'number_of_employees' from multirowfunction group by department;

-- Min 
-- select department
CREATE TABLE multirowfunctionsum(
    employee_id INT auto_increment,
    department VARCHAR(50),
    salary INT
);
INSERT INTO multirowfunctionsum (employee_id, department, salary) VALUES
(1, 'HR', 50000),
(2, 'HR', 60000),
(3, 'IT', 75000),
(4, 'IT', 80000),
(5, 'Sales', 45000),
(6, 'Sales', 47000);
select * from multirowfunctionsum;
select department,avg(salary) as Total_Salary from multirowfunctionsum group by department;

-- Min
CREATE TABLE multirowfunctionusehiredate (
    employee_id INT,
    job_title VARCHAR(50),
    hire_date DATE
);
INSERT INTO multirowfunctionusehiredate (employee_id, job_title, hire_date) VALUES
(1, 'Manager', '2010-05-10'),
(2, 'Manager', '2012-08-21'),
(3, 'Developer', '2015-01-15'),
(4, 'Developer', '2017-03-22'),
(5, 'Salesperson', '2013-06-30'),
(6, 'Salesperson', '2014-09-17');

select job_title,avg(hire_date) as joining_Date from multirowfunctionusehiredate group by job_title;
drop table multirowfunctionusehiredate;

-- Concatenation
select concat('Your name is ',concat('Sriram Selvaraj')) as Concatenation from dual;
-- BETWEEN AND NOT BETWEEN OPERATOR
USE BESANT;
select * from multirowfunction;
alter table multirowfunction add column salary varchar(100);
update multirowfunction set salary='5560' where id=1;
update multirowfunction set salary='2463' where id=2; 
update multirowfunction set salary='3981' where id=3; 
update multirowfunction set salary='2589' where id=4; 
update multirowfunction set salary='4860' where id=5; 
update multirowfunction set salary='1289' where id=6; 
update multirowfunction set salary='5975' where id=7; 
update multirowfunction set salary='8891' where id=8; 
update multirowfunction set salary='6486' where id=9; 
update multirowfunction set salary='2200' where id=10; 
alter table multirowfunction add column commision int;
-- 1.	Ename, sal, com given all emp who where getting commission between 0 to 1200 and except who where getting sal between 2500 to 5000. 
select name,salary,(salary*25/100) as 'Commision' from multirowfunction;
insert into multirowfunction(id,commision) values(1,salary=salary*25/100),(2,salary=salary*25/100);
update multirowfunction set commision=salary*25/100;

-- 2.	Details of an emp except who where getting commission between 0 to 1400. 
use besant;
select * from multirowfunction;
select * from multirowfunction where commision between 100 and 1400;

-- 3.	Ename, sal if the emp getting sal less than 1250 but more than 2500. 
select name,salary from multirowfunction where salary not between 1250 and 2500;

-- 4.	Ename , commission given to all emp if the emp getting commission more than 0 but less than equal to 1000. 
select name,commision from multirowfunction where commision between 0 and 1000;
 
-- Concatenation
select concat('Your name is ',concat(name,concat(' and your commision is  ',concat(commision)))) as Name_and_commision from multirowfunction;

 select concat(lower(substring('sriram',1,1)),upper(substring('sriram',2,1)),lower(substring('sriram',2,5))) as name from dual;
select * from multirowfunction;

-- Subquery concept
select name,salary,department from multirowfunction where salary>=(select salary where department='sales'group by department having salary>5000);
select salary as 'Salary Greater than 3500',commision from multirowfunction where salary=(select salary having salary>3500);
select department,salary,commision from multirowfunction where commision=(select commision where department='hr' group by department having commision>1000);

-- Nested query using hiredate
select * from multirowfunctionusehiredate;
-- details of an employee id   if employee who hired date below 01/01/2024 and greater than 1/1/2015
select * from multirowfunctionusehiredate where hire_date>=(select hire_date having hire_date between '2015/01/01' and '2024/01/01'); 

