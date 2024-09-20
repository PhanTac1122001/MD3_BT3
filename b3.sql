create database md3b3;
use md3b3;

create table vat_tu(
	maVT int auto_increment primary key,
    tenVT varchar(255) not null
);
create table phieu_nhap(
	soPn int auto_increment primary key,
    ngayNhap datetime
);
create table phieu_nhap_ct(
	soPn int,
    maVT int,
    donGiaNhap double,
    soLuongNhap int,
    primary key(soPn,maVT),
    foreign key (maVT) references vat_tu(maVT),
    foreign key (soPn) references phieu_nhap(soPn)
);
create table phieu_xuat(
	soPx int auto_increment primary key,
    ngayXuat datetime
);
create table phieu_xuat_ct(
	soPx int,
    maVT int,
    donGiaXuat double,
    soLuongXuat int,
    primary key(soPx,maVT),
    foreign key (maVT) references vat_tu(maVT),
    foreign key (soPx) references phieu_xuat(soPx)
);
create table nha_cung_cap(
	maNCC int auto_increment primary key,
    tenNCC varchar(255) not null,
    diaChi varchar(255),
    soDienThoai varchar(11)
   
);
create table don_dat_hang(
    soDH int primary key auto_increment,
    maNCC int ,
    ngayDH datetime,
    foreign key (maNCC) references nha_cung_cap(maNCC)
);
create table ct_don_dat_hang(
	maVT int,
    soDH int ,
    primary key(maVT,soDH),
     foreign key (soDH) references don_dat_hang(soDH),
    foreign key (maVT) references vat_tu(maVT)
);


insert into vat_tu(tenvt) values ('gạch'),
('xi măng'),
('cát'),
('đá'),
('thước');

insert into phieu_xuat (ngayxuat) values (current_date()),
(current_date()),
(current_date()),
(current_date()),
(current_date());

insert into phieu_xuat_ct values (1, 1, 200000, 2),
(2, 1, 1800000, 8),
(3, 3, 400000, 3),
(5, 2, 100000, 3),
(4, 5, 90000, 1);

insert into phieu_nhap (ngaynhap) values 
('2024-7-14'),
('2024-7-13'),
('2024-7-12'),
('2024-7-11'),
('2024-7-14');

insert into phieu_nhap_ct values (1, 1, 170000, 4),
(2, 1, 1750000, 10),
(3, 3, 360000, 8),
(5, 2, 80000, 3),
(4, 5, 70000, 1);

insert into nha_cung_cap(tenncc, diaChi, soDienThoai) values
('Trần Quốc Tuấn', 'Thái Bình', '0987654321'),
('Phan Đình Phùng', 'Hà Nội' , '0987654325'),
('Nguyễn Trãi', 'Hà Nội', '0961036277'),
('Đoàn Linh Tinh', 'Hà Nam', '0968071555'),
('Nguyễn Quốc Anh', 'Hải Phòng', '0968071533');

insert into don_dat_hang (mancc, ngaydh) values (5, current_date()),
(2, current_date()),
(3, current_date()),
(5, current_date()),
(4, current_date());

insert into ct_don_dat_hang  values (2, 3),
(2, 4),
(4, 5),
(3, 5),
(4, 3);

select * from vat_tu;
select * from phieu_xuat;
select * from phieu_xuat_ct;
select * from phieu_nhap;
select * from phieu_nhap_ct;
select * from nha_cung_cap;
select * from don_dat_hang;
select * from ct_don_dat_hang;

-- Tìm danh sách vật tư bán chạy nhất

select tenVT,sum(soluongxuat) as totalsold from vat_tu vt
Join phieu_xuat_ct pxct on vt.maVT=pxct.maVT
group by vt.tenVT
order by totalsold Desc;

-- Tìm danh sách vật tư có trong kho nhiều nhất

select tenVT,sum(soluongnhap) - sum(soluongxuat)  AS inventory from vat_tu vt
left join phieu_nhap_ct pnct on vt.maVT=pnct.maVT
left join phieu_xuat_ct pxct on vt.maVT=pxct.maVT
group by vt.tenVT
order by inventory desc;

-- Tìm ra danh sách nhà cung cấp có đơn hàng từ ngày 12/2/2024 đến 22/2/2024

select * from nha_cung_cap ncc inner join don_dat_hang ddh on ncc.mancc=ddh.mancc
where ddh.ngayDH between'2024-02-12' AND '2024-09-19';

-- Tìm ra danh sách vật tư đươc mua ở nhà cung cấp từ ngày 11/1/2024 đến 22/2/2024

select tenvt from vat_tu vt inner join phieu_nhap_ct pnct on vt.mavt = pnct.mavt
inner join phieu_nhap pn on pnct.sopn = pn.sopn
where pn.ngaynhap between  '2024-01-11' AND '2024-09-19';
