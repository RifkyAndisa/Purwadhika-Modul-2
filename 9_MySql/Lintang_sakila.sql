use sakila;

select * from film; -- film_id
select * from film_category; -- film_id , category_id
select * from category; -- category_id


-- No.1 munculin 10 film komedi rekomendasi dengan durasi tersingkat,urutkan berdasarkan durasi tersingkat, kolom yang wajib ada itu title, category length

select title, length, c.name as category 
from film f 
join film_category fc 
ON f.film_id = fc.film_id
JOIN category c 
on fc.category_id = c.category_id
where c.name = 'Comedy' order by length limit 10;

-- No.2 Tampilkan daftar lengkap kategori film beserta jumlah film tiap kategori & rata-rata harga sewa DVD film tiap kategori. Urutkan data dari kategori dengan jumlah film terbanyak. 
-- Kolom yang diwajibkan ada minimal adalah kategori, jumlah film dan rata-rata harga sewa

select c.name as Kategori, count(c.name) as JumlahMovie, avg(f.rental_rate) from film f
Join film_category fc
using (film_id)
Join category c
using (category_id)
group by c.name
order by jumlahmovie desc;


-- No.3
select rating, 'General Audience' as Keterangan, count(rating) as jumlahMovie from film f where rating = 'G'
UNION
select rating, 'Parental Guidence Suggested' as Keterangan, count(rating) as jumlahMovie from film f where rating = 'PG'
UNION
select rating, 'Parental Guidence for Under 13' as Keterangan, count(rating) as jumlahMovie from film f where rating = 'PG-13'
UNION
select rating, 'Restricted' as Keterangan, count(rating) as jumlahMovie from film f where rating = 'R'
UNION
select rating, 'No Children Under 17 Admitted' as Keterangan, count(rating) as jumlahMovie from film f where rating = 'NC-17';
