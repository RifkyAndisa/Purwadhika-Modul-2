use sql_store;

-- manggil semua table
select * from customers;

-- memanggil colom yang ada di dalam tabel
select first_name, last_name from customers;

-- memanggil colom yang ada di tabel dengan di tambahkan colom baru##
select first_name, last_name, points, (points+10)*100 as 'discount factor' from customers;

-- menampilkan unique value##
select distinct (state) from customers;



select * from products;
select name, unit_price, (unit_price*1.2) as 'new price' from products