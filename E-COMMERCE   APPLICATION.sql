

-- ============================================
-- E-COMMERCE DATABASE
-- ============================================
DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;


-- ============================================
-- 1. CUSTOMER TABLE
-- ============================================

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);


-- INSERT 15 CUSTOMERS

INSERT INTO customer
(customer_id, customer_name, city, state, email, phone)
VALUES
(101, 'Anshu', 'Bengaluru', 'Karnataka', 'anshu@gmail.com', '9876543210'),
(102, 'Rahul', 'Mysuru', 'Karnataka', 'rahul@gmail.com', '9876543211'),
(103, 'Ravi', 'Hyderabad', 'Telangana', 'ravi@gmail.com', '9876543212'),
(104, 'Priya', 'Chennai', 'Tamil Nadu', 'priya@gmail.com', '9876543213'),
(105, 'Sneha', 'Mumbai', 'Maharashtra', 'sneha@gmail.com', '9876543214'),
(106, 'Kiran', 'Pune', 'Maharashtra', 'kiran@gmail.com', '9876543215'),
(107, 'Arjun', 'Delhi', 'Delhi', 'arjun@gmail.com', '9876543216'),
(108, 'Pooja', 'Kochi', 'Kerala', 'pooja@gmail.com', '9876543217'),
(109, 'Vijay', 'Hubli', 'Karnataka', 'vijay@gmail.com', '9876543218'),
(110, 'Neha', 'Noida', 'Uttar Pradesh', 'neha@gmail.com', '9876543219'),
(111, 'Manoj', 'Mangaluru', 'Karnataka', 'manoj@gmail.com', '9876543220'),
(112, 'Divya', 'Coimbatore', 'Tamil Nadu', 'divya@gmail.com', '9876543221'),
(113, 'Suresh', 'Jaipur', 'Rajasthan', 'suresh@gmail.com', '9876543222'),
(114, 'Kavya', 'Ahmedabad', 'Gujarat', 'kavya@gmail.com', '9876543223'),
(115, 'Akash', 'Kolkata', 'West Bengal', 'akash@gmail.com', '9876543224');


-- ============================================
-- 2. PRODUCT TABLE
-- ============================================

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);


-- INSERT 15 PRODUCTS

INSERT INTO product
(product_id, product_name, category, price, stock)
VALUES
(201, 'Laptop', 'Electronics', 55000.00, 20),
(202, 'Mouse', 'Electronics', 800.00, 50),
(203, 'Keyboard', 'Electronics', 1500.00, 40),
(204, 'Headphones', 'Electronics', 2500.00, 30),
(205, 'Backpack', 'Accessories', 1800.00, 25),
(206, 'Smartphone', 'Electronics', 30000.00, 15),
(207, 'Smart Watch', 'Electronics', 5000.00, 18),
(208, 'Monitor', 'Electronics', 12000.00, 12),
(209, 'Webcam', 'Electronics', 3500.00, 22),
(210, 'USB Cable', 'Accessories', 500.00, 60),
(211, 'Power Bank', 'Electronics', 1800.00, 35),
(212, 'Tablet', 'Electronics', 22000.00, 10),
(213, 'Speaker', 'Electronics', 4000.00, 25),
(214, 'Keyboard Cover', 'Accessories', 700.00, 45),
(215, 'Laptop Stand', 'Accessories', 1500.00, 20);


-- ============================================
-- 3. ORDERS TABLE
-- ============================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);


-- INSERT 15 ORDERS

INSERT INTO orders
(order_id, customer_id, order_date, total_amount, order_status)
VALUES
(301, 101, '2026-09-01', 55000.00, 'Delivered'),
(302, 102, '2026-09-02', 2300.00, 'Shipped'),
(303, 103, '2026-09-03', 2500.00, 'Delivered'),
(304, 104, '2026-09-04', 1500.00, 'Processing'),
(305, 105, '2026-09-05', 1800.00, 'Shipped'),
(306, 106, '2026-09-06', 30000.00, 'Delivered'),
(307, 107, '2026-09-07', 5000.00, 'Processing'),
(308, 108, '2026-09-08', 12000.00, 'Delivered'),
(309, 109, '2026-09-09', 3500.00, 'Shipped'),
(310, 110, '2026-09-10', 500.00, 'Delivered'),
(311, 111, '2026-09-11', 1800.00, 'Processing'),
(312, 112, '2026-09-12', 22000.00, 'Shipped'),
(313, 113, '2026-09-13', 4000.00, 'Delivered'),
(314, 114, '2026-09-14', 700.00, 'Processing'),
(315, 115, '2026-09-15', 1500.00, 'Shipped');


