create database quan_ly_sinh_vien;
use  quan_ly_sinh_vien;
create table lop_hoc(
ma_lop_hoc int not null auto_increment primary key,
ten_lop_hoc varchar(60) not null,
thoi_gian_bat_dau datetime not null,
chu_thich bit
);
create table sinh_vien(
ma_sinh_vien int not null auto_increment primary key,
ten_sinh_vien varchar (30) not null,
dia_chi varchar(50),
so_dien_thoai varchar(20),
chu_thich bit,
ma_lop_hoc int not null,
foreign key(ma_lop_hoc) references lop_hoc(ma_lop_hoc)
);

create table mon_hoc(
ma_mon_hoc int not null auto_increment primary key,
ten_mon_hoc varchar(30) not null,
tin_dung tinyint not null default 1 check (tin_dung >=1),
status bit default 1
);
create table diem(
ma_diem int not null primary key auto_increment,
gio_kiem_tra tinyint default 1,
diem_thi float default 0 check ( diem_thi between 0 and 100),
ma_mon_hoc int not null,
ma_sinh_vien int not null,
unique key(ma_mon_hoc,ma_sinh_vien),
foreign key(ma_sinh_vien) references sinh_vien(ma_sinh_vien),
foreign key(ma_mon_hoc) references mon_hoc(ma_mon_hoc)
);
drop table diem;

insert into lop_hoc values (1, 'A1', '2008-12-20', 1),(2, 'A2', '2008-12-22', 1),(3, 'B3', current_date, 0);
insert into sinh_vien(ma_sinh_vien,ten_sinh_vien,dia_chi,so_dien_thoai,chu_thich,ma_lop_hoc) values(1,'Hung','Ha Noi','0905123456',1,1),(2,'Hoa','Hai Phong','0906456789',1,1),(3,'Manh','HCM','0123123123',0,2);
insert into mon_hoc values (1, 'CF', 5, 1),(2, 'C', 6, 1),(3, 'HDJ', 5, 1), (4, 'RDBMS', 10, 1);
insert into diem (ma_mon_hoc,ma_sinh_vien,diem_thi,gio_kiem_tra) values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
select *
from sinh_vien
where  ten_sinh_vien like 'h%';

select *
from lop_hoc
where Month(thoi_gian_bat_dau) = 12;

select * 
from mon_hoc
where tin_dung >= 3 and tin_dung <= 5;

set sql_safe_updates = 0;
update sinh_vien
set ma_lop_hoc =2
where ma_sinh_vien = 1;
set sql_safe_updates = 1; 

select ten_sinh_vien,ten_mon_hoc,diem_thi

from diem
join sinh_vien on diem.ma_sinh_vien = sinh_vien.ma_sinh_vien
join mon_hoc on diem.ma_mon_hoc = mon_hoc.ma_mon_hoc
order by
diem_thi desc, ten_sinh_vien






