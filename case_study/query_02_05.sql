use furama_database; 
 -- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống
--     có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

 select ho_ten from nhan_vien
    where (substring_index(nhan_vien.ho_ten," ",-1) like "h%" 
    or (substring_index(nhan_vien.ho_ten," ",-1)) like "k%" 
    or (substring_index(nhan_vien.ho_ten," ",-1)) like "t%") and character_length(ho_ten) <= 15; 
    
     -- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
     
     select * from khach_hang
     where dia_chi like "%Quảng Trị%" or "%Đà Nẵng%" and (year(ngay_sinh) between 18 and 50);
     
       -- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--     Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
    
    select khach_hang.ma_khach_hang,khach_hang.ho_ten,
    count(hop_dong.ma_khach_hang) as số_lần_đặt_phòng 
    from khach_hang join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
    join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
    where loai_khach.ten_loai_khach regexp'Diamond'
    group by hop_dong.ma_khach_hang 
    order by số_lần_đặt_Phòng ;
    
    --     task 5
-- 5.hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (với tổng tiền được tính theo công thức như sau: chi phí thuê + số lượng * giá, với số lượng và giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
   -- 5.hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (với tổng tiền được tính theo công thức như sau: chi phí thuê + số lượng * giá, với số lượng và giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    ifnull(dv.chi_phi_thue + sum(hdct.so_luong * dvdk.gia),
            dv.chi_phi_thue) as tong_tien
from
    khach_hang kh
        left join
    loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
        left join
    hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
        left join
    hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        left join
    dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        left join
    dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
group by kh.ma_khach_hang , hd.ma_hop_dong
order by kh.ma_khach_hang asc;
    