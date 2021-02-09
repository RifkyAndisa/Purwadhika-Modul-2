use sql_invoicing;

select * from clients;

select * from invoices;

update invoices set payment_total = invoice_total * 0.75 
where client_id = (select client_id from clients where name = 'Myworks');


-- quiz

CREATE TABLE invoice_archived AS
SELECT 
	i.invoice_id,
    i.number,
    c.name AS client_name,
    i.invoice_total, 
    i.payment_total,
    i.invoice_date,
    i.due_date,
    i.payment_date
FROM invoices i
JOIN clients c
	USING (client_id)
WHERE payment_date IS NOT NULL;

SELECT * FROM invoice_archived;
