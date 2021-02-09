use sql_store;

select * from order_items;

select SUM(quantity) as Total_Quantity_Out from order_items;

select SUM(quantity) as Total_id3_Quantity_Out from order_items where product_id = 3;

select count(*) as Banayak_customers from customers;

select count(distinct(state)) as Banyak_state from customers;

select max(quantity) as max_out from order_items;

select min(quantity) as min_out from order_items;

select avg(unit_price) from order_items; -- average / rata rata -- 

select distinct(oi.product_id) as product_out, p.name from order_items oi 
JOIN products p on oi.product_id = p.product_id;

select distinct(state) from customers; -- distinct untuk menampilkan UNIQUE-- 