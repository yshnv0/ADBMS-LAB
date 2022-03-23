create database movie;
use movie;
create table movies(title varchar(20) primary key,director varchar(20) not null,myear int(10) not null,rating float(10) not null);
insert into movies(title,director,myear,rating)values('Fargo','Coen','1996',8.2);
insert into movies(title,director,myear,rating)values('Raising Arizona','Coen','1987',7.6);
insert into movies(title,director,myear,rating)values('Spiderman','Raimi','2002',7.4);
insert into movies(title,director,myear,rating)values('Wonder Boys','Hanson','2000',7.6);
select * from movies;

create table actors(actor varchar(20) primary key,ayear int(10) not null);
insert into actors(actor,ayear)values('Cage',1964);
insert into actors(actor,ayear)values('Hanks',1956);
insert into actors(actor,ayear)values('Maguire',1975);
insert into actors(actor,ayear)values('McDormand',1957);
select * from actors;

create table acts(actor varchar(20),title varchar(20),foreign key (actor) references actors(actor) on delete cascade,foreign key (title) references movies(title) on delete cascade);
select * from acts;
insert into acts(actor,title)values('Cage','Raising Arizona');
insert into acts(actor,title)values('Maguire','Spiderman');
insert into acts(actor,title)values('Maguire','Wonder Boys');
insert into acts(actor,title)values('McDormand','Fargo');
insert into acts(actor,title)values('McDormand','Raising Arizona');
insert into acts(actor,title)values('McDormand','Wonder Boys');

create table directors(director varchar(10) primary key,dyear int(10) not null);
insert into directors(director,dyear)values('Coen',1954);
insert into directors(director,dyear)values('Hanson',1945);
insert into directors(director,dyear)values('Raimi',1959);
select * from directors;

#1
select title from movies where myear>1997;
#2
select title from movies where director='Hanson' and myear>1997;
#3
select title,rating from movies;
#4
select movies.director,acts.actor from movies inner join acts on movies.title=acts.title;
#5
select movies.title from movies left outer join acts on movies.title=acts.title where director='Coen' and actor='McDormand' ;





