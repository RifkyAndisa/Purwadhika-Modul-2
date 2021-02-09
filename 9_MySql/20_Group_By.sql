use sql_store;

select * from customers;

select state, count(customer_id) as Total_Customer from customers GROUP BY state;

-- tampilkan group state yang memiliki total point besar dari 1000
select state, sum(points) as Total_point from customers GROUP BY state HAVING Total_point > 1000;
select state,city, SUM(points) as Total_points from customers group by city, state having Total_points > 1000;
-- HAVING memberikan filter pada output, dan khusus untuk GROUP BY dan tidak bisa di pake di dalam query lain (Sama kaya where)

select customer_id, count(order_id) as Total_Orders from orders group by customer_id;

