-- > greater than
-- >= greater than or equal
-- < smaller than
-- <= smaller than or equal
-- = equal
-- != not equal
-- <> not equal

use sql_store;
select*from customers;
select*from customers where state = 'VA';
select*from customers where state != 'VA';
select*from customers where birth_date > '1990-01-01';

select*from orders where order_date >= '2019-01-01';