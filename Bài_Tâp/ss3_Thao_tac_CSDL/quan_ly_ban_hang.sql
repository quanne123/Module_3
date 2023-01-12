create database bai_tap3;
use bai_tap3;
create table khach_hang(
ma_khach int primary key,
ten_khach varchar(45),
tuoi int
);
create table hoa_don(
so_hoa_don int primary key,
ngay_mua datetime,
tong_gia double,
ma_khach int,
foreign key(ma_khach) references khach_hang(ma_khach)
);
create table san_pham(
ma_san_pham int primary key,
ten_san_pham varchar(45),
gia double
);
create table chi_tiet_dat_hang(
so_luong_dat_hang int,
so_hoa_don int,
ma_san_pham int,
unique key(so_hoa_don,ma_san_pham),
foreign key(so_hoa_don) references hoa_don(so_hoa_don),
foreign key(ma_san_pham) references san_pham(ma_san_pham)
);
insert into khach_hang values (1,'Minh Quan',10),(2,'Ngoc Oanh',20),(3,'Hong Ha',50);
insert into hoa_don(so_hoa_don,ngay_mua,tong_gia,ma_khach) values (1,'2006/3/21',null,1),(2,'2006/3/23',null,2),(3,'2006/3/16',null,3);
insert into san_pham values (1,'May Giat',3),(2,'tu lanh',5),(3,'Dieu hoa',7),(4,'Quat',1),(5,'Bep dien',2);
insert into chi_tiet_dat_hang values (3,1,1),(7,1,3),(2,1,4),(1,2,1),(8,3,1),(4,2,5),(3,2,3);
select *
from hoa_don;

select ten_khach,ten_san_pham,ngay_mua
from chi_tiet_dat_hang
 join san_pham on chi_tiet_dat_hang.ma_san_pham= san_pham.ma_san_pham
 join hoa_don on chi_tiet_dat_hang.so_hoa_don = hoa_don.so_hoa_don
 join khach_hang on khach_hang.ma_khach = khach_hang.ma_khach;

select khach_hang.ten_khach
from khach_hang
left join hoa_don on khach_hang.ma_khach = hoa_don.ma_khach
where hoa_don.ma_khach is null;

select hoa_don.so_hoa_don,hoa_don.ngay_mua,chi_tiet_dat_hang.so_luong_dat_hang*san_pham.gia as tong_gia
from chi_tiet_dat_hang 
inner join hoa_don on chi_tiet_dat_hang.so_hoa_don = hoa_don.so_hoa_don
inner join san_pham on chi_tiet_dat_hang.ma_san_pham = san_pham.ma_san_pham;


