-- =====================================================
-- CREATE INDEXES
-- Improve performance on large joins and filters
-- =====================================================

CREATE INDEX idx_orders_user_id
ON orders(user_id);


CREATE INDEX idx_order_products_order_id
ON order_products(order_id);


CREATE INDEX idx_order_products_product_id
ON order_products(product_id);
