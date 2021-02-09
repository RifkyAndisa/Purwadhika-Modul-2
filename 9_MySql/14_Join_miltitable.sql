use sql_store;

select order_id, order_date, c.customer_id, c.first_name, c.last_name, o.status, os.name as status_name
from orders o join customers c on o.customer_id = c.customer_id
join order_statuses os on  o.status = os.order_status_id;



-- OUTER JOIN MULTIPLE TABLE -- 

SELECT order_id, c.customer_id, first_name, last_name, order_date, os.name AS status, s.name AS shipper FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_statuses os ON o.status = os.order_status_id
LEFT JOIN shippers s ON o.shipper_id = s.shipper_id;

-- masih error -- 
-- join order_items oi on oi.order_id = o.order_id
-- join products p on oi.product_id = p.product_id
-- order by order_id;


select *from order_statuses;

select * from shippers;

select * from orders;