use delivery;

/*
 * a. Запрос на извлечение данных из нескольких связанных таблиц 
 * с использованием соединения по равенству полей таблиц.  
 * (“=” в условии WHERE);
 * */

select
    c.client_id,
    o.order_date,
    o.required_date,
    concat(c.client_name, ' ', c.client_surname) as FI,
    c.phone_num,
    c.client_email,
    os.order_status_name
from
    orders o,
    client c,
    order_status os
where
    o.client_client_id = c.client_id
    and o.order_status_order_status_id = os.order_status_id;


-- b. Запрос а) реализовать вторым способом с использованием INNER JOIN; 
   
select
    c.client_id,
    o.order_date,
    o.required_date,
    concat(c.client_name, ' ', c.client_surname) as FI,
    c.phone_num,
    c.client_email,
    os.order_status_name
from
    orders o
inner join
    client as c on o.client_client_id = c.client_id
inner join
    order_status as os on o.order_status_order_status_id = os.order_status_id;
    
   
-- c. Запрос с использованием процедурных возможностей SQL (команда CASE).

SELECT
    CASE
        WHEN d.dish_price > 1000 THEN 'Дорого'
        WHEN d.dish_price < 500 THEN 'Дешево'
        ELSE 'Нормально'
    END AS price,
    d.dish_name,
    d.dish_description
FROM
    dish d;

-- d. Запрос с использованием группировок, группировочных функций и условий на группы (HAVING);

SELECT
    c.orders_order_id,
    SUM(c.quantity * d.dish_price) AS total_amount
FROM
    cart c
JOIN
    dish d ON c.dish_dish_id = d.dish_id
GROUP BY
    c.orders_order_id
HAVING
    total_amount < 1000;
   
-- e. Запрос с использованием левого/правого соединения (LEFT/RIGHT JOIN);

SELECT
    c.client_id,
    concat(c.client_name, ' ', c.client_surname) as FI,
    o.order_id,
    o.order_date,
    o.required_date,
    os.order_status_name
FROM
    client c
LEFT JOIN
    orders o ON c.client_id = o.client_client_id
LEFT JOIN
    order_status os ON o.order_status_order_status_id = os.order_status_id
ORDER BY
    c.client_id, o.order_date;

-- f. Запрос с использованием вложенного подзапроса (вложенный SELECT);
   
SELECT
    c.client_id,
    concat(c.client_name, ' ', c.client_surname) as FI,
    c.phone_num,
    c.client_email
FROM
    client c
WHERE
    c.client_id IN (
        SELECT a.client_client_id
        FROM address a
        INNER JOIN house h ON a.house_id_house = h.id_house
        INNER JOIN street s ON h.street_id_street = s.id_street
        INNER JOIN city ci ON s.city_city_id = ci.city_id
        WHERE ci.city_name = 'Одинцово'
    );

-- g. Запрос на создание представления (VIEW) по запросу b).

create view user_orders_and_status as
select
    c.client_id,
    o.order_date,
    o.required_date,
    concat(c.client_name, ' ', c.client_surname) as FI,
    c.phone_num,
    c.client_email,
    os.order_status_name
from
    orders o
inner join
    client as c on o.client_client_id = c.client_id
inner join
    order_status as os on o.order_status_order_status_id = os.order_status_id;

-- 2.2.	Триггеры
-- тригер который при создании заказа в желаемую дату добавляет дату создания + 1 час
  
DELIMITER //

CREATE TRIGGER insert_required_date
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    SET NEW.required_date = DATE_ADD(NEW.order_date, INTERVAL 1 HOUR);
END; //
   
DELIMITER ;
   

INSERT INTO orders (order_id, order_date, address_address_id, order_status_order_status_id, client_client_id, order_total_amount)
VALUES (11, CURDATE(), 1, 1, 1, 0);


-- считает новую сумму заказа при изменении корзины если статус заказа В ожидании (Обработка, Проблема, Отменено)

DELIMITER //

CREATE TRIGGER update_order_total_amount AFTER INSERT ON cart
FOR EACH ROW
BEGIN
    DECLARE order_status_id INT;
    DECLARE new_total_amount DECIMAL(10, 2);
   
    SELECT order_status_order_status_id INTO order_status_id
    FROM orders
    WHERE order_id = NEW.orders_order_id;

    IF order_status_id IN (1, 2, 5, 6) THEN
        SELECT SUM(c.quantity * d.dish_price) INTO new_total_amount
        FROM cart c
        JOIN dish d ON c.dish_dish_id = d.dish_id
        WHERE c.orders_order_id = NEW.orders_order_id;

        UPDATE orders
        SET order_total_amount = new_total_amount
        WHERE order_id = NEW.orders_order_id;
    END IF;
END; //

DELIMITER ;


insert INTO cart (cart_id, orders_order_id, dish_dish_id, quantity) VALUES
(15, 10, 4, 1);



