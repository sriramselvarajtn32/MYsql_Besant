use details;
drop table exer_query;
create table exer_query(
id char(50),
ename varchar(100),
sal varchar(100),
dep_no varchar(100),
work_details varchar(100));

select * from exer_query;
insert into exer_query value(1,"Arjun",500,20,'Farmer'),(2,"Manoj",200,10,'student'),(3,"Muthu",600,20,'Unemployee'),(4, "Siva",700,10,'farmer'),(5,"Arjun",800,30,'student');

/* to check distinct */
-- without distinct 
select dep_no from exer_query;

/* To check with distinct */ -- -- there is no duplicate query in the above results
select distinct ename from exer_query;


/* Try with two coloumns */ 
/* to check with unique keyword */
/* select unique ename, dep_no from exer_query */
select distinct ename,dep_no from exer_query; 


/* Where clause 
it is used to filter the record from the table not orginal data will be affected
it alwayse execute row by row 
where clause must have true or false condition 
we can pass multiple argument to the where clause
we can't able to use alias (As) keyword in where condition */

-- write a query to display emp name, sal if the ename='arjun'
select id,ename, sal from exer_query where ename='arjun';

-- To display entire row of particular ename
select * from exer_query where ename='arjun';

/* To display details of an employee who ename='monoj' */
select * from exer_query where ename='Manoj';

/* alter the existing table as well as remove the work details column */
alter table exer_query drop work_details;
describe exer_query;

select * from exer_query;
-- alter table exer_query rename 

/* create new database as new_database_empdetails as well as copy the existing table name emp_details from old database details */
create database new_database_empdetails;  -- first of all create new database 

use details; -- run existing databases to check avaiable databases 

show tables; -- to view available tables and note which table do you want to copy it.

/* In order to copy details no need to get into new database in any table you can execute this query .
query is very simple but first of all you should understant it. 
syntax: create table (new_database name).(old_database exist table name) as(keyword) select * from (old_database name).existing table name; */ 
create table new_database_empdetails.emp_details as select * from details.emp_details;

-- To check this drop this table, and databases
drop table emp_details;





