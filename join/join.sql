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
select movies.mov_title from movies inner join director on movies.dir_id=director.dir_id where director.dir_name="Hitchcock";

#2






