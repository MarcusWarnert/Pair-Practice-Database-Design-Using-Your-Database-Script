USE urban_eatsDB;

START TRANSACTION;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS customer_order;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS urban_eats;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(100) NULL DEFAULT 'N/A'
);

CREATE TABLE urban_eats (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE menu (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(50) NOT NULL,
    item_price DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES urban_eats(id)
);

CREATE TABLE customer_order (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    total DECIMAL(6,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (restaurant_id) REFERENCES urban_eats(id)
);

CREATE TABLE order_items (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES customer_order(id),
    FOREIGN KEY (menu_item_id) REFERENCES menu(id)
);

-- customer Table
INSERT INTO customers (id, customer_name, customer_email)
VALUES
(1, 'Linda Steinburg', 'lsburg@yahoo.com'),
(2, 'Jane Doe', 'jdoe@gmail.com'),
(3, 'Marcus Warnert', 'mrvwarnert@gmail.com');

-- urban_eats Table
INSERT INTO urban_eats (id, address)
VALUES
(1, '777 Rundown Street'),
(2, '123 Uptown Road'),
(3, '901 Midway Boulevard');

-- menu Table
INSERT INTO menu (id, restaurant_id, item_name, item_price)
VALUES
(1, 1, 'Burger', 5.99),
(2, 1, 'Fries', 2.99),
(3, 1, 'Sodie Pop', 0.99),
(4, 2, 'Pizza Slice', 1.99),
(5, 2, 'Caesar Salad', 1.99),
(6, 2, 'Lemonade', 0.99),
(7, 3, 'Cheesesteak', 9.99),
(8, 3, 'Chicken Parm', 8.99);

-- Customer Order Table
INSERT INTO customer_order (customer_id, restaurant_id, total)
VALUES
(1, 1, 8.98),
(1, 2, 5.99),
(3, 3, 8.99);

-- order_items Table
INSERT INTO order_items(order_id, menu_item_id, quantity)
VALUES 
(1, 1, 1),
(1, 2, 1),
(3, 8, 1);

COMMIT;



