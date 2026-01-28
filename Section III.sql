--Complete order details
SELECT o.order_id, o.order_date, c.first_name, c.last_name, c.email, c.city, 
p.product_name, oi.quantity,oi.price, pay.payment_method, pay.amount, pay.status
FROM ecommerce-analytics-482417.Ecommerce_db.order o
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.customers c ON o.customer_id = c.customer_id
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.order_items oi ON o.order_id = oi.order_id
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.products p ON oi.product_id = p.product_id
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.payments pay ON o.order_id = pay.order_id;

--All order details or customer whose name is Rahul Sharma
SELECT o.order_id, o.order_date, o.total_amount, o.status
FROM ecommerce-analytics-482417.Ecommerce_db.order o
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.customers c ON o.customer_id = c.customer_id
WHERE c.first_name = 'Rahul' AND c.last_name = 'Sharma'
ORDER BY o.order_date DESC;

-- Catogery wise total products count
SELECT c.category_name, COUNT(p.product_id) as product_count
FROM ecommerce-analytics-482417.Ecommerce_db.categories c
LEFT JOIN ecommerce-analytics-482417.Ecommerce_db.products p ON c.category_id = p.category_id
GROUP BY c.category_name 
ORDER BY product_count DESC;

-- Customers wise total orders count
SELECT c.first_name, c.last_name, 
COUNT(o.order_id) as total_orders,
SUM(o.total_amount) as total_spent
FROM ecommerce-analytics-482417.Ecommerce_db.customers c
LEFT JOIN ecommerce-analytics-482417.Ecommerce_db.order o ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

-- Order status wise count
SELECT status, COUNT(*) as order_status,
SUM(total_amount) as total_value
FROM ecommerce-analytics-482417.Ecommerce_db.order
GROUP BY status;

-- Payment method preferences
SELECT payment_method, count(*) as total_transactions,
ROUND(sum(amount), 2) as payment_amount
FROM ecommerce-analytics-482417.Ecommerce_db.payments
GROUP BY payment_method
ORDER BY payment_amount DESC;
