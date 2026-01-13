create table products (
    id serial primary key,
    name varchar(50),
    category varchar(50),
    price decimal(10,2),
    stock int
);

insert into products (name, category, price, stock) values
('laptop dell', 'electronics', 1500.00, 5),
('chuột logitech', 'electronics', 25.50, 50),
('bàn phím razer', 'electronics', 120.00, 20),
('tủ lạnh lg', 'home appliances', 800.00, 3),
('máy giặt samsung', 'home appliances', 600.00, 2);

insert into products (name, category, price, stock)
values ('điều hòa panasonic', 'home appliances', 400.00, 10);

update products
set stock = 7
where name = 'laptop dell';

delete from products
where stock = 0;

select *
from products
order by price asc;

select distinct category
from products;

select *
from products
where price between 100 and 1000;

select *
from products
where name ilike '%lg%' or name ilike '%samsung%';

select *
from products
order by price desc
limit 2;

select *
from products
order by price desc
limit 2 offset 1;
