use sql_store;

select *, 'Active' as order_status from orders where order_date >= '2019-01-01'
union
select *, 'Inactivate' as order_status from orders where order_date < '2019-01-01';

-- q
SELECT customer_id, first_name, points,'Bronze' AS type FROM customers WHERE points < 2000
UNION
SELECT customer_id,first_name,points,'Silver' AS type FROM customers WHERE points BETWEEN 2000 AND 3000
UNION
SELECT customer_id,first_name,points,'Gold' AS type FROM customers WHERE points > 3000
ORDER BY type;