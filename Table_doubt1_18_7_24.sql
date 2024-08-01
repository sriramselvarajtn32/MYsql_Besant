use besant;
create table doubt1(
customer_id int auto_increment,
cus_name char(20),
cus_address char(20),
city char(50),
zipcode int
);
insert into doubt1 values(1,'vinod','velachery','chennai',600042);
insert into doubt1(cus_name) values('Sriram');
insert into doubt1(city) values('Madipakkam');
select * from doubt1;
drop table doubt1;