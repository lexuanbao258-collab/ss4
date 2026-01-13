create table students (
    id serial primary key,
    name varchar(50),
    age int,
    major varchar(50),
    gpa decimal(3,2)
);

insert into students (name, age, major, gpa) values
('an', 20, 'cntt', 3.5),
('bình', 21, 'toán', 3.2),
('cường', 22, 'cntt', 3.8),
('dương', 20, 'vật lý', 3.0),
('em', 21, 'cntt', 2.9);

insert into students (name, age, major, gpa)
values ('hùng', 23, 'hóa học', 3.4);

update students
set gpa = 3.6
where name = 'bình';

delete from students
where gpa < 3.0;

select name, major
from students
order by gpa desc;

select distinct name
from students
where major = 'cntt';

select *
from students
where gpa between 3.0 and 3.6;

select *
from students
where name like 'c%';

select *
from students
order by name asc
limit 3 offset 1;
