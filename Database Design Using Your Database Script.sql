START TRANSACTION;

DROP TABLE
DROP TABLE
DROP TABLE

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
    item_price DECIMAL NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES urban_eats(id)
);

CREATE TABLE customer_order (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id VARCHAR(50) NOT NULL,
    restaurant_location VARCHAR(50) NOT NULL,
    order_items VARCHAR(50) NOT NULL,
    total DECIMAL NOT NULL,
    FOREIGN KEY (restaurant_location) REFERENCES menu(restaurant_id)
);

-- Customer Table
INSERT INTO customers (id, customer_name, customer_email)
VALUES
(1, 'Linda Steinburg', 'lsburg@yahoo.com'),
(2, 'Jane Doe', 'jdoe@gmail.com'),L
(3, 'Marcus Warnert', 'mrvwarnert@gmail.com');

-- Customer Table
INSERT INTO urban_eats (id, address)
VALUES
(1, '777 Rundown Street');

-- Menu Table
INSERT INTO menu (id, restaurant_id, item_name, item_price)
VALUES
(1, 50, 'Burger', 5.99),
(2, 50, 'Fries', 2.99),
(3, 50, 'Sodie Pop', 0.99),
(4, 51, 'Pizza Slice', 1.99),
(5, 51, 'Caesar Salad', 1.99),
(6, 51, 'Lemonade', 0.99);

-- Customer Order Table
INSERT INTO customer_order (id, customer_id, restaurant_location, order_items, total)
VALUES
(100, 1, 50, 'Burger', 5.99)




