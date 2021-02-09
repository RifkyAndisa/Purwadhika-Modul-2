USE sql_store;

select*from customers where points >= 1000 and points <= 3000;

select*from customers where points between 1486 and 2967;

select*from customers where birth_date between '1990-01-01' and '2000-01-01';