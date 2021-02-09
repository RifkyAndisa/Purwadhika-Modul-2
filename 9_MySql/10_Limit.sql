USE sql_store;

select * from customers limit 3; -- menampilkan 3 data pertama

select *from customers limit 3, 4;
-- limit {digit 1}, {digit 2} = berarti kita melompati data sebanyak DIGIT 1, lalu ambil DIGIT 2 data setelahnya


-- QUIZ --
select * from customers order by points desc limit 3;
