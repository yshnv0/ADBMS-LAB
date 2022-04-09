create database MovieDatabase;
use MovieDatabase;

create table actor(act_id int(10) primary key,name varchar(20) not null,act_gender varchar(10));

create table director(dir_id int(10) primary key,dir_name varchar(20) not null,dir_phone varchar(15));

create table movies(mov_id int(10) primary key,mov_title varchar(20) not null,mov_year year,mov_lang varchar(20),dir_id int(10),foreign key(dir_id) references director(dir_id));

create table movie_cast(act_id int(10),mov_id int(10),role varchar(15),foreign key(act_id) references actor(act_id),foreign key(mov_id) references movies(mov_id));

create table rating(mov_id int(10),rev_stars int(10),foreign key(mov_id) references movies(mov_id));

insert into actor(act_id,name,act_gender)values(101,'fahadh','male');
insert into actor(act_id,name,act_gender)values(102,'cillian murphy','male');
insert into actor(act_id,name,act_gender)values(103,'rose','female');
insert into actor(act_id,name,act_gender)values(104,'tom holland','male');
insert into actor(act_id,name,act_gender)values(105,'unni mukundan','male');

select * from actor;

insert into director(dir_id,dir_name,dir_phone)values(201,'Hitchcock','1234');
insert into director(dir_id,dir_name,dir_phone)values(202,'Steven Spielberg','2255');
insert into director(dir_id,dir_name,dir_phone)values(203,'Prithviraj','6789');

select * from director;

insert into movies(mov_id,mov_title,mov_year,mov_lang,dir_id)values(301,'hi bro',2018,'english',201);
insert into movies(mov_id,mov_title,mov_year,mov_lang,dir_id)values(302,'hello guys',2009,'english',201);
insert into movies(mov_id,mov_title,mov_year,mov_lang,dir_id)values(303,'okay',1998,'english',202);
insert into movies(mov_id,mov_title,mov_year,mov_lang,dir_id)values(304,'hmmmm',2016,'english',202);
insert into movies(mov_id,mov_title,mov_year,mov_lang,dir_id)values(305,'noooo',1999,'english',203);

select * from movies;

SET foreign_key_checks = 0;
insert into movie_cast(act_id,mov_id,role)values(104,304,'hero');
insert into movie_cast(act_id,mov_id,role)values(104,302,'supporting role');
insert into movie_cast(act_id,mov_id,role)values(101,305,'supporting role');
insert into movie_cast(act_id,mov_id,role)values(102,301,'hero');
insert into movie_cast(act_id,mov_id,role)values(103,303,'heroine');
insert into movie_cast(act_id,mov_id,role)values(105,305,'supporting role');
insert into movie_cast(act_id,mov_id,role)values(102,305,'villain');

select * from movie_cast;

insert into rating(mov_id,rev_stars)values(301,4);
insert into rating(mov_id,rev_stars)values(302,3);
insert into rating(mov_id,rev_stars)values(303,2);
insert into rating(mov_id,rev_stars)values(304,3);
insert into rating(mov_id,rev_stars)values(305,4);

select * from rating;

#1
SELECT movies.mov_title FROM movies INNER JOIN director ON movies.dir_id=director.dir_id WHERE director.dir_name="Hitchcock";

#2
SELECT M.mov_title
FROM movies M JOIN movie_cast MC 
ON M.mov_id=MC.mov_id
WHERE MC.mov_id in (
SELECT M.mov_id 
FROM movies M JOIN movie_cast MC 
ON M.mov_id=MC.mov_id
GROUP BY M.mov_id 
HAVING COUNT(MC.act_id)>1)
GROUP BY MC.act_id 
HAVING COUNT(MC.mov_id)>1;

#3
SELECT DISTINCT a.name 
FROM actor a JOIN movie_cast mc 
ON a.act_id=mc.act_id 
JOIN movies m 
ON m.mov_id=mc.mov_id
WHERE
CAST(m.mov_year AS Decimal) < 2000 or
CAST(m.mov_year AS Decimal) > 2015;

#4
SELECT m.mov_title,max(r.rev_stars) 'Top Stars' 
FROM rating r JOIN movies m 
ON r.mov_id=m.mov_id 
WHERE r.rev_stars>0 
GROUP BY m.mov_title 
ORDER BY m.mov_title ;

#5
UPDATE rating 
SET rev_stars=5
WHERE mov_id IN (
SELECT m.mov_id
FROM movies m JOIN director d 
ON m.dir_id=d.dir_id
WHERE d.dir_name="steven spielberg");














