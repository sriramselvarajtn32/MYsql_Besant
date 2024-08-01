create table Date20_07_24(hiredate date);
describe table date20_07_24;
insert into date20_07_24 values('1999/06/04'),('2024/08/24');
select * from date20_07_24;
select hiredate from date20_07_24 where hiredate>'2000/01/01';
select hiredate from date20_07_24 where str_to_date(hiredate,'%m%d%Y') > '1999/06/04';
drop table date20_07_24;
select hiredate from date20_07_24 where hiredate> 1990;
select str_to_date('1991/06/04','%Y/%m/%D') as 'Dates' from dual;