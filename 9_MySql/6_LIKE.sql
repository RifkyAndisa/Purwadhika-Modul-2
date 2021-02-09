USE sql_store;

-- di awali dengan huruf B
select * from customers where last_name like 'b%';
-- yang mengandung huruf B
select * from customers where last_name like '%b%';
-- di akhiri dengan huruf Y
select * from customers where last_name like '%y';


-- 1 UNDERSCORE mewakili 1 Karakter/Alphabet
select * from customers where last_name like '_____y';
-- 
select * from customers where last_name like 'B____y';



-- tampilkan data yang alamatnya memiliki kata TRAIL dan AVENUE, namun nomor telfonnya tidak memiliki angka 8
select *from customers where (address like '%trail%' or address like '%avenue%') and phone NOT LIKE '%8%';