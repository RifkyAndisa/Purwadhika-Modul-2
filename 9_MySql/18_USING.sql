USE sql_store;

select * from orders;
-- join colom yang sama bisa menggunakan USING jika tidak sama maka tidak bisa digunakan
select *from orders join customers using (customer_id)
Join shippers using(shipper_id);

-- tampilkan semua yang sudah melakukan pembayaran-- 
use sql_invoicing;
select * from clients;
select * from invoices;
select * from payment_methods;
select * from payments;

select p.date, c.name, p.amount, pm.name as payment_method
from payments p
join clients c using (client_id) join payment_methods pm
on p.payment_method = pm.payment_method_id;