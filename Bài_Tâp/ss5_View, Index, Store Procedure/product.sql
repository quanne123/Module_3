create database demo;
use demo;

create table Products(
id int primary key auto_increment,
product_code int,
product_name varchar(45),
product_price double,
product_amount varchar(50),
product_description varchar(50),
product_status varchar(50)
);
INSERT INTO Products (id,product_code, product_name, product_price, product_amount, product_description, product_status) VALUES (1,3, 'sua', 100, '3', 'tuoi', 'a');
INSERT INTO Products (id,product_code, product_name, product_price, product_amount, product_description, product_status) VALUES (2,4, 'banh mi', 200, '4', 'cha', 'b');
INSERT INTO Products (id,product_code, product_name, product_price, product_amount, product_description, product_status) VALUES (3,5, 'banh trang tron', 50, '2', 'bo kho', 'c');

create unique index index_name on Products(product_code);
create index index_name_a on Products(product_name,product_price);

explain select count(*) from Products 
where id = 1; 

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view product_view as
select product_code,product_name,product_price,product_status 
from Products;

 -- goi view 
 select * from product_view;
 
-- Tiến hành sửa đổi view 
set sql_safe_updates = 0;
update product_view set product_name = "sua" where product_code = 3; 

-- tien hanh xoa view 
drop view product_view;
truncate Products;

-- Tạo store procedure  lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure product_procedure()
begin
select * from Products ; 
end //
delimiter ; 

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure products_procedure(id int,product_code int,product_name varchar(45),product_price double,product_amount varchar(50),product_description varchar(50),product_status varchar(50))
begin
insert into Products(id ,product_code,product_name,product_price ,product_amount ,product_description ,product_status) 
values (id ,product_code,product_name,product_price ,product_amount ,product_description ,product_status);
end //
delimiter ;


call products_procedure(2,6, 'banh trang', '50', '2', 'Da Nang', 'e');
-- Tạo store procedure sửa thông tin sản phẩm theo id 
delimiter // 
create procedure productss_procedure(id_edit int,code_edit int,name_edit varchar(45),price_edit double,amount_edit varchar(50),description_edit varchar(50),status_edit varchar(50))
begin
update Products set 
product_code = code_edit,
product_name = name_edit,
product_price = price_edit,
product_amount = amount_edit,
product_description = description_edit,
product_status = status_edit 
where id = id_edit;
end //
delimiter ;
call productss_procedure(2, 4, "banh mi", 300, "1", "sua ong tho", 1);
call product_procedure();

delimiter // 
create procedure productsss_procedure(id_delete int)
begin
delete from Products where Products.id = id_delete;
end //
delimiter ;

call productsss_procedure(3);