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
create table tb2(id int,name char(10));
insert into tb2(id,name)values(110,'Ashik');
insert into tb2(id,name)values(120,'Razik');
insert into tb2(id,name)values(130,'Jamal');
select * from tb2;

select id,name,inc(id) from tb2;

/* function
CREATE DEFINER=`root`@`localhost` FUNCTION `inc`(id int) RETURNS int(11)
BEGIN
declare incen int(10);
if(id=110) then
set incen=5000;
else
set incen=0;
end if;
RETURN incen;
END
*/

#3
create database book;
use book;

create table book(book_name varchar(50),author_name varchar(20),price int,quantity int);

insert into book(book_name,author_name,price,quantity)values('Ikigai','Hector Garcia',245,2);
insert into book(book_name,author_name,price,quantity)values('The Alchemist','Paulo Coehlo',350,6);
insert into book(book_name,author_name,price,quantity)values('The Subtle Art of Not Giving a F**k','Mark Manson',475,1);
select * from book;

#a
set sql_safe_updates=0;
update  book set quantity=quantity*2;

#b
