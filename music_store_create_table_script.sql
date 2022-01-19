create table if not exists Genre (
	id serial primary key,
	Title varchar(35) not null unique);

create table if not exists Singer (
	id serial primary key,
	Singer_name text not null,
	Alias text not null unique,
	id_genre serial references Genre(id));
	
create table if not exists Album (
	id serial primary key,
	Title text not null,
	Year_of_creation integer not null,
	Info text,
	id_singer serial references Singer(id));
	
create table if not exists Song (
	id serial primary key,
	Title text not null,
	Duration timestamp not null,
	id_singer serial references Singer(id),
	id_album serial references Album(id));
	
