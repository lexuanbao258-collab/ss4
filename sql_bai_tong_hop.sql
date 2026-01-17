create table customers(
	customer_id serial primary key,
	full_name varchar(50),
	email varchar(100) not null unique,
	phone varchar(15) not null unique,
	city varchar(100),
	join_date date
);

create table products(
	product_id serial primary key,
	product_name varchar(100),
	category varchar(30),
	price numeric(15,2) check(price>=0),
	stock_quantity int check(stock_quantity>=0)
);

create type status_type as enum('PENDING','DELIVERIED','SUCCESS','CONFIRMED');

create table orders(
	order_id serial primary key,
	customer_id serial references customers(customer_id),
	order_date date default current_date,
	total_amount numeric(15,2) check (total_amount>=0),
	status status_type default 'PENDING'
);

-- Thêm 10 khách hàng với đầy đủ thông tin
insert into customers(full_name,email,phone,city,join_date) values
('Nguyễn Văn Bình','binh@gmail.com','092335351','Hà Nội','2026-01-05'),
('Lê Văn Cương','cuong@gmail.com','092335352','Huế','2026-02-11'),
('Trần Mạnh Đức','duc@gmail.com','092335353','Hải Phòng','2026-04-20'),
('Nguyễn Hữu Doanh','doanh@gmail.com','092335354','Hà Nội','2026-03-27'),
('Nguyễn Hồng Quân','quan@gmail.com','092335355','Hà Nội','2026-09-18'),
('Trần Tiến Mạnh','manh@gmail.com','092335356','Hà Nội','2026-10-10'),
('Nguyễn Thị Hồng','hong@gmail.com','092335357','Hà Nội','2026-12-11'),
('Nguyễn Thị Hiền','hien@gmail.com','092335358','Hà Nội','2026-04-22'),
('Nguyễn Thị Tú','tu@gmail.com','092335359','Hà Nội','2026-02-21'),
('Nguyễn Văn Tiến','tien@gmail.com','092335312','Hà Nội','2026-02-15');

select * from customers;

-- insert products
-- Thêm 15 sản phẩm thuộc ít nhất 3 danh mục khác nhau
insert into products(product_name,category,price,stock_quantity) values
('Máy tính dell core i7','Điện tử',18000000,10),
('Máy tính dell core i5','Điện tử',15000000,12),
('Máy tính dell core i3','Điện tử',12000000,11),
('Điện thoại iphone 12','Điện tử',10000000,05),
('Điện thoại iphone 11','Điện tử',8000000,6),
('Điện thoại iphone 10','Điện tử',7000000,7),
('Máy tính dell core i7','Điện tử',18000000,20),
('Sách toán','Sách tham khảo',300000,28),
('Sách lý','Sách tham khảo',200000,20),
('Sách hoá','Sách tham khảo',250000,30),
('Áo sơ mi nam','Thời trang',550000,15),
('Áo vest nam','Thời trang',1200000,27),
('Áo khoác','Thời trang',700000,50),
('Giày nam công sở','Thời trang',400000,30),
('Giày adidas','Thời trang',500000,25);

select * from products;

-- Thêm 8 đơn hàng với các trạng thái khác nhau
insert into orders(customer_id,status) values
(6,'PENDING'),
(6,'DELIVERIED'),
(6,'SUCCESS'),
(6,'PENDING'),
(8,'PENDING'),
(8,'SUCCESS'),
(3,'SUCCESS'),
(3,'SUCCESS'),
(3,'SUCCESS'),
(4,'DELIVERIED'),
(4,'DELIVERIED'),
(4,'DELIVERIED'),
(5,'SUCCESS');

-- Tạo thêm bảng order_detail
create table order_detail(
	order_id serial not null references orders(order_id),	
	product_id serial not null references products(product_id),
	quantity int check (quantity>0),
	price numeric(15,2) check(price>=0),
	primary key(order_id,product_id)
)

-- Thêm dữ liệu vào bảng order_detail
select * from orders;
select * from products;

insert into order_detail(order_id,product_id,quantity,price) values
(14,1,10,17000000),
(14,3,5,8000000),
(14,14,2,400000),
(14,6,10,17000000),
(15,1,2,18000000),
(15,2,3,15000000),
(16,9,10,180000),
(16,10,10,220000),
(17,11,3,500000),
(17,15,3,480000),
(18,5,2,7000000),
(19,3,2,11000000),
(19,13,2,650000),
(20,1,10,17000000),
(21,1,10,17000000),
(22,1,10,17000000),
(23,1,10,17000000);

-- UPDATE dữ liệu
-- Cập nhật giá sản phẩm thuộc category 'Sách tham khảo' tăng 10%
update products set price = price*1.1 where category='Sách tham khảo';

select * from products where category='Sách tham khảo';

-- Cập nhật số điện thoại cho khách hàng có email cụ thể
select * from customers order by customer_id asc;
update customers set phone = '032122344', email = 'binhreal@gmail.com' where customer_id=3;

-- Cập nhật trạng thái đơn hàng từ 'PENDING' sang 'CONFIRMED'
update orders set status = 'CONFIRMED' where status='PENDING';

select * from orders;

-- Xóa các sản phẩm có số lượng tồn kho = 0
delete from products where stock_quantity = 0;

-- Xóa khách hàng không có đơn hàng nào
delete from customers where customer_id not in (select distinct customer_id from orders);

-- Tìm khách hàng theo tên (sử dụng ILIKE)
select * from customers where full_name ilike 'Nguyễn%';

-- Lọc sản phẩm theo khoảng giá (sử dụng BETWEEN)
select * from products where price between 10000000 and 15000000;

-- Tìm khách hàng chưa có số điện thoại (IS NULL)
select * from customers where phone is null;

-- Top 5 sản phẩm có giá cao nhất (ORDER BY + LIMIT)
select * from products order by price desc limit 5 offset 0;

-- Phân trang danh sách đơn hàng (LIMIT + OFFSET)  -- Trang 2
select * from orders limit 4 offset 4;

-- Đếm số khách hàng theo thành phố (DISTINCT + COUNT): Tên thành phố, số khách hàng
select * from customers;

select city, count(customer_id) as "Số khách hàng"
from customers group by city;



