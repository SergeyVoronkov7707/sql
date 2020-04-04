
/*-- Задача 1:
-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
-- Заполните их текущими датой и временем.
*/
UPDATE users SET  created_at=CURRENT_TIMESTAMP()
UPDATE users SET  updated_at = CURRENT_TIMESTAMP()
 

-- задача 2:

/*Таблица users была неудачно спроектирована.
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/
ALTER TABLE users ADD COLUMN tempstamp DATETIME
update users set tempstamp = created_at 
ALTER TABLE users DROP COLUMN created_at;
ALTER TABLE users CHANGE COLUMN tempstamp created_at datetime;
 

ALTER TABLE users ADD COLUMN tempstamp DATETIME
update users set tempstamp = updated_at 
ALTER TABLE users DROP COLUMN updated_at;
ALTER TABLE users CHANGE COLUMN tempstamp updated_at datetime;




/*
Задача 3:
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0,
если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом,
чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/



INSERT INTO storehouses_products
  (value)
VALUES
(2550),
(200),
(15),
(0),
(0),
(30);



SELECT * FROM storehouses_products ORDER BY value =0 ,value







/*
Задача 4
(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий ('may', 'august')
(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

*/
SELECT name, birthday_at FROM users WHERE MONTHNAME(birthday_at) ='May' OR MONTHNAME(birthday_at) = 'August';
/*


Практическое задание теме “Агрегация данных”
Задача 1
Подсчитайте средний возраст пользователей в таблице users
*/

ALTER TABLE users ADD COLUMN tempstamp int 

update users set tempstamp = TIMESTAMPDIFF (YEAR ,birthday_at,NOW())

SELECT AVG(tempstamp) FROM users 

/*
 * Задача 2
Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
 Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */

SELECT name, DAYNAME(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at))) as bithdate from users;
SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at)))) as 'Mondaybirth' FROM users where DAYNAME(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at))) = "Monday"; 
SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at)))) as 'Tuesdaybirth' FROM users where DAYNAME(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at))) = "Tuesday"; 
SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at)))) as 'Wednesdaybirth' FROM users where DAYNAME(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at))) = "Wednesday"; 
SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at)))) as 'Thursdaybirth' FROM users where DAYNAME(CONCAT(YEAR(NOW()),'-',MONTH(birthday_at),'-',DAY(birthday_at))) = "Thursday";


/*
 Задача 3
(по желанию) Подсчитайте произведение чисел в столбце таблицы
 */
SELECT EXP(SUM(LN(value))) from vtable






