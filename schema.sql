-- =====================================================
-- DATABASE CREATION
-- =====================================================

CREATE DATABASE instacart;


-- =====================================================
-- CLEAN UP EXISTING TABLES
-- =====================================================

DROP TABLE IF EXISTS order_products_train;
DROP TABLE IF EXISTS order_products_prior;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS aisles;
DROP TABLE IF EXISTS departments;


-- =====================================================
-- AISLES TABLE
-- =====================================================

CREATE TABLE aisles (
    aisle_id INT PRIMARY KEY,
    aisle TEXT
);


-- =====================================================
-- DEPARTMENTS TABLE
-- =====================================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department TEXT
);


-- =====================================================
-- PRODUCTS TABLE
-- =====================================================

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    aisle_id INTEGER,
    department_id INTEGER
);


-- =====================================================
-- ORDERS TABLE
-- =====================================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    eval_set TEXT,
    order_number INT,
    order_dow INT,
    order_hour_of_day INT,
    days_since_prior_order FLOAT
);


-- =====================================================
-- ORDER PRODUCTS TABLES
-- =====================================================

CREATE TABLE order_products_prior (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT
);

CREATE TABLE order_products_train (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT
);


-- =====================================================
-- FOREIGN KEYS
-- =====================================================

ALTER TABLE products
ADD FOREIGN KEY (aisle_id) REFERENCES aisles(aisle_id);

ALTER TABLE products
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE order_products_prior
ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE order_products_prior
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);
