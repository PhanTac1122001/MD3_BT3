create database md3bt4ss3;
use md3bt4ss3;

create table classes(
	classid int auto_increment primary key,
    classname varchar(255) unique not null,
    startdate date not null,
    status bit(1) default 1
);
insert into classes(classname,startdate, status) values('HN-JV231103', str_to_date('03/11/2023' , '%d/%m/%Y'),1),
('HN-JV231229',  str_to_date('29/12/2023' , '%d/%m/%Y'), 1),
('HN-JV230615',  str_to_date('15/06/2023' , '%d/%m/%Y'), 1);

create table student(
	studentid int auto_increment primary key,
    studentname varchar(100) unique not null,
    address varchar(255) not null,
    phone varchar(11) not null,
    status bit ,
    classid int not null,
    foreign key (classid) references classes(classid)
);
insert into student(studentname, address, phone, status, classid) values ('Hồ Gia Hùng', 'Hà Nội', '0987654321', 1, 1), 
('Phan Văn Giang', 'Đã Nẵng', '0967811255', 1, 1),
('Hoàng Minh Hiếu', 'Nghệ An', '0964425633', 1, 2),
('Nguyễn Vịnh', 'Hà nội', '0975123552', 1, 3),
('Nam Cao', 'Hà Tĩnh', '0919191919', 1, 1),
('Nguyễn Du', 'Nghệ An', '0353535353', 1, 3),
('Dương Mỹ Duyên', 'Hà Nội' ,'0385546611', 1, 2);
create table subjects(
	subid int auto_increment primary key,
    subname varchar(255) unique not null,
    credit int default 1 check (credit >= 1),
    status bit(1) default 1
);
insert into subjects (subname, credit, status) values('Toán', 3, 1),
('Văn', 3, 1),
('Anh', 2, 1);
create table mark(
	markid int auto_increment primary key,
    subjectid int not null,
    studentid int not null,
    mark double default 0 check(mark between 0 and 100),
    examtime int default 1,
    foreign key (subjectid) references subjects (subid),
    foreign key (studentid) references student (studentid)
);
insert into mark (subjectid, studentid, mark, examtime) values (1, 1, 7, str_to_date('12/05/2024' , '%d/%m/%Y')),
(1, 1, 7, str_to_date('15/03/2024' , '%d/%m/%Y')),
(2, 2, 8, str_to_date('15/05/2024' , '%d/%m/%Y')),
(2, 3, 9, str_to_date('08/03/2024' , '%d/%m/%Y')),
(3, 3, 10, str_to_date('11/02/2024' , '%d/%m/%Y'));

-- Hiển thị tất cả lớp học được sắp xếp theo tên giảm dần
select * from classes order by classname  desc;

-- Hiển thị tất cả học sinh có address ở “Hà Nội”

select * from student where address = 'Hà Nội';

-- Hiển thị tất cả học sinh thuộc lớp HN-JV231103
select studentname from classes c inner join student s on s.classid = c.classid where c.classname = 'HN-JV231103';

-- Hiển thị tát cả các môn học có credit trên 2
select * from subjects where credit > 2;

-- Hiển thị tất cả học sinh có phone bắt đầu bằng số 09
select * from student where phone like '09%';