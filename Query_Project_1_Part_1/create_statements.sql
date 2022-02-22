create database Project_1;
use Project_1;


create table Employee ( 
Fname varchar(15) NOT null,
Minit char,
Lname varchar(15) not null,
SSN char(9) not null,
Bdate date,
Address varchar(30),
Sex char,
Salary decimal(10,2),
Super_SSN char(9),
Dno int not null,
primary key(SSN)
);

create table Department ( 
Dname varchar(15),
Dnumber int not null,
Mgr_SSN char(9) not null,
Mgr_start_date date,
unique (Dname),
foreign key(Mgr_SSN) references Employee(SSN),
primary key(Dnumber)
);

create table Dept_Locations ( 
Dnumber int not null,
Dlocation varchar(15),
primary key(Dnumber, Dlocation),
foreign key(Dnumber) references Department(Dnumber)
);

create table Project ( 
Pname varchar(15) unique,
Pnumber int not null,
Plocation varchar(15),
Dnum int not null,
foreign key(Dnum) references Department(Dnumber),
primary key(Pnumber)
);

create table Works_On ( 
ESSN char(9) not null,
Pno int not null,
Hours decimal(3,1) not null,
primary key(ESSN, Pno),
foreign key(ESSN) references Employee(SSN),
foreign key(Pno) references Project(Pnumber)
);

show tables in Project_1;

Drop table employee;
Drop table department;
Drop table dept_locations;
Drop table Project;
Drop table works_on;
