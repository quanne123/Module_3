create database bai_tap2;

use  bai_tap2;	

create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap varchar(45),
dia_chi varchar(45)
);
create table so_dien_thoai(
ma_so_dien_thoai int primary key,
so_dien_thoai varchar(45),
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat datetime
);
create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(45)
);

create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap datetime
);

create table don_dat_hang(
so_don_hang int primary key,
ngay_dat_hang datetime,
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
create table chi_tiet_phieu_xuat(
don_gia_xuat varchar(45),
so_luong_xuat varchar(45),
so_phieu_xuat int,
ma_vat_tu int,
primary key(so_phieu_xuat,ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_phieu_nhap(
don_gia_nhap varchar(45),
so_luong_nhap varchar(45),
ma_vat_tu int,
so_phieu_nhap int,
primary key(ma_vat_tu,so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);
create table chi_tiet_don_dat_hang(
ma_vat_tu int,
so_don_hang int,
primary key(ma_vat_tu,so_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang)
);


