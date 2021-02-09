use sql_hr;

select * from employees e join employees m on e.reports_to = m.employee_id;

select *from employees;

select e.employee_id, e.first_name as karyawan, m.first_name as manager from employees e join employees m 
on e.reports_to = m.employee_id;