-- ============================================
-- 4. ORDER_ITEMS TABLE
-- ============================================

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES product(product_id)
);


-- INSERT 15 ORDER ITEMS

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity)
VALUES
(401, 301, 201, 1),
(402, 302, 202, 1),
(403, 303, 204, 1),
(404, 304, 203, 1),
(405, 305, 205, 1),
(406, 306, 206, 1),
(407, 307, 207, 1),
(408, 308, 208, 1),
(409, 309, 209, 1),
(410, 310, 210, 1),
(411, 311, 211, 1),
(412, 312, 212, 1),
(413, 313, 213, 1),
(414, 314, 214, 1),
(415, 315, 215, 1);


-- ============================================
-- 5. PAYMENT TABLE
-- ============================================

CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_amount DECIMAL(10,2),
    payment_status VARCHAR(30),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


-- INSERT 15 PAYMENTS

INSERT INTO payment
(payment_id, order_id, payment_method, payment_amount, payment_status)
VALUES
(501, 301, 'UPI', 55000.00, 'Paid'),
(502, 302, 'Credit Card', 2300.00, 'Paid'),
(503, 303, 'Debit Card', 2500.00, 'Paid'),
(504, 304, 'UPI', 1500.00, 'Pending'),
(505, 305, 'Cash on Delivery', 1800.00, 'Paid'),
(506, 306, 'Credit Card', 30000.00, 'Paid'),
(507, 307, 'UPI', 5000.00, 'Pending'),
(508, 308, 'Debit Card', 12000.00, 'Paid'),
(509, 309, 'UPI', 3500.00, 'Paid'),
(510, 310, 'Cash on Delivery', 500.00, 'Paid'),
(511, 311, 'Credit Card', 1800.00, 'Pending'),
(512, 312, 'UPI', 22000.00, 'Paid'),
(513, 313, 'Debit Card', 4000.00, 'Paid'),
(514, 314, 'UPI', 700.00, 'Pending'),
(515, 315, 'Cash on Delivery', 1500.00, 'Paid');


-- ============================================
-- CHECK ALL TABLES
-- ============================================

SHOW TABLES;

SELECT * FROM customer;
SELECT * FROM product;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payment;


/* =========================================================
   E-COMMERCE SQL BUSINESS REPORTS
   DATE: 30-09-2026
   DATABASE: ecommerce
   ========================================================= */


/* =========================================================
   SELECT DATABASE
   ========================================================= */

USE ecommerce;


/* =========================================================
   1. ORDER DETAILS WITH PRICE
   ========================================================= */

SELECT
    o.order_id,
    o.order_date,
    oi.product_id,
    p.product_name,
    oi.quantity,
    p.price
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN product AS p
    ON oi.product_id = p.product_id;


/* =========================================================
   2. CALCULATE ITEM VALUE
   Formula:
   Item Value = Quantity * Price
   ========================================================= */

SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_id,
    p.product_name,
    oi.quantity,
    p.price,
    oi.quantity * p.price AS item_value
FROM order_items AS oi
JOIN product AS p
    ON oi.product_id = p.product_id;


/* =========================================================
   3. CALCULATE ORDER VALUE
   Total value of products in each order
   ========================================================= */

SELECT
    oi.order_id,
    SUM(oi.quantity * p.price) AS order_value
FROM order_items AS oi
JOIN product AS p
    ON oi.product_id = p.product_id
GROUP BY oi.order_id;


/* =========================================================
   4. TOTAL PRODUCT REVENUE
   ========================================================= */

SELECT
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items AS oi
JOIN product AS p
    ON oi.product_id = p.product_id;


/* =========================================================
   5. TOTAL REVENUE EXCLUDING CANCELLED ORDERS
   ========================================================= */

SELECT
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items AS oi
JOIN product AS p
    ON oi.product_id = p.product_id
JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled';


/* =========================================================
   6. REVENUE BY PRODUCT
   ========================================================= */

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items AS oi
JOIN product AS p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY revenue DESC;


/* =========================================================
   7. QUANTITY SOLD BY PRODUCT
   ========================================================= */

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM order_items AS oi
JOIN product AS p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY quantity_sold DESC;


/* =========================================================
   8. TOP SELLING PRODUCT
   ========================================================= */

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM order_items AS oi
JOIN product AS p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY quantity_sold DESC
LIMIT 1;


/* =========================================================
   9. TOP 5 SELLING PRODUCTS
   ========================================================= */

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM order_items AS oi
JOIN product AS p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY quantity_sold DESC
LIMIT 5;


/* =========================================================
   10. CUSTOMER PURCHASE DETAILS
   ========================================================= */

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    p.product_id,
    p.product_name,
    oi.quantity,
    p.price,
    oi.quantity * p.price AS item_value
