-- Вставка данных в таблицу city
INSERT INTO city (city_id, city_name) VALUES
(1, 'Одинцово'),
(2, 'Видное'),
(3, 'Балашиха'),
(4, 'Мытищи'),
(5, 'Люберцы'),
(6, 'Подольск');

-- Вставка данных в таблицу street
INSERT INTO street (id_street, street_name, city_city_id) VALUES
(1, 'Молодежная', 1),
(2, 'Западная', 3),
(3, 'Садовая', 2),
(4, 'Волковская', 5),
(5, 'Фрунзе', 4),
(6, 'Климовская', 6);

-- Вставка данных в таблицу house
INSERT INTO house (id_house, house_num, street_id_street) VALUES
(1, 123, 1),
(2, 222, 1),
(3, 32, 3),
(4, 44, 4),
(5, 52, 2),
(6, 522, 3),
(7, 53, 5),
(8, 50, 1),
(9, 156, 6);

-- Вставка данных в таблицу apartment
INSERT INTO apartment (apartment_id, apartment_num, house_id_house) VALUES
(1, 10, 1),
(2, 102, 1),
(3, 103, 2),
(4, 104, 3),
(5, 104, 4);

-- Вставка данных в таблицу client
INSERT INTO client (client_id, client_name, client_surname, phone_num, client_email) VALUES
(1, 'John', 'Doe', '1234567890', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '0987654321', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', '1231231234', 'alice.johnson@example.com'),
(4, 'Bob', 'Brown', '4324324321', 'bob.brown@example.com'),
(5, 'Charlie', 'Davis', '7777777566', 'charlie.davis@example.com'),
(6, 'Charl', 'Davis', '7828282882', 'charl.davis@example.com'),
(7, 'Arlie', 'Davis', '1234123412', 'arlie.davis@example.com'),
(8, 'Lie', 'Davis', '8238382188', 'lie.davis@example.com'),
(9, 'Eve', 'Wilson', '6786712389', 'eve.wilson@example.com'),
(10, 'Ivan', 'Wilson', '617862312389', 'ivan.wilson@example.com');

-- Вставка данных в таблицу address частный дом
INSERT INTO address (address_id, house_id_house, client_client_id) VALUES
(1, 5, 1),
(2, 6, 2),
(3, 7, 3),
(4, 8, 4),
(5, 9, 5);

-- Вставка данных в таблицу address квартира
INSERT INTO address (address_id, apartment_apartment_id, client_client_id) VALUES
(6, 1, 6),
(7, 2, 7),
(8, 3, 8),
(9, 4, 9),
(10, 5, 10);

-- Вставка данных в таблицу order_status
INSERT INTO order_status (order_status_id, order_status_name) VALUES
(1, 'В ожидании'),
(2, 'Обработка'),
(3, 'Отправленный'),
(4, 'Доставленный'),
(5, 'Отменено');

-- Вставка данных в таблицу orders
INSERT INTO orders (order_id, order_date, address_address_id, order_status_order_status_id, client_client_id, cart_cart_id) VALUES
(1, CURDATE(), 1, 1, 1, 1),
(2, CURDATE(), 2, 3, 2, 2),
(3, CURDATE(), 3, 3, 3, 3),
(4, CURDATE(), 4, 3, 4, 4),
(5, CURDATE(), 5, 3, 5, 5),
(6, CURDATE(), 6, 3, 6, 6),
(7, CURDATE(), 7, 4, 7, 7),
(8, CURDATE(), 8, 4, 8, 8),
(9, CURDATE(), 9, 5, 9, 9),
(10, CURDATE(), 10, 2, 10, 10);


-- Вставка данных в таблицу cart
INSERT INTO cart (cart_id, quantity, total_cost, orders_order_id) VALUES
(1, 2, 2000, 1),
(2, 1, 1000, 2),
(3, 3, 3000, 3),
(4, 2, 2000, 4),
(5, 1, 1000, 5),
(6, 2, 2000, 1),
(7, 1, 1000, 2),
(8, 3, 3000, 3),
(9, 2, 2000, 4),
(10, 1, 1000, 5);


-- Вставка данных в таблицу category
INSERT INTO category (category_id, category_name) VALUES
(1, 'Пицца'),
(2, 'Бургер'),
(3, 'Салат'),
(4, 'Десерт'),
(5, 'Напиток'),
(6, 'Суши');

-- Вставка данных в таблицу supplier
INSERT INTO supplier (supplier_id, supplier_name) VALUES
(1, 'Pizza Hut'),
(2, 'Domino\'s'),
(3, 'McDonald\'s'),
(4, 'Burger King'),
(5, 'Dunkin\' Donuts'),
(6, 'Starbucks');

-- Вставка данных в таблицу dish
INSERT INTO dish (dish_id, dish_name, dish_description, dish_price, category_category_id, supplier_supplier_id) VALUES
(1, 'Маргарита', 'Классическая пицца', 1000, 1, 1),
(2, 'Pepperoni', 'Pizza with pepperoni', 1200, 1, 2),
(3, 'Caesar Salad', 'Salad with chicken and Caesar dressing', 800, 3, 3),
(4, 'Cheeseburger', 'Burger with cheese', 1500, 2, 4),
(5, 'Chocolate Cake', 'Delicious chocolate cake', 600, 4, 5),
(6, 'Coca Cola', 'Soft drink', 200, 5, 6);







-- Вставка данных в таблицу dish_cart
INSERT INTO dish_cart (cart_cart_id, dish_dish_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);