use furama_database;

-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ  
--  chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dv.ma_dich_vu,
dv.ten_dich_vu,
dv.dien_tich,
dv.chi_phi_thue,
ldv.ten_loai_dich_vu
 from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
 where hd.ma_dich_vu not in (select ma_dich_vu from hop_dong 
		where (quarter(ngay_lam_hop_dong) = 1) and (year(ngay_lam_hop_dong)=2021))
group by dv.ma_dich_vu
order by dv.ma_dich_vu asc;

-- 7.hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021. 

select dv.ma_dich_vu,
		dv.ten_dich_vu,
        dv.dien_tich,
        dv.so_nguoi_toi_da,
        dv.chi_phi_thue,
        ldv.ten_loai_dich_vu
from dich_vu dv 
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where hd.ma_dich_vu not in (select ma_dich_vu from hop_dong 
			where (year(ngay_lam_hop_dong) = 2021))
group by dv.ma_dich_vu;

-- 8.hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- cach 1
select distinct ho_ten from khach_hang;

-- cach 2 
select ho_ten from khach_hang
group by ho_ten;

-- cach 3 
select ho_ten from khach_hang
union
select ho_ten from khach_hang; 

-- 9.thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select 
month(ngay_lam_hop_dong) as thang,
count(*) as so_luong_khach_hang 
from hop_dong
where ngay_lam_hop_dong regexp "^2021"
group by month(ngay_lam_hop_dong) 
having count(*) >= 1 
order by thang ;
-- 10.hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong,
hd.ngay_lam_hop_dong,
hd.ngay_ket_thuc,
hd.ngay_dat_coc as tien_dat_coc,
ifnull(sum(so_luong) ,0) as so_luong_dich_vu_di_kem 
from hop_dong hd 
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
group by hd.ma_hop_dong
order by hd.ma_hop_dong asc;