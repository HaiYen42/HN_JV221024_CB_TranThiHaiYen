use quanlydiemthi;
-- Bài 1: Tạo CSDL
create table student(
studentId varchar(4) primary key,
studentName varchar(100) not null,
birthday datetime not null,
gender bit(1) not null,
address text not null,
phoneNumber varchar(45)
);
create table subject(
subjectId varchar(4) primary key,
subjectName varchar(45) not null,
priority int(11) not null
);
create table mark(
subjectId varchar(4) not null,
studentId varchar(4) not null,
point int(11) not null,
foreign key(subjectId) references subject(subjectId),
foreign key(studentId) references student(studentId)
);
ALTER TABLE MARK MODIFY POINT FLOAT;
-- Bài 2: Bài 2: Thêm , sửa , xoá dữ liệu
-- 2.1 Bài 2 Thêm dữ liệu vào các bảng 
insert into student(studentId, studentName,birthday, gender,address,phoneNumber)
values("S001", "Nguyen The Anh","1999-01-11",1, "Ha Noi", "984678082"),
		("S002", "Dang Bao Tram", "1998-12-22",0, "Lao Cai", "904982654"),
        ("S003", "Tran Ha Phuong", "2000-05-05",0, "Nghe AN", "947645363"),
        ("S004", "Do Tien Manh", "1999-03-26", 1, "Ha Noi", "983665353"),
        ("S005", "PHam Duy NHat", "1998-10-4", 1, "Tuyen Quang", "987242678"),
		("S006", "Mai Van Thai", "2002-06-22", 1, "Nam Dinh", "982654268"),
        ("S007", "Giang Gia Han", "1996-11-10", 0, "Phu THo", "982364753"),
        ("S008", "Nguyen Ngoc Bao My", "1999-01-22", 0, "Ha Nam", "927867453"),
        ("S009", "Nguyen Tien Bao", "1998-8-7", 1, "Tuyen QUang", "989274673"),
        ("S010", "Nguyen Thieu Quang", "2000-9-18", 1, "Ha Noi", "984378291");
        select * from student;
        select * from subject;
        select * from mark;
insert into subject(subjectId, subjectName, priority)
values("MH01", "Toan",2),
		("MH02", "Vat ly", 2),
        ("MH03", "Hoa hoc", 1),
        ("MH04", "Ngu Van", 1),
        ("MH05", "Tieng Anh", 2);
insert into mark(subjectId, studentId, point)
values("MH01", "S001", 8.5),
		("MH02", "S001", 7),
        ("MH03", "S001", 9),
        ("MH04","S001", 9 ),
        ("MH05", "S001", 5),
        ("MH01", "S002", 9),
		("MH02", "S002", 8),
        ("MH03", "S002", 6.5),
        ("MH04","S002", 8 ),
        ("MH05", "S002", 6),
        ("MH01", "S003", 7.5),
		("MH02", "S003", 6.5),
        ("MH03", "S003", 8),
        ("MH04","S003", 7 ),
        ("MH05", "S003", 7),
        ("MH01", "S004", 6),
		("MH02", "S004", 7),
        ("MH03", "S004", 5),
        ("MH04","S004", 6.5),
        ("MH05", "S004", 8),
         ("MH01", "S005", 5.5),
		("MH02", "S005", 8),
        ("MH03", "S005", 7.5),
        ("MH04","S005", 8.5),
        ("MH05", "S005", 9),
         ("MH01", "S006", 8),
		("MH02", "S006", 10),
        ("MH03", "S006", 9),
        ("MH04","S006", 7.5),
        ("MH05", "S006", 6.5),
         ("MH01", "S007", 9.5),
		("MH02", "S007", 9),
        ("MH03", "S007", 6),
        ("MH04","S007", 9),
        ("MH05", "S007", 4),
         ("MH01", "S008", 10),
		("MH02", "S008", 8.5),
        ("MH03", "S008", 8.5),
        ("MH04","S008", 6),
        ("MH05", "S008", 9.5),
         ("MH01", "S009", 7.5),
		("MH02", "S009", 7),
        ("MH03", "S009", 9),
        ("MH04","S009", 5),
        ("MH05", "S009", 10),
         ("MH01", "S010", 6.5),
		("MH02", "S010", 8),
        ("MH03", "S010", 5.5),
        ("MH04","S010", 4),
        ("MH05", "S010", 7);
-- 2.2 Cập nhật dữ liệu 
-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”
update student 
set studentName= "Do Duc Manh"
where studentId = "S004";
-- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
update subject 
set subjectName = "Ngoai Ngu", priority = 1
where subjectId = "MH05";
-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).
update mark
set point = 8.5
where studentId= "S009" and subjectId = "MH01";
update mark
set point = 7
where studentId= "S009" and subjectId = "MH02";
update mark
set point = 5.5
where studentId= "S009" and subjectId = "MH03";
update mark
set point = 6
where studentId= "S009" and subjectId = "MH04";
update mark
set point = 9
where studentId= "S009" and subjectId = "MH05";
-- 2.3 Xoá dữ liệu
-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT
delete from mark 
where studentId = "S010";
delete from student 
where studentId = "S010";
-- Bài 3: Truy vấn dữ liệu 
-- 3.1 Lấy ra tất cả thông tin của sinh viên trong bảng Student
select * from student;
-- 3.2 Hiển thị tên và mã môn học của những môn có hệ số bằng 1
select subjectId, subjectName from subject
where priority =1;
-- 3.3 Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
select studentId, studentName, (year(now())- year(birthday)) as "Age",  if(gender=0, "Nu", "Nam") as "Sex ", address
from student;
-- 3.4 Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần. [4 điểm]
     select student.studentName, subject.subjectName, mark.point 
     from mark
     join student on student.studentId = mark.studentId
     join subject on subject.subjectId = mark.subjectId
     where subjectName = "Toan"
     order by mark.point desc;
-- 3.5 Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
select count(*) as "Số lượng",  if(gender=0, "Nu", "Nam") as "Sex "
from student 
group by gender;
-- 3.6 Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) ,
-- bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. 
select student.studentId, student.studentName,  sum(mark.point) as "Total point ", avg(mark.point )as "Avg mark"
from student
join mark on mark.studentId= student.studentId
group by student.studentId;
-- Bài 4:Tạo View, Index, Procedure 
-- 4. 1  Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán . 
create view  STUDENT_VIEW as 
select studentId, studentName, gender, address
from student;
select * from STUDENT_VIEW ;
-- 4.2 Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh, điểm trung bình các môn học .
create view AVERAGE_MARK_VIEW as 
select student.studentId, student.studentName, avg(mark.point) as "AVG Point"
from student
join mark on student.studentId= mark.studentId
group by student.studentId;
select * from AVERAGE_MARK_VIEW;
-- 4.3 Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
CREATE INDEX index_student 
ON STUDENT (phoneNumber);