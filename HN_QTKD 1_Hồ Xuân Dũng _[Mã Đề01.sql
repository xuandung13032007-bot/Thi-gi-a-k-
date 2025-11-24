create database StudentScoreManagement;
use StudentScoreManagement;
create table Student(
StudentId varchar(10) primary key,
FullName varchar(100) not null,
DateOfBirth Date,
Gender enum('Nam','Nu') default('Nam'),
Email varchar(100) unique
);

create table Subjects(
SubjectId varchar(10) primary key,
SubjectName varchar(100) not null,
Credit int not null
);
create table Result(
StudentId varchar(10),
foreign key (StudentId) references Student(StudentId),
SubjectId varchar(10),
foreign key (SubjectId) references SubJects(SubjectId),
Score decimal(4,2),
primary key (StudentId,SubjectId)

);
-- thêm dữ liệu mẫu vào 3 bảng như sau:

insert into Student(StudentId ,Fullname,DateOfBirth,Gender,Email)
values ('SV001','Nguyen Van A','2000-01-15','Nam','a.nguyen@email.com'),
('SV002','Tran Thi B ','2001-05-20','Nu','b.tran@email.com'),
('SV003','Le Van C','1999-11-02','Nam','c.le@email.com'),
('SV004','Pham Thi D','2002-03-10','Nu','d.pham@email.com'),
('SV005','Hoang Van E','2000-08-25','Nam','e.hoang@email.com');

insert into Subjects(SubjectId ,SubjectName,Credit)
values ('MH01','Co So Du Lieu',3),
('MH02','Lap Trinh java',4),
('MH03','Lap Trinh Web',3);
insert into Result(StudentId,SubjectId,Score)
values('SV001','MH01',8.5),
('SV001','MH02',7.0),
('SV002','MH01',9.0),
('SV002','MH02',6.5),
('SV003','MH01',5.5),
('SV003','MH03',8.0),
('SV004','MH02',4.0);
-- Sửa tên môn học có mã 'MH01' thành 'Co So Du Lieu Nang Cao'.

update Subjects 
set SubjectName ='Co So Du Lieu Nang Cao'
where SubjectId ='MH001';
-- Cập nhật điểm thi của sinh viên có mã 'SV004' trong môn 'MH02' thành 5.5.

update Result 
set Score=5.5
where StudentId ='SV004' and SubjectId='MH02';
-- Xóa kết quả thi của sinh viên có mã 'SV001' và mã môn 'MH02' khỏi bảng Result.
delete 
from Result
where StudentId= 'SV001' and  SubjectId= 'MH02';

-- Lấy ra toàn bộ thông tin (StudentId, FullName, DateOfBirth, Gender, Email) của các sinh viên có giới tính là 'Nu'.
select StudentId, FullName, DateOfBirth, Gender, Email
from Student
where  Gender like 'Nu';
-- Lấy ra danh sách các môn học có số tín chỉ lớn hơn hoặc bằng 4, hiển thị các cột SubjectId, SubjectName, Credit.
select SubjectId, SubjectName, Credit
from Subjects
where Credit>=4;
-- Lấy ra danh sách kết quả thi (StudentId, SubjectId, Score) của môn học có mã là 'MH01', sắp xếp theo điểm thi giảm dần.
select StudentId, SubjectId, Score
from Result
where SubjectId like'MH01'
order by Score desc;

-- Lấy ra tất cả thông tin của các sinh viên có họ là "Nguyen".
Select *
from Student
where Fullname like'%Nguyen%';
-- Lấy ra danh sách kết quả thi gồm (StudentId, SubjectId, Score) của các sinh viên có điểm thi nằm trong khoảng từ 8.0 đến 10.0.
select StudentId, SubjectId, Score
from Result 
where Score between 8.0 and 10.10;
-- Lấy ra 3 sinh viên đầu tiên trong danh sách sinh viên, sắp xếp theo ngày sinh tăng dần.
select *
from Student 
order by date(DateOfBirth) asc
limit 3 ;
-- Thống kê số lượng sinh viên theo từng giới tính (Hiển thị: Gender, Amount).
select Gender , count(*) as Amount
from Student
group by Gender;
-- Tính điểm trung bình của từng sinh viên. Hiển thị: StudentId, FullName và AverageResult.
select StudentId, FullName , avg(Score) as AverageResult
from Student
join Result s on s.studentId = r.studentId
group by avg(Score);
-- Lấy ra danh sách các môn học gồm (SubjectId, SubjectName) có ít nhất 2 sinh viên dự thi.
select SubjectId, SubjectName
from Subjects
order by SubjectId desc
having  SubjectId>=2;







