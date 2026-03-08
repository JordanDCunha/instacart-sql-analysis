-- =====================================================
-- INSTACART DATA ANALYSIS
-- Exploratory SQL queries analyzing customer purchasing
-- behavior in the Instacart Market Basket dataset
-- =====================================================


-- =====================================================
-- PRODUCT ANALYSIS
-- =====================================================

-- Top 20 most popular products
SELECT
    p.product_name,
    COUNT(*) AS times_ordered
FROM order_products op
JOIN products p
    ON op.product_id = p.product_id
GROUP BY p.product_name
ORDER BY times_ordered DESC
LIMIT 20;


-- Most frequently reordered products
SELECT
    p.product_name,
    SUM(op.reordered) AS reorder_count
FROM order_products op
JOIN products p
    ON op.product_id = p.product_id
GROUP BY p.product_name
ORDER BY reorder_count DESC
LIMIT 20;


-- =====================================================
-- DEPARTMENT ANALYSIS
-- =====================================================

-- Most popular departments by number of items ordered
SELECT
    d.department,
    COUNT(*) AS total_orders
FROM order_products op
JOIN products p
    ON op.product_id = p.product_id
JOIN departments d
    ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY total_orders DESC;


-- =====================================================
-- ORDER TIME ANALYSIS
-- =====================================================

-- Distribution of orders by hour of day
-- Used to identify peak shopping times
SELECT
    order_hour_of_day,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day;


-- =====================================================
-- CUSTOMER BEHAVIOR ANALYSIS
-- =====================================================

-- Average number of products per order (basket size)
SELECT
    AVG(product_count) AS avg_basket_size
FROM (
    SELECT
        order_id,
        COUNT(*) AS product_count
    FROM order_products
    GROUP BY order_id
) t;


-- Customers with the highest number of orders
SELECT
    user_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 20;


-- =====================================================
-- MARKET BASKET ANALYSIS
-- =====================================================

-- Product pairs frequently purchased together
SELECT
    op1.product_id,
    op2.product_id,
    COUNT(*) AS frequency
FROM order_products op1
JOIN order_products op2
    ON op1.order_id = op2.order_id
    AND op1.product_id < op2.product_id
GROUP BY op1.product_id, op2.product_id
ORDER BY frequency DESC
LIMIT 20;
