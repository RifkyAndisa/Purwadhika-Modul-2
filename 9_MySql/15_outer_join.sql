use sql_store;

select * from customers c right join orders o
on c.customer_id = o.customer_id;
-- RIGHT JOIN = menampilkan data berdasarkan tabel di sebelah kanan


-- OUTER JOIN --
select c.customer_id, c.first_name, o.order_id from customers c JOIN orders o
ON c.customer_id = o.customer_id;

-- Left Join= menampilkan data berdasarkan tabel di sebelah kiri
select c.customer_id, c.first_name, o.order_id from orders o LEFT JOIN customers c
ON c.customer_id = o.customer_id;

-- cara lain Join pake where tanpa menggunakan JOIN/ implicit JOIN
select * from customers c, orders o where c.customer_id = o.customer_id;

-- QUIZ -- 
select * from order_items;
select * from products;
select * from orders;

select p.product_id, name, quantity from products p LEFT JOIN order_items oi
on p.product_id = oi.product_id;
