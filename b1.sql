create database md3b1;
use md3b1;

create table product(
	id int auto_increment primary key,
    name varchar(100) not null,
    created date

);

create table color(
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit
);
create table size(
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit
);
create table product_detail(
	id  int auto_increment primary key,
    product_id  int not null,
    color_id  int not null,
    size_id  int not null,
	price double,
    stock  int ,
    status bit,
    foreign key (product_id) references product(id),
    foreign key (size_id) references size(id),
    foreign key (color_id) references color(id)
);

insert into color (name, status) values 
('red',1),
('blue',1),
('green',1);

insert into size (name, status) values 
('X',1),
('M',1),
('L',1),
('XL',1),
('XXL',1);

insert into product (name, created) values 
('Quần dài','1990-5-12'),
('Áo dài','2005-10-5'),
('Mũ phớt','1995-7-7');

insert into product_detail (product_id, color_id,size_id,price,stock,status) values 
(1,1,1,1200,5,1),
(2,1,1,1500,2,1),
(1,2,3,500,3,1),
(1,2,3,1600,3,0),
(3,1,4,1200,5,1),
(3,3,5,1200,6,1),
(2,3,5,2000,10,0);

-- Hiển thị thông tin sản phẩm chi tiết
select * from product_detail where price>1200;

-- Hiển thị tất cả thông tin các màu
select * from color;

-- Hiển thị tất cả thông tin các size
select * from size;

-- Hiển thị tất cả sản phẩm chi tiết của sản phẩm có mã là 1
select * from product_detail where id=1;