FROM customer AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN product AS p
    ON oi.product_id = p.product_id
ORDER BY c.customer_id;


/* =========================================================
   11. CUSTOMERS WHO NEVER ORDERED
   ========================================================= */

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.email
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


/* =========================================================
   BUSINESS REPORTS
   ========================================================= */


/* =========================================================
   12. TOTAL PRODUCTS
   ========================================================= */

SELECT
    COUNT(*) AS total_products
FROM product;


/* =========================================================
   13. TOTAL ORDERS
   ========================================================= */

SELECT
    COUNT(*) AS total_orders
FROM orders;


/* =========================================================
   14. TOTAL DELIVERED ORDERS
   ========================================================= */

SELECT
    COUNT(*) AS total_delivered_orders
FROM orders
WHERE order_status = 'Delivered';


/* =========================================================
   15. TOTAL CANCELLED ORDERS
   ========================================================= */

SELECT
    COUNT(*) AS total_cancelled_orders
FROM orders
WHERE order_status = 'Cancelled';


/* =========================================================
   16. TOTAL REVENUE BY CITY
   Excludes cancelled orders
   ========================================================= */

SELECT
    c.city,
    SUM(oi.quantity * p.price) AS revenue
FROM customer AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN product AS p
    ON oi.product_id = p.product_id
WHERE o.order_status <> 'Cancelled'
GROUP BY c.city
ORDER BY revenue DESC;


/* =========================================================
   17. TOP 5 PRODUCTS BY QUANTITY SOLD
   ========================================================= */

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS quantity_sold,
    SUM(oi.quantity * p.price) AS revenue
FROM product AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY quantity_sold DESC
LIMIT 5;


/* =========================================================
   18. COMPLETE ORDER REPORT
   Customer + Order + Product + Quantity + Price + Value
   ========================================================= */

SELECT
    o.order_id,
    o.order_date,

    c.customer_id,
    c.customer_name,
    c.city,

    p.product_id,
    p.product_name,
    p.price,

    oi.quantity,

    oi.quantity * p.price AS item_value,

    o.order_status

FROM orders AS o

JOIN customer AS c
    ON o.customer_id = c.customer_id

JOIN order_items AS oi
    ON o.order_id = oi.order_id

JOIN product AS p
    ON oi.product_id = p.product_id

ORDER BY o.order_id;


/* =========================================================
   19. COMPLETE ORDER REPORT WITH PAYMENT
   ========================================================= */

SELECT
    o.order_id,
    o.order_date,

    c.customer_id,
    c.customer_name,
    c.city,

    p.product_id,
    p.product_name,
    p.price,

    oi.quantity,

    oi.quantity * p.price AS item_value,

    o.order_status,

    pay.payment_method,
    pay.payment_amount,
    pay.payment_status

FROM orders AS o

JOIN customer AS c
    ON o.customer_id = c.customer_id

JOIN order_items AS oi
    ON o.order_id = oi.order_id

JOIN product AS p
    ON oi.product_id = p.product_id

LEFT JOIN payment AS pay
    ON o.order_id = pay.order_id

ORDER BY o.order_id;


/* =========================================================
   20. CUSTOMER TOTAL PURCHASE VALUE
   ========================================================= */

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_purchase_value
FROM customer AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN product AS p
    ON oi.product_id = p.product_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_purchase_value DESC;


/* =========================================================
   21. NUMBER OF ORDERS PER CUSTOMER
   ========================================================= */

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_orders DESC;


/* =========================================================
   22. TOTAL QUANTITY OF PRODUCTS IN EACH ORDER
   ========================================================= */

SELECT
    o.order_id,
    SUM(oi.quantity) AS total_quantity
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY o.order_id;


/* =========================================================
   23. ORDER VALUE WITH CUSTOMER DETAILS
   ========================================================= */

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    SUM(oi.quantity * p.price) AS order_value
FROM orders AS o
JOIN customer AS c
    ON o.customer_id = c.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN product AS p
    ON oi.product_id = p.product_id
GROUP BY
    o.order_id,
    c.customer_name,
    c.city
ORDER BY order_value DESC;


/* =========================================================
   24. PRODUCT REVENUE + QUANTITY SOLD
   ========================================================= */

SELECT
    p.product_id,
    p.product_name,
    p.price,
    SUM(oi.quantity) AS quantity_sold,
    SUM(oi.quantity * p.price) AS total_revenue
FROM product AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.price
ORDER BY total_revenue DESC;


/* =========================================================
   END OF E-COMMERCE BUSINESS REPORTS
   ========================================================= */