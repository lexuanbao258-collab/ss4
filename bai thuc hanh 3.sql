create table students (
    id int,
    full_name varchar(100),
    gender varchar(10),
    birth_year int,
    major varchar(50),
    gpa decimal(3,2)
);

insert into students (id, full_name, gender, birth_year, major, gpa) values
(1, 'nguyễn văn a', 'nam', 2002, 'cntt', 3.6),
(2, 'trần thị bích ngọc', 'nữ', 2001, 'kinh tế', 3.2),
(3, 'lê quốc cường', 'nam', 2003, 'cntt', 2.7),
(4, 'phạm minh anh', 'nữ', 2000, 'luật', 3.9),
(5, 'nguyễn văn a', 'nam', 2002, 'cntt', 3.6),
(6, 'lưu đức tài', null, 2004, 'cơ khí', null),
(7, 'võ thị thu hằng', 'nữ', 2001, 'cntt', 3.0);

insert into students (full_name, gender, birth_year, major, gpa)
values ('phan hoàng nam', 'nam', 2003, 'cntt', 3.8);

update students
set gpa = 3.4
where full_name = 'lê quốc cường';

delete from students
where gpa is null;

select *
from students
where major = 'cntt' and gpa >= 3.0
limit 3;

select distinct major
from students;

select *
from students
where major = 'cntt'
order by gpa desc, full_name asc;

select *
from students
where full_name ilike 'nguyễn%';

select *
from students
where birth_year between 2001 and 2003;
