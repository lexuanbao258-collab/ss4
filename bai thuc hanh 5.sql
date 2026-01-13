create table employees (
    id int,
    full_name varchar(100),
    department varchar(50),
    position varchar(50),
    salary numeric(12,2),
    bonus numeric(12,2),
    join_year int
);

insert into employees (id, full_name, department, position, salary, bonus, join_year) values
(1, 'nguyễn văn huy', 'it', 'developer', 18000000, 1000000, 2021),
(2, 'trần thị mai', 'hr', 'recruiter', 12000000, null, 2020),
(3, 'lê quốc trung', 'it', 'tester', 15000000, 800000, 2023),
(4, 'nguyễn văn huy', 'it', 'developer', 18000000, 1000000, 2021),
(5, 'phạm ngọc hân', 'finance', 'accountant', 14000000, null, 2019),
(6, 'bùi thị lan', 'hr', 'hr manager', 20000000, 3000000, 2018),
(7, 'đặng hữu tài', 'it', 'developer', 17000000, null, 2022);

delete from employees e
using employees d
where e.id > d.id
  and e.full_name = d.full_name
  and e.department = d.department
  and e.position = d.position;

update employees
set salary = salary * 1.10
where department = 'it' and salary < 18000000;

update employees
set bonus = 500000
where bonus is null;

select *,
       (salary + bonus) as total_income
from employees
where (department = 'it' or department = 'hr')
  and join_year > 2020
  and (salary + bonus) > 15000000
order by (salary + bonus) desc
limit 3;

select *
from employees
where full_name ilike 'nguyễn%' or full_name ilike '%hân';

select distinct department
from employees
where bonus is not null;

select *
from employees
where join_year between 2019 and 2022;
