use sql_store;

select order_id, o.customer_id, first_name, last_name from orders o join customers c 
on o.customer_id = c.customer_id; 

select * from order_items;
select * from products;


-- join order_items dengan products
select oi.order_id, p.product_id, p.name, oi.quantity from order_items oi join products p
on oi.product_id = p.product_id;

-- munculin yang order IDnya 2
select oi.order_id, p.product_id, p.name, oi.quantity from order_items oi join products p
on oi.product_id = p.product_id where oi.order_id =2;