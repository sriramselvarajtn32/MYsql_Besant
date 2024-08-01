-- to creating database 
CREATE DATABASE BESANT;

-- use database / select database
USE  BESANT;

-- creating table and constrains
CREATE TABLE CUSTOMER(
CID INT primary key auto_increment,
CNAME VARCHAR(40),
PHONE varchar(10) unique,
-- constraint CID_PK PRIMARY KEY (CID),
-- CONSTRAINT PH_CH UNIQUE (PHONE), 
check(length(phone)=10)
);
insert into customer(cname,phone) values('Sriram',7845257082),('mohan',7373473656),('selvaraj',9578529578),('Silambarasan',8056070826),('Nila',7418529630);

-- selecting full table
select * FROM customer;
drop table customer;



/* create table Product with productid,name,price */
CREATE TABLE PRODUCT(
PID INT auto_increment,
PNAME VARCHAR(40),
PRICE INT ,
constraint PID_PK PRIMARY KEY (PID),
CONSTRAINT PR_CH CHECK(PRICE>0)
);



/* SQL WHERE CLAUSE QUESTION */

-- 1. To display details of an employee as table as emp with random data
use besant;
create table emp(
id int primary key auto_increment,
name varchar(1000),
job varchar(100),
company varcharacter(50),
department char(20),
Department_no char(10) unique,
hire_date varchar(50),
salary varchar(50));
insert into emp(name,job,company,department,Department_no,hire_date,salary) values
('Sriram','Data_Analyst','Infosys','Computer',4688,curdate(),56000),

('Srividhya','Civil_Engineer','L&T','Civil',4899,'04/06/2018',75000),

('Silambarasan','AC_Techinician','Urban_Tree','Electrical',6523,'16/9/2019',48000),

('Selvaraj','Farmer','xxxx','Agricultural',7841,'1/1/2021',19500),

('Vasantha','House_wife','yyyy','Home_Maker',3718,'15/3/2023',15500),

('Obama','President','United_states','Politician',17,'15/18/2014',2500800),

('Bill kilington','President','United_states','Politician',15,'15/18/2019',2550000),

('Bush','President','United_states','Politician',2078,'15/18/2020',2530000),

('Abraham Lincon','President','United_states','Politician',25,'15/18/2021',2504000),

('Donald Trump','President','United_states','Politician',11,'15/18/2023',2501000),

('Raja','cleark','Govt_school','Management',6641,'17/6/2022',28000),

('Siva Vinayaga Vel','Manager','Bhavani Plastics and Polymer','Bussiness Man',7895,'23/3/2021',250000),

('Abdul','Salesman','Dell','Sales',1278,'04/05/24',42500);

select * from emp;
drop table emp;


-- 2. To write a query with employee name, job, and hiredate
select name,job,hire_date from emp; 

-- 3. To write a query with name,job,company,salary + 300 incentive
select name,job,company,salary,salary+300 as With_Incentive from emp;

-- 4. To write a query with name,job,salary and salary+500 as bonus
select name,job,salary,salary+500 as Bonus_500 from emp;

-- 5. To write a query with details of an employee along with anual salary
select name,job,salary,salary*12 as Anual_salary from emp;

-- 6. To write a query with employee department(as unique)
select name,department from emp;

-- 7. To write a query on employee details who working in department 11 as question. but we alter who working in 'computer'
select * from emp where department='computer';

-- 8. To write a query for employee number(id),name,Salary if the emp id is 2417 question. But we alter as '4'
select id,name,salary from emp where (id='4');

-- 9. To write a query to display details of an employees who getting salary below '100000'
select * from emp where salary<100000;

-- 10. Write a query to display the employees who are not working as 'President'
select * from emp where job!='President';

-- 11. Write a query to display of an employee who working as a 'cleark' in dep no '30'
select * from emp where job='cleark';

-- 12. To write a query to display of an employee who working as a manager or salesman
select * from emp where job='manager' or job='salesman';

-- 13. write a query to display name,job,dep no if employee working as a president in dep no 17,15,25,11
select name,job,department_no from emp where job='president' and department_no in (17,15,25,11); -- In this query if you run means it will error unique constraints as well as remove and constrains and run

-- 14. To display details of an employee who were getting commision 0 to 500 in department no 17,15
select name,job,department_no,salary,salary+500 as 'Commission' from emp where ('commission'=0 or 'commission'=500) and department_no in (17,15);

-- 15. To display employee number , emp name, job and commision if employee work as a salesman or manager and getting commision 300 to 400 except emp no 2517 or 1115
select id,name,job from emp where job='Salesman' or job='manager' and 'commision' between 300 and 400 and id not in(2517,1115);


-- 16.	To display details of an emp who where getting commission more than 300 but less than 500 
alter table emp add column commision int(50);
update emp set commision=salary*1/100 where id=1;
update emp set commision=salary*1/100 where id=2;
update emp set commision=salary*1/100 where id=3;
update emp set commision=salary*1/100 where id=4;
update emp set commision=salary*1/100 where id=5;
update emp set commision=salary*1/100 where id=6;
update emp set commision=salary*1/100 where id=7;
update emp set commision=salary*1/100 where id=8;
update emp set commision=salary*1/100 where id=9;
update emp set commision=salary*1/100 where id=10;
update emp set commision=salary*1/100 where id=11;
update emp set commision=salary*1/100 where id=12;
update emp set commision=salary*1/100 where id=13;
update emp set commision=salary*1/100 where id=14;
select * from emp;
select * from emp where commision>=300 and commision<=500;
-- select * from emp where commision between 300 and 500;

/*17. To write detils of an employee except who are getting commision 0 to 1000 */
insert into emp values(14,'Narendar Modi','President','India','Poltics',4466,'18/10/2011',1000000,0);
select * from emp where (commision>0 and commision<=1000);

/*18. Details of an employee who are getting salary less than 25000 and more than 50000*/
select salary from emp where salary between 25000 and 50000;

-- select count(salary) as 'Max_salary' from emp;
-- select * from emp; 