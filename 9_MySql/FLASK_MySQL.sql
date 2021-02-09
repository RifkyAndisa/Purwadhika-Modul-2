CREATE DATABASE flask_mysql;

USE flask_mysql;

CREATE TABLE employee(
	id int AUTO_INCREMENT PRIMARY KEY,
    username varchar(20) UNIQUE,
    name varchar(20),
    gender enum('M', 'L'),
    married tinyint
);

INSERT INTO employee (username, name, gender, married)
VALUES ('danang123', 'danang', 'M', 1),
('mrdarto', 'darto', 'M', 1),
('sulele', 'sule', 'M', 1);

SELECT * FROM employee;
