-- Вставка данных в таблицу city
INSERT INTO city (city_id, city_name) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago'),
(4, 'Houston'),
(5, 'Phoenix'),
(6, 'Philadelphia');

-- Вставка данных в таблицу street
INSERT INTO street (id_street, street_name, city_city_id) VALUES
(1, 'Main St', 1),
(2, 'Broadway', 2),
(3, 'Michigan Ave', 3),
(4, 'Montrose Blvd', 4),
(5, 'Camelback Rd', 5),
(6, 'Market St', 6);

-- Вставка данных в таблицу house
INSERT INTO house (id_house, house_num, street_id_street) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

-- Вставка данных в таблицу apartment
INSERT INTO apartment (apartment_id, apartment_num, house_id_house) VALUES
(1, 101, 1),
(2, 102, 1),
(3, 103, 2),
(4, 104, 2),
(5, 105, 3),
(6, 106, 3);

-- Вставка данных в таблицу client
INSERT INTO client (client_id, client_name, client_surname, phone_num, client_email) VALUES
(1, 'John', 'Doe', '1234567890', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '0987654321', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', '1231231234', 'alice.johnson@example.com'),
(4, 'Bob', 'Brown', '4324324321', 'bob.brown@example.com'),
(5, 'Charlie', 'Davis', '5675675678', 'charlie.davis@example.com'),
(6, 'Eve', 'Wilson', '6786786789', 'eve.wilson@example.com');

-- Вставка данных в таблицу address
INSERT INTO address (address_id, house_id_house, apartment_apartment_id, client_client_id) VALUES
(1, 1, NULL, 1),
(2, NULL, 1, 2),
(3, 2, NULL, 3),
(4, NULL, 2, 4),
(5, 3, NULL, 5),
(6, NULL, 3, 6);

-- Вставка данных в таблицу category
INSERT INTO category (category_id, category_name) VALUES
(1, 'Pizza'),
(2, 'Burger'),
(3, 'Salad'),
(4, 'Dessert'),
(5, 'Drink'),
(6, 'Sushi');

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
(1, 'Margherita', 'Classic Italian pizza', 1000, 1, 1),
(2, 'Pepperoni', 'Pizza with pepperoni', 1200, 1, 2),
(3, 'Caesar Salad', 'Salad with chicken and Caesar dressing', 800, 3, 3),
(4, 'Cheeseburger', 'Burger with cheese', 1500, 2, 4),
(5, 'Chocolate Cake', 'Delicious chocolate cake', 600, 4, 5),
(6, 'Coca Cola', 'Soft drink', 200, 5, 6);

-- Вставка данных в таблицу order_status
INSERT INTO order_status (order_status_id, order_status_name) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Delivered'),
(5, 'Cancelled'),
(6, 'Returned');

-- Вставка данных в таблицу orders
INSERT INTO orders (order_id, order_date, address_address_id, order_status_order_status_id, client_client_id, cart_cart_id) VALUES
(1, '2023-10-01', 1, 1, 1, 1),
(2, '2023-10-02', 2, 2, 2, 2),
(3, '2023-10-03', 3, 3, 3, 3),
(4, '2023-10-04', 4, 4, 4, 4),
(5, '2023-10-05', 5, 5, 5, 5),
(6, '2023-10-06', 6, 6, 6, 6);

-- Вставка данных в таблицу cart
INSERT INTO cart (cart_id, quantity, total_cost, orders_order_id) VALUES
(1, 2, 2000, 1),
(2, 1, 1000, 2),
(3, 3, 3000, 3),
(4, 2, 2000, 4),
(5, 1, 1000, 5),
(6, 3, 3000, 6);

-- Вставка данных в таблицу dish_cart
INSERT INTO dish_cart (cart_cart_id, dish_dish_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);
