create database md3b2;
use md3b2;

create table products(
	pId int auto_increment primary key,
    pName varchar(255) not null,
    pPrice double

);
create table customers(
	cId int auto_increment primary key,
    cName varchar(255) not null,
    cAge int
);
create table orders(
	oId int auto_increment primary key,
    cId int not null,
    oDate datetime,
    oTotalPrice double,
   foreign key (cId) references customers(cId)
);

create table order_detail(

    oId  int not null,
    pId  int not null,
    odQuantity  int ,
    primary key(oId,pId),
    foreign key (oId) references orders(oId),
    foreign key (pId) references products(pId)
);

    insert into customers values(1,'Minh Quan', 10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha', 50);

insert into orders values(1,1, '2006-3-21', 150000),
(2,2, '2006-3-23', 200000),
(3,1, '2006-3-16', 170000);

insert into products values(1,'May giat', 300),
(2,'Tu lanh', 500),
(3,'Dieu hoa', 700),
(4,'Quat', 100),
(5,'Bep dien', 200),
(6,'May hut mui', 500);

insert into order_detail values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oId,oDate,oTotalPrice from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách hàng đó.
select cName,pName,odQuantity from customers c 
inner join orders o on c.cid=o.cid 
inner join order_detail od on o.oid=od.oid
inner join products p on od.pid=p.pid order by c.cName,p.pName;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cName from customers c left join orders o on c.cid=o.cid where o.oid is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại 
-- mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY * pPrice)
select o.oid,odate,oTotalPrice from orders o inner join order_detail od on o.oid=od.oid
inner join products p on od.pid=p.pid;
