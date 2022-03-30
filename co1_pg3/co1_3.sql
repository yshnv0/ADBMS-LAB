create database emp;
use emp;
create table employee(empno varchar(20) not null primary key,emp_name varchar(20) not null,dept varchar(20) not null,salary int not null,dob date not null,branch varchar(20) not null);

insert into employee (empno,emp_name,dept,salary,dob,branch) values ('E101','Amit','Production',45000,'2000-03-12','Bangalore');
insert into employee (empno,emp_name,dept,salary,dob,branch) values ('E102','Amit','HR',70000,'2002-07-03','Bangalore');
insert into employee (empno,emp_name,dept,salary,dob,branch) values ('E103','sunita','Manager',120000,'2001-01-11','Mysore');
insert into employee (empno,emp_name,dept,salary,dob,branch) values ('E104','sunita','IT',67000,'2001-08-01','Mysore');
insert into employee (empno,emp_name,dept,salary,dob,branch) values ('E105','mahesh','Civil',145000,'2003-09-20','Mumbai');

#1
select * from employee;

#2
select empno,salary from employee;

#3
select avg(salary) from employee;

#4
select count(empno) from employee;

#5
select count(distinct emp_name) from employee;

#6
select sum(salary),emp_name,count(emp_name) from employee group by emp_name having count(emp_name)>1;

#7
select sum(salary) from employee where salary>120000;

#8
select emp_name from employee order by emp_name desc;

#9
select * from employee where emp_name="Amit" and salary>50000;
