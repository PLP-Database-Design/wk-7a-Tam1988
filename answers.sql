-- Question 1 Achieving 1NF (First Normal Form)
USE Store;

CREATE TABLE storeProducts(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    products VARCHAR (50)
);

CREATE TABLE storeCustomers(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50)
);

CREATE TABLE storeOrders(
order_id INT,
CustomerName VARCHAR(50),
product_id INT,
FOREIGN KEY(order_id) REFERENCES storeCustomers(order_id),
FOREIGN KEY(product_id) REFERENCES storeProducts(product_id)
);

INSERT INTO storeProducts(product_id, products)
VALUES(1, "Laptop"),
(2, "Mouse"),
(3, "Tablet"),
(4, "Keyboard"),
(5, "Phone");

INSERT INTO storeCustomers(order_id, CustomerName)
VALUES(101, "John Doe"),
(102, "Jane Smith"),
(103, "Emily Clark");

INSERT INTO storeOrders(order_id, CustomerName, products)
VALUES(101, "John Doe", "Laptop"),
(101, "John Doe", "Mouse"),
(102, "Jane Smith", "Tablet"),
(102, "Jane Smith", "Keyboard"),
(102, "Jane Smith", "Mouse"),
(103, "Emily Clark", "Phone");


-- Question 2 Achieving 2NF (Second Normal Form)

USE Store;
CREATE TABLE accurateOrders(
    accurateOrder_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    Quantity INT,
    FOREIGN KEY(order_id) REFERENCES storeCustomers(order_id),
    FOREIGN KEY(product_id) REFERENCES storeProducts(product_id)
);

INSERT INTO accurateOrders(order_id, product_id, Quantity)
VALUES(101, 1, 2),
(101, 2, 1),
(102, 3, 3),
(102, 4, 1),
(102, 2, 2),
(103, 5, 1);
