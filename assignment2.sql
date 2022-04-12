create database assignment;
use assignment;

#1
create table tb1(id int,name char(10));

call ins(1);
call ins(2);
call ins(3);

/* procedure

CREATE DEFINER=`root`@`localhost` PROCEDURE `ins`(id int)
BEGIN

if(id=1)
then
insert into tb1 values(id,"Sunil");
elseif(id=2)
then
insert into tb1 values(id,"Anil");
elseif(id=3)
then
insert into tb1 values(id,"Manil");
end if;

END

*/

select * from tb1;

#2
create table tb2(id int,name varchar(20),salary int(10));
insert into tb2(id,name,salary)values(110,'Mammad',25000);
insert into tb2(id,name,salary)values(120,'Abdu',35000);
insert into tb2(id,name,salary)values(130,'Kunju',65000);

select * from tb2;

/* function

CREATE DEFINER=`root`@`localhost` FUNCTION `inc`(id int,salary int) RETURNS int
    DETERMINISTIC
BEGIN

declare incen int(10);
if(id=110) then
set incen=salary+3000;
else
set incen=salary;
end if;


RETURN incen;
END

*/
select id,name,inc(id,salary) from tb2;

#3
create database book;
use book;

create table book(book_name varchar(50),author_name varchar(20),price int,quantity int);

insert into book(book_name,author_name,price,quantity)values('Ikigai','Hector Garcia',245,2);
insert into book(book_name,author_name,price,quantity)values('The Alchemist','Paulo Coehlo',350,6);
insert into book(book_name,author_name,price,quantity)values('The Subtle Art of Not Giving a F**k','Mark Manson',475,1);
insert into book(book_name,author_name,price,quantity)values('Database for Dummies','Adam Joan',280,3);
insert into book(book_name,author_name,price,quantity)values('Veronica decides to die','Paulo Coehlo',500,4);
insert into book(book_name,author_name,price,quantity)values('The Pilgrimage','Paulo Coehlo',400,2);
select * from book;

#a
set sql_safe_updates=0;
update  book set quantity=quantity*2;

#b
select book_name from book where price>(select price from book where book_name="Database for Dummies");

#c
select author_name,book_name,price from book where author_name like "A%" or "a%";

#d

/* procedure

CREATE DEFINER=`root`@`localhost` PROCEDURE `nob`(author varchar(20))
BEGIN

select sum(quantity) as totalbooks from book where author_name like author;

END

*/

call nob('Hector Garcia');
call nob('Paulo Coehlo');
call nob('Mark Manson');
call nob('Adam Joan');

#4
create database comp;
use comp;

create table administration(employee_salary int,development_cost int,fund_amount int,turn_over int,bonus int);

create table emp_details(emp_no int,emp_name varchar(20),DOB date,address varchar(20),doj date,mobile_no varchar(15),dept_no int,salary int);

insert into administration(employee_salary,development_cost,fund_amount,turn_over,bonus)values(25000,30000,240000,2500000,50000);
insert into administration(employee_salary,development_cost,fund_amount,turn_over,bonus)values(45000,70000,670000,8900000,80000);
insert into administration(employee_salary,development_cost,fund_amount,turn_over,bonus)values(55000,80000,540000,7500000,40000);

select * from administration;

insert into emp_details(emp_no,emp_name,DOB,address,doj,mobile_no,dept_no,salary)values(201,'Dharmendran','1995-08-23','Kannur','2015-06-24',9871236904,405,55000);
insert into emp_details(emp_no,emp_name,DOB,address,doj,mobile_no,dept_no,salary)values(202,'Rajendran','1989-04-13','Kozhikode','2011-06-14',98451237645,408,85000);
insert into emp_details(emp_no,emp_name,DOB,address,doj,mobile_no,dept_no,salary)values(203,'Veerendran','1998-09-23','Ernakulam','2018-03-23',9808136954,409,45000);
insert into emp_details(emp_no,emp_name,DOB,address,doj,mobile_no,dept_no,salary)values(204,'Sumesh','1986-12-20','Kollam','2019-05-23',9876543210,405,75000);
insert into emp_details(emp_no,emp_name,DOB,address,doj,mobile_no,dept_no,salary)values(203,'Ramesh','1986-12-20','Kollam','2019-05-23',9854213568,408,89000);

select * from emp_details;

#a
select dept_no,sum(salary),avg(salary) from emp_details group by dept_no;

#b
select sum(employee_salary) as total_salary from administration;

#c
