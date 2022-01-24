create table if not exists Genre (
	id serial primary key,
	Title varchar(35) not null unique);


create table if not exists Singer (
	id serial primary key,
	Singer_name text not null,
	Alias text not null unique);


create table if not exists SingerGenge (
	id serial primary key,
	singer integer references Singer(id),
	genre integer references Genre(id));
	
	
create table if not exists Album (
	id serial primary key,
	Title text not null,
	Year_of_creation integer not null,
	Info text);


create table if not exists AlbumSinger (
	id serial primary key,
	singer integer references Singer(id),
	album integer references Album(id));
	

create table if not exists Collection (
	id serial primary key,
	Title text not null,
	Year_of_creation integer not null);

	
create table if not exists Song (
	id serial primary key,
	Title text not null,
	Duration integer not null,
	id_album integer references Album(id));


create table if not exists SongCollection (
	id serial primary key,
	song integer references Song(id),
	collection integer references Collection(id));
	
-- 	Дополнительное задание
create table if not exists Department (
	id serial primary key,
	Title text not null unique);

	
create table if not exists Employee (
	id serial primary key,
	Name varchar(100) not null,
	chief boolean not null,
	department integer references Department(id));


create table if not exists Chief (
	id integer references Employee(id));


create table if not exists ChiefEmployee (
	id serial primary key,
	chief integer references Chief(id),
	subordinate integer references Employee(id));

	
