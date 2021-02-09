use sql_store;

select * from customers where points > (select avg(points) from customers where state = 'ca');

-- order ID berapa yang ordernya paling tinggi --
select * from order_items where quantity = (select max(quantity) from order_items);
-- atau order UD berapa yang memesan dengan jumlah 10 --
select * from order_items where quantity in (select order_id from order_items where quantity=10) and quantity = 10;

select * from order_items oi join products p on oi.product_id = p.product_id
where quantity = (select max(quantity) from order_items);