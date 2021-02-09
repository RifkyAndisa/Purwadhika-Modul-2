use sql_store;
select* from customers;
select* from customers where birth_date > '1990-01-01' and points > 1400;
select* from customers where birth_date > '1990-01-01' or points > 1400;

-- and akan di dahulukan di banding or--
select* from customers where birth_date > '1990-01-01' or points > 1400 and state ='VA';

select* from customers where (birth_date > '1990-01-01' or points > 1400) and state ='VA';

-- NOT = negasi 
-- akan merubah setiap tanda yang ada di dalamnya
-- < == >=
-- > == <=
-- = == !=
select* from customers where not (birth_date >'1990-01-01' or points > 1400);

select*from customers where birth_date <= '1990-01-01' and points <= 1000;

select*from order_items where (quantity * unit_price) > 30 ;