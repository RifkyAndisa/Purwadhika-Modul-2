USE sql_store;

select * from customers where state in ('VA','CA','IL','TX','FL');
select * from customers where state not in ('VA','CA','IL','TX','FL');

select* from products where quantity_in_stock in (49,38,72);