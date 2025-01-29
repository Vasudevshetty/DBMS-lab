create database if not exists company;
use company;

create table if not exists department (
    dno int primary key,
    dname varchar(35) not null,
    mgrssn int,
    mgrstartdate date
);

create table if not exists employee (
    ssn int primary key,
    ename varchar(35) not null,
    address varchar(50) not null,
    sec char(1),
    salary float,
    superssn int,
    dno int,
    foreign key (dno) references department(dno) on delete cascade
);

create table if not exists dlocation (
    dno int primary key,
    dloc varchar(255),
    foreign key (dno) references department(dno) on delete cascade
);

create table if not exists project (
    pno int primary key,
    pname varchar(25),
    ploc varchar(50),
    dno int,
    foreign key (dno) references department(dno) on delete cascade
);

create table if not exists works_on (
    ssn int,
    pno int,
    Hours int,
    primary key (ssn, pno),
    foreign key (ssn) references employee(ssn) on delete cascade,
    foreign key (pno) references project(pno) on delete cascade
);
