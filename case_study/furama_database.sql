create database furama_database;
use furama_database;

create table vi_tri(
  ma_vi_tri int primary key auto_increment, 
  ten_vi_tri varchar(45)
);

create table trinh_do(
  ma_trinh_do int primary key auto_increment, 
  ten_trinh_do varchar(45)
);

create table bo_phan(
  ma_bo_phan int primary key auto_increment, 
  ten_bo_phan varchar(45)
);

create table nhan_vien(
  ma_nhan_vien int primary key auto_increment, 
  ho_ten varchar(45) not null, 
  ngay_sinh date not null, 
  so_cmnd varchar(45) not null, 
  luong double not null, 
  so_dien_thoai varchar(45) not null, 
  email varchar(45), 
  dia_chi varchar(45), 
  ma_vi_tri int not null, 
  foreign key(ma_vi_tri) references vi_tri(ma_vi_tri), 
  ma_trinh_do int not null, 
  foreign key(ma_trinh_do) references trinh_do(ma_trinh_do) on delete cascade, 
  ma_bo_phan int not null, 
  foreign key(ma_bo_phan) references bo_phan(ma_bo_phan) on delete cascade
);

create table loai_khach(
  ma_loai_khach int primary key auto_increment, 
  ten_loai_khach varchar(45)
);

create table khach_hang(
  ma_khach_hang int primary key auto_increment, 
  ho_ten varchar(45) not null, 
  ngay_sinh date not null, 
  gioi_tinh bit(1) not null, 
  so_cmnd varchar(45) not null, 
  so_dien_thoai varchar(45) not null, 
  email varchar(45), 
  dia_chi varchar(45),
  ma_loai_khach int not null, 
  foreign key(ma_loai_khach) references loai_khach(ma_loai_khach) on delete cascade
);

create table loai_dich_vu(
  ma_loai_dich_vu int primary key auto_increment, 
  ten_loai_dich_vu varchar(45)
);

create table kieu_thue(
  ma_kieu_thue int primary key auto_increment, 
  ten_kieu_thue varchar(45)
);

create table dich_vu(
  ma_dich_vu int primary key auto_increment, 
  ten_dich_vu varchar(45) not null, 
  dien_tich int, 
  chi_phi_thue double not null, 
  so_nguoi_toi_da int, 
  tieu_chuan_phong varchar(45), 
  mo_ta_tien_nghi_khac varchar(45), 
  dien_tich_ho_boi double, 
  so_tang int, 
  dich_vu_mien_phi_di_kem text,
  ma_kieu_thue int not null, 
  foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue) on delete cascade, 
  ma_loai_dich_vu int not null, 
  foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu) on delete cascade
);

create table hop_dong(
  ma_hop_dong int primary key auto_increment, 
  ngay_lam_hop_dong datetime not null, 
  ngay_ket_thuc datetime not null, 
  ngay_dat_coc double not null, 
  ma_nhan_vien int not null, 
  foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien) on delete cascade, 
  ma_khach_hang int not null, 
  foreign key(ma_khach_hang) references khach_hang(ma_khach_hang) on delete cascade, 
  ma_dich_vu int not null, 
  foreign key(ma_dich_vu) references dich_vu(ma_dich_vu) on delete cascade
);

create table dich_vu_di_kem(
  ma_dich_vu_di_kem int primary key auto_increment, 
  ten_dich_vu_di_kem varchar(45) not null, 
  gia double not null, 
  don_vi varchar(10) not null, 
  trang_thai varchar(45)
);

create table hop_dong_chi_tiet(
  ma_hop_dong_chi_tiet int primary key auto_increment,
  so_luong int not null,
  ma_hop_dong int not null, 
  foreign key(ma_hop_dong) references hop_dong(ma_hop_dong) on delete cascade, 
  ma_dich_vu_di_kem int not null, 
  foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem) on delete cascade
);