create database if not exists sailors;

use sailors;

create table
    if not exists sailors (
        sid int primary key,
        sname varchar(35) not null,
        rating float not null,
        age int not null
    );

create table
    if not exists boat (
        bid int primary key,
        bname varchar(35) not null,
        color varchar(25) not null
    );

create table
    if not exists reserves (
        sid int not null,
        bid int not null,
        day date,
        primary key (sid, bid, day),
        foreign key (sid) references sailors (sid) on delete cascade,
        foreign key (bid) references boat (bid) on delete cascade
    );