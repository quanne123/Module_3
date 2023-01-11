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
primary key(so_hoa_don,ma_san_pham),
foreign key(so_hoa_don) references hoa_don(so_hoa_don),
foreign key(ma_san_pham) references san_pham(ma_san_pham)
);