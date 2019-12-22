create database school;

use school;

create table department(
dept_name int primary key,
building varchar(50) not null,
budget int
);

create table course(
course_id int primary key,
title varchar(50) not null,
dept_name int,
FOREIGN KEY (dept_name) REFERENCES department(dept_name),
credits int
);

create table student(
id int primary key,
name varchar(50) not null,
dept_name int,
FOREIGN KEY (dept_name) REFERENCES department(dept_name),
tot_cred int
);

create table instructor(
id int primary key,
name varchar(50) not null,
dept_name int,
FOREIGN KEY (dept_name) REFERENCES department(dept_name),
salary int
);

create table advisor(
s_id int,
i_id int,
FOREIGN KEY (s_id) REFERENCES student(id),
FOREIGN KEY (i_id) REFERENCES instructor(id)
);

create table prereq(
course_id int,
prereq_id int,
FOREIGN KEY (course_id) REFERENCES course(course_id)
);

create table classroom(
building varchar(50) not null unique,
room_no int(4) not null unique,
capacity int(3),
 PRIMARY KEY (building, room_no)
);

create table time_slot(
time_slot_id int primary key not null unique,
day int(2),
start_time varchar(10),
end_time varchar(10)
);

create table section(
course_id int unique,
sec_id int not null unique,
semester int(2) not null unique,
year_no int(4) not null unique,
building varchar(50) not null,
room_no int(4) not null,
time_slot_id int unique,
CONSTRAINT FOREIGN KEY (course_id) REFERENCES course(course_id),
CONSTRAINT FOREIGN KEY (room_no) REFERENCES classroom(room_no),
CONSTRAINT FOREIGN KEY (building) REFERENCES classroom(building),
CONSTRAINT FOREIGN KEY (time_slot_id) REFERENCES time_slot(time_slot_id),
PRIMARY KEY (sec_id)
);

create table takes(
id int not null,
course_id int unique,
sec_id int not null unique,
semester int(2) not null unique,
year_no int(4) not null unique,
grade char(1),
CONSTRAINT FOREIGN KEY (course_id) REFERENCES section(course_id),
CONSTRAINT FOREIGN KEY (sec_id ) REFERENCES section(sec_id),
CONSTRAINT FOREIGN KEY (semester) REFERENCES section(semester),
CONSTRAINT FOREIGN KEY (year_no) REFERENCES section(year_no),
CONSTRAINT FOREIGN KEY (id) REFERENCES student(id)
);

create table teaches(
id int not null,
course_id int unique,
sec_id int not null unique,
semester int(2) not null unique,
year_no int(4) not null unique,
CONSTRAINT FOREIGN KEY (course_id) REFERENCES section(course_id),
CONSTRAINT FOREIGN KEY (sec_id ) REFERENCES section(sec_id),
CONSTRAINT FOREIGN KEY (semester) REFERENCES section(semester),
CONSTRAINT FOREIGN KEY (year_no) REFERENCES section(year_no),
CONSTRAINT FOREIGN KEY (id) REFERENCES instructor(id)
);


show tables;
