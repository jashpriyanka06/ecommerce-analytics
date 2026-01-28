-- Top 10 selling products
SELECT p.product_name, 
SUM(oi.quantity) as total_sold,
SUM(oi.quantity * oi.price) as revenue_generated
FROM ecommerce-analytics-482417.Ecommerce_db.order_items oi
LEFT JOIN ecommerce-analytics-482417.Ecommerce_db.products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 10;

-- Category wise revenue
SELECT c.category_name, 
SUM(oi.quantity) as total_sold,
SUM(oi.quantity * oi.price) as revenue_generated
FROM ecommerce-analytics-482417.Ecommerce_db.categories c
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.products p ON c.category_id = p.category_id 
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.order_items oi ON oi.product_id = p.product_id
GROUP BY ROLLUP(category_name) 
ORDER BY revenue_generated ;

-- City wise customers distribution
SELECT city, state, COUNT(*) as customer_count
FROM ecommerce-analytics-482417.Ecommerce_db.customers 
GROUP BY city, state
ORDER BY customer_count;

-- Monthly revenue report
SELECT FORMAT_TIMESTAMP('%m-%Y', order_date) as month,
COUNT(order_id) as total_orders,
SUM(total_amount) as monthly_revenue
FROM ecommerce-analytics-482417.Ecommerce_db.order 
WHERE status != 'cancelled'
Group by month
ORDER BY month DESC;

-- All products with categories
SELECT p.product_name, p.price, c.category_name, p.stock_quantity
FROM ecommerce-analytics-482417.Ecommerce_db.products p
JOIN ecommerce-analytics-482417.Ecommerce_db.categories c ON p.category_id = c.category_id;
