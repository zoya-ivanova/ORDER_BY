/*Базы данных и SQL (семинары)
Урок 3. SQL – выборка данных, сортировка, агрегатные функции
*/

DROP DATABASE IF EXISTS homework3;
CREATE DATABASE IF NOT EXISTS homework3;

USE homework3;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45), 
`seniority` INT,
`salary` INT,
`age` INT);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
-- от большего к меньшему (в порядке убывания ЗП)
SELECT * FROM staff
ORDER BY salary DESC;
-- от меньшего к большему
SELECT * FROM staff
ORDER BY salary;

-- 2. Выведите 5 максимальных заработных плат (salary)
SELECT lastname, post, salary AS "Максимальная заработная плата"
FROM staff
LIMIT 5;

SELECT salary AS "Максимальная заработная плата"
FROM staff
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, SUM(salary) AS "Cуммарная зарплатa"
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников со специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно
SELECT post, COUNT(*)  AS "Кол-во сотрудников"
FROM staff
WHERE age >= 24 && age <= 49 AND post = "Рабочий"
ORDER BY salary;

-- 5. Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS "Кол-во специальностей"
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post 
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;




