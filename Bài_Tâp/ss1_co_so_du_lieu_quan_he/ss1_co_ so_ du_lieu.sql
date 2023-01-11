create database c1022g1_module_3;
use c1022g1_module_3;
create table student(
`id` int not null,
`name` varchar(45) null,
`age` int null,
`country` varchar(45) null,
primary key (`id`));

-- đưa dữ liệu ra xem 
insert into student(id,`name`,age,country) values (1,"Trần Văn Anh Quân",22,"Đà Nẵng");
-- lấy dữ liệu ra xem 
select * from student;
-- as thì có cũng được mà không được
select `name` as "Tên", age "Tuổi" from student;
-- sửa tuổi Hoàng aka báo già thành 27
-- cập nhật cờ an toàn = 0 mới có thể update hoặc xóa được 
set check_id = 0;
update student
set age = 27
where id = 1;
set check_id = 1;

-- xóa student có id  = 1
delete from student where id = 1;




