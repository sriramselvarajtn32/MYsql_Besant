use besant;

/* create a table with id, ename,sal,depno with 5 records */
create table emp1(
id int, ename char(50),sal int,depno int);
insert into emp1 values(1,'Arjun',500,20),(2,'Manoj',200,10),(3,'Muthu',600,20),(4,'Siva',700,10),(5,'Surya',800,30);
select * from emp1;
drop table emp1;
-- write a query to display ename from emp table
select ename from emp1;

-- write a query to display salary and deprtment number from emp table 

select sal,depno from emp1;

-- write a query to display details of an employee 
select * from emp1;

-- create a table department it contains depno, dname,location
create table dept(depno int(50), dname char(50), location char(50));
insert into dept values(10,'Accounting','Thanjavur'),(20,'Sales','Chennai'),(30,'Development','Madurai');
select * from dept;
drop table dept;

-- write a query to display dname,location from dept table
select dname,location from dept;

-- write a query to display name, job, salary from employee table
use besant;
create table emp1(
id int, ename char(50),sal int,depno int);
insert into emp1 values(1,'Arjun',500,20),(2,'Manoj',200,10),(3,'Muthu',600,20),(4,'Siva',700,10),(5,'Surya',800,30);
alter table emp1 add column job char(50);
-- insert into emp1(job) values('Accountant'),('Civil Engineer'),('Plumber'),('Carpenter'),('Driver'); It update but create null values and then update
update emp1 set job = case
when id=1 then 'Accountant'
when id=2 then 'Civil Engineer'
when id=3 then 'Plumber'
when id=4 then 'Carpenter'
when id=5 then 'Driver'
else 'it'
end;
select ename,sal,job from emp1;
select * from emp1;
drop table emp1;

-- write a query to display emp name,hiredate, dep no from emp1 table
alter table emp1 add column Hire_date varchar(50) ;
update emp1 set Hire_date = case
when id=1 then '15/4/2023'
when id=2 then '5/2/1997'
when id=3 then '9/8/2004'
when id=4 then '1/4/2004'
when id=5 then '05/9/2024'
else 'it'
end;
select ename,hire_date,depno from emp1;

-- Write a query to display name, salary along with anual salary from emp1 table
select ename,sal, sal*12 as 'Anual Salary' from emp1;

-- write a query to display name, hiredate, half term salary from emp1 table
select ename,sal,sal*6 as 'Half Term Salary' from emp1;

-- TASK 1:
 -- 1. Display employment along with hiredate and job
 select * from emp1;
 
 -- 2. To display name, job, salary and 300 incentives
 select ename,job,sal,sal+300 as 'Incentives' from emp1;
 
 -- 3. To display name, job, salary of 500 bonus
 select ename,job,sal+500 as 'Bonus' from emp1;
 
 -- 4. Details of all employees
 select * from emp1;
 
 -- 5. Details of an employee along with anual salary
 select *,sal*12 as 'Anual Salary' from emp1;
 
 