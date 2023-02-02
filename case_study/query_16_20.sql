use furama_database;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

select nv.ma_nhan_vien,nv.ho_ten 
from nhan_vien nv 
left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien 
where nv.ma_nhan_vien not in (select ma_nhan_vien from hop_dong group by hd.ma_nhan_vien);
-- thực hiện lệnh xóa những nhân viên chưa có hợp đồng 
set sql_safe_updates = 0;
delete from nhan_vien nv 
where nv.ma_nhan_vien not in (select ma_nhan_vien from hop_dong hd group by hd.ma_nhan_vien);
set sql_safe_updates = 1;
select * from nhan_vien;
  
-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
create view w_khach_hang as 
select 
 kh.ma_khach_hang,
kh.ho_ten,
lk.ten_loai_khach,
dv.ten_dich_vu,
hd.ma_hop_dong,
hd.ngay_lam_hop_dong,
hd.ngay_ket_thuc,
ifnull(dv.chi_phi_thue + sum(hdct.so_luong * dvdk.gia),
		dv.chi_phi_thue) as tong_tien 
        from khach_hang kh 
        left join 
        loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
        left join 
        hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
        left join 
        dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
        left join
        hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        left join 
        dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
        group by kh.ma_khach_hang , hd.ma_hop_dong
        order by kh.ma_khach_hang asc;
        -- sử dụng view để lấy điều kiện 
        select ma_khach_hang from w_khach_hang 
        where tong_tien > 1000000 and ten_loai_khach regexp "Platinum";
        -- update 
        update khach_hang 
        set ma_loai_khach =1
        where ma_khach_hang 
        in (select ma_khach_hang from khach_hang where tong_tien >1000000 and ten_loai_khach regexp 'Platinum');
        -- xem lại thay đổi trong danh sách  
        select * from khach_hang;
        drop view w_khach_hang;
        
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- lấy điều kiện
select hd.ma_khach_hang
from khach_hang kh 
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang 
where year(ngay_lam_hop_dong) <2021 ;
-- xóa 
delete from khach_hang 
where ma_khach_hang in (
select * from (select hd.ma_khach_hang from khach_hang kh 
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang 
where year(ngay_lam_hop_dong) < 2021) abc 
);
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
-- tạo view
create view w_dich_vu_di_kem as
select 
    d.ma_dich_vu_di_kem,
    d.ten_dich_vu_di_kem,
    sum(so_luong) as so_luong_dv_di_kem
from dich_vu_di_kem d 
join hop_dong_chi_tiet h on h.ma_dich_vu_di_kem = d.ma_dich_vu_di_kem
group by h.ma_dich_vu_di_kem
having sum(so_luong) = (select max(so_luong) from hop_dong_chi_tiet);
-- sử dụng view lấy điều kiện
select ma_dich_vu_di_kem from w_dich_vu_di_kem;
-- update giá
set sql_safe_updates = 0;
update dich_vu_di_kem 
set gia = gia * 2
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from w_dich_vu_di_kem); 
-- hiển thị sau update
select * from dich_vu_di_kem;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from nhan_vien
union all
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from khach_hang;

        
        
	
        
        
        