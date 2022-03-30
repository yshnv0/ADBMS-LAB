create database department;
use department;
create table dept(deptno int(10) primary key,dname varchar(20),loc varchar(20));
select * from dept;

#1
rename table dept to department;
select * from department;

#2
alter table department add column pincode int(10) not null;
select * from department;

#3
alter table department drop column pincode;
select * from department;

#4
alter table department change column dname dept_name varchar(20);
select * from department;

#5
alter table department modify column loc char(10);
select * from department;

#6
drop table department;



