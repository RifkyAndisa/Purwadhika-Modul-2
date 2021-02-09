use sql_store;

select * from customers where last_name like '%field%';

-- arti dari $ di akhiri dengan ...
select * from customers where last_name regexp 'field$';
-- arti dari ^ di awali dengan ....
select * from customers where last_name regexp '^b';

-- pake LIKE
select * from customers where last_name LIKE 'field%' or last_name LIKE 'mac%' or last_name LIKE 'rose%';

-- pake regexp (tanda | sama dengan or)
select * from customers where last_name regexp'^field|^mac|^rose';


select * from customers where last_name regexp '[gin]e'; -- artinya yang mengandung ge / ie / ne

select * from customers where last_name regexp '[a-h]e';-- range dari A sampai H di pertemukan dengan E


-- RECAP
-- ^ awalan
-- $ ending
-- | logical or
-- [ABC] list of char
-- [a-h] range of char

-- yang mengandung elka atau ambur
select * from customers where first_name regexp 'elka|ambur';

-- yang di akhiri dengan EY atau ON
select * from customers where last_name regexp 'ey$|on$';

-- yang di awali dengan MY atau mengandung SE
select * from customers where last_name regexp '^MY|SE';

-- mengandung B dan di ikuti dengan R atau U
select * from customers where last_name regexp 'b[ru]';