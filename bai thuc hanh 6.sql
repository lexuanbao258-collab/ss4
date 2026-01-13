create table books (
    id int,
    title varchar(150),
    author varchar(100),
    category varchar(50),
    publish_year int,
    price numeric(12,2),
    stock int
);

insert into books (id, title, author, category, publish_year, price, stock) values
(1, 'lập trình c cơ bản', 'nguyễn văn nam', 'cntt', 2018, 95000, 20),
(2, 'học sql qua ví dụ', 'trần thị hạnh', 'csdl', 2020, 125000, 12),
(3, 'lập trình c cơ bản', 'nguyễn văn nam', 'cntt', 2018, 95000, 20),
(4, 'phân tích dữ liệu với python', 'lê quốc bảo', 'cntt', 2022, 180000, null),
(5, 'quản trị cơ sở dữ liệu', 'nguyễn thị minh', 'csdl', 2021, 150000, 5),
(6, 'học máy cho người mới bắt đầu', 'nguyễn văn nam', 'ai', 2023, 220000, 8),
(7, 'khoa học dữ liệu cơ bản', 'nguyễn văn nam', 'ai', 2023, 220000, null);

delete from books b
using books d
where b.id > d.id
  and b.title = d.title
  and b.author = d.author
  and b.publish_year = d.publish_year;

update books
set price = price * 1.10
where publish_year >= 2021 and price < 200000;

update books
set stock = 0
where stock is null;

select *
from books
where (category = 'cntt' or category = 'ai')
  and price between 100000 and 250000
order by price desc, title asc;

select *
from books
where title ilike '%học%';

select distinct category
from books
where publish_year > 2020;

select *
from books
order by price desc, title asc
limit 2 offset 1;
