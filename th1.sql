create database md3th1;
use md3th1;

create table class(
	clasId int auto_increment primary key,
    className varchar(255) not null,
    startDate date not null,
    status bit 
);

create table student(
	studentId int auto_increment primary key,
    studentName varchar(255) not null,
    address  varchar(255),
    phone varchar(255),
	status bit default 0,
   class_id int not null,
    foreign key (class_id) references class(clasId)
);
create table subjects(
	subId int auto_increment primary key,
    subName varchar(255) not null,
    credit int default 1 check (credit>=1),
    status bit default 1
);
create table mark(
	markId  int auto_increment primary key,
    subjectId  int not null,
    studentId  int not null,
	mark double default 0 check(mark between 0 and 100),
    examtime  int default 1,
    foreign key (subjectId) references subjects(subId),
    foreign key (studentId) references student(studentId)
);

-- Insert Class 

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

-- Insert Student 

INSERT INTO student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 1, 2);
INSERT INTO student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Lan', 'HCM', '0912345678', 0, 2);

-- Insert Subjet

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
-- Insert Mark 

INSERT INTO mark (SubjectId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 60, 1),
       (1, 2, 40, 2),
       (2, 1, 70, 1),
      (1, 3, 80, 1),
       (2, 3, 90, 1);
       
SELECT * FROM class;
SELECT * FROM student;
SELECT * FROM subjects;
SELECT * FROM mark;