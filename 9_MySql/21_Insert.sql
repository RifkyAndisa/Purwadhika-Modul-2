use sql_store;

select * from customers;

desc customers; -- kalau primari key dan auto_increment tidak harus di isi karena suda auto nanti menambah 1 --
-- points bisa di kosongin dan defaultnya 0 --
-- yang lainnya ga bisa di kosongin--

insert into customers(first_name,last_name,birth_date,phone,address,city,state)
values ('Robert','Pattionson','1992-02-29','404-234-2222','255 Avenue','Los Angeles','LA'),
('Andy','Warholl','1991-03-29','404-234-5322','245 Avenue','Atlanta','GA'),
('Buzz','Lightyear','1990-03-15','404-234-5367','045 Avenue','Visalia','ca'),
('Nemo','Fish','1994-01-01','404-784-5367','005 Avenue','Visalia','ca');

select * from customers;

-- insert Hierarchical rows
select * from orders;

desc orders;

insert into orders(customer_id,order_date,status)
values
(1, '2019-02-04', 1);
select * from orders;

select last_insert_id();

insert into order_items
values(last_insert_id(), 1,10 ,2.95),
(last_insert_id(), 2, 1 ,3.95);

select * from order_items;

select * from orders o join order_items oi on
o.order_id = oi.order_id
where o.order_id = 11;


-- quiz -- 
select * from customers;

-- panggil customer yang belum pernah memiliki order 
SELECT *
FROM customers c
WHERE customer_id NOT IN (SELECT customer_id FROM orders);
