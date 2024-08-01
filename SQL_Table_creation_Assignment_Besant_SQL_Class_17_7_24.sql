/* 1. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id.*/

use besant;
create table assignment1(
country_id int primary key auto_increment not null,
Country_name char(50) not null,
Region_id int);
-- district varchar(100);
insert into assignment1(country_name,region_id) values('India',1001),('United states of america',1002),('Russia',1003),('China',1004),('Great Britian',1005),('Australia',1006),
('Switherland',1007),('Canada',1008),('Qatar',1009),('pakistan',1010);
select * from assignment1;
drop table assignment1;

/*2. Write a SQL statement to create a simple table countries including columns country_id, country_name , region_id and district  which is already exists.*/
alter table assignment1 add district varchar(255);
update assignment1 set district='Delhi' where Country_id=1;
update assignment1 set district='Washington D.C' where country_id=2;
update assignment1 set district='Moscow' where country_id=3;
update assignment1 set district='Beijing' where country_id=4;
update assignment1 set district='London' where country_id=5;
update assignment1 set district='Sydney' where country_id=6;
update assignment1 set district='Bern' where country_id=7;
update assignment1 set district='Ottawaa' where country_id=8;
update assignment1 set district='Doha' where country_id=9;
update assignment1 set district='Islamabad' where country_id=10;
select * from assignment1;
drop table assignment1;

/* 3. Write a SQL statement to change the data type country_name maximum char 40.*/

alter table assignment1 modify country_name char(40) not null;
describe assignment1;
select * from assignment1;


/*4. Write a SQL statement to change null value in region_id.*/
alter table assignment1 modify region_id varchar(100) not null default 'xxxx';
describe assignment1;

/*5. Write a SQL statement to rename column district into district_name.*/
alter table assignment1 change district district_name varchar(100);
select * from assignment1;

/*6. Write a SQL statement to add a foreign key into region_id.*/
create table dummytable1(
id int primary key auto_increment,
name char(50),
city varchar(20),
area char(20),
pincode int,
country_id int, 
constraint pk_regionid foreign key(country_id) references assignment1(country_id)
);
insert into dummytable1(name,city,area,pincode,country_id) values('Sriram Selvaraj','Chennai','Madipakkam',600091,1),('Silambarasan','Mumbai','Airoli',400708,2);
insert into dummytable1(name,city,area,pincode,country_id) values('Mohan','Kolkatta','Puri',300001,4);
select * from dummytable1;
drop table dummytable1;


/*7. Write a SQL statement to insert values into countries table.
	 country_id = 1
     country_name  = America 
     region_id = 221.
     District = loose angel
*/
use besant;
create table countries(
id1 int not null,
country_name1 char(20),
region_id1 int,
district1 varchar(20));
insert into countries(id1,country_name1, region_id1, district1) values(1,'America',221,'Lose Angels');
drop table countries;
select * from countries;
describe datatypes;

/*8.  Write a SQL statement to insert values into countries table. 
	country_id = 2
 country_name  = india
region_id = 331.
District = thanjavur.

country_id = 3
 country_name  = north korea  
region_id = 991.
District = xxxxxxx

*/
insert into countries(id1,Country_name1,region_id1,district1) values(2,'India',331,'Thanjavur'),(3,'North Korea',991,'xxxxxxx');
select * from countries;
drop table countries;

/*9. Write a SQL statement to insert value into countries table only country_id (11, 12, 13, 15).*/
insert into countries(id1) values(11),(12),(13),(15);
/*update countries set id1=11 where region_id1=221;
update countries set id1=12 where region_id1=331;
update countries set id1=13 where region_id1=991;*/
select * from countries;

/*10. Write a SQL statement to update the value region_id  = 331 to 551.*/
update countries set region_id1=331 where id1=12;
update countries set region_id1=551 where id1=13;  
select * from countries;

/*11. Write a SQL statement to update the value country_id = 991 to 000.*/
insert into countries(id1) values(000),(991);

/*12. Write a SQL statement to delete the region_id in north korea.*/
delete from countries where country_name1='north korea';

/*13. Write a SQL statement to delete a all data in district name.*/
-- alter table countries drop column district1;
update countries set district1='null' where 5>0;
/*14.Write a SQL statement to rename  the table countries into country*/
rename table countries to nations;
select * from nations;

/*15.Write a SQL statement to delete a column district in country table */
alter table countries drop column district1;

/*16.Write a SQL statement to remove the foreign key.*/
alter table countries drop foreign key pk_regionid;
show create table countries; 

