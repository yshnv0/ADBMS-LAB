create database company;

use company;

create table emp(emp_id int primary key,emp_name varchar(20),salary varchar(20));

create table dept(dept_id int primary key,emp_id int,designation varchar(20),experience int(10) ,foreign key(emp_id) references emp(emp_id));
drop table dept;
insert into emp(emp_id,emp_name,salary)values(101,'Shibu',25000);
insert into emp(emp_id,emp_name,salary)values(102,'Raju',35000);
insert into emp(emp_id,emp_name,salary)values(103,'Shanku',50000);

select * from emp;

insert into dept(dept_id,emp_id,designation,experience)values(201,101,'Peon',2);
insert into dept(dept_id,emp_id,designation,experience)values(202,102,'Clerk',6);
insert into dept(dept_id,emp_id,designation,experience)values(203,103,'Manager',12);

select * from dept;

create table level(emp_id int,dept_id int,experience_level varchar(20),foreign key(emp_id) references emp(emp_id),foreign key(dept_id) references dept(dept_id));

call exp(2,101,201);
call exp(6,102,201);
call exp(12,103,203);

select * from level;


