create database bai_tap1;
use bai_tap1;
create table class(
id int not null,
name varchar(10)
);
create table teacher(
`id` int not null,
`name` varchar(45) null,
`age` int null,
`country` varchar(45) null,
primary key (`id`));
