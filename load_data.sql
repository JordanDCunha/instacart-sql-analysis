-- =====================================================
-- LOAD DATA INTO TABLES
-- =====================================================

COPY aisles(aisle_id, aisle)
FROM 'data/aisles.csv'
DELIMITER ','
CSV HEADER;


COPY departments(department_id, department)
FROM 'data/departments.csv'
DELIMITER ','
CSV HEADER;


COPY products(product_id, product_name, aisle_id, department_id)
FROM 'data/products.csv'
DELIMITER ','
CSV HEADER;


COPY orders(order_id, user_id, eval_set, order_number, order_dow, order_hour_of_day, days_since_prior_order)
FROM 'data/orders.csv'
DELIMITER ','
CSV HEADER;


COPY order_products_prior(order_id, product_id, add_to_cart_order, reordered)
FROM 'data/order_products__prior.csv'
DELIMITER ','
CSV HEADER;


COPY order_products_train(order_id, product_id, add_to_cart_order, reordered)
FROM 'data/order_products__train.csv'
DELIMITER ','
CSV HEADER;
