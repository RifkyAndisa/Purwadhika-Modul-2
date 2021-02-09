USE sql_invoicing;

select * from invoices;

-- meng update data pada payment_date yang berada di invoice_id 5
update invoices SET payment_date = '2020-03-04' where invoice_id = 5;

desc invoices;

-- menjadikan data ke bentuk defaultnya
update invoices SET payment_total  = default, payment_date = default where invoice_id = 6;

--
update invoices set invoice_total = invoice_total - 0, due_date = '2019-06-30' where invoice_id = 2;

