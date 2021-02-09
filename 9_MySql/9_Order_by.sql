use sql_store;

select * from customers ORDER BY first_name; -- Dari A ke Z

select * from customers ORDER BY first_name desc; -- dari Z ke A

select * from customers ORDER BY state, points;

select * from customers ORDER BY birth_date;


-- QUIZ --
-- dari tabel order_items, tampilkan data yang order idnya sama dengan 2, tampilkan pula data total pricenya.
-- lalu urutkan total price yang paling tinggi