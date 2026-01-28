-- Top five customers
SELECT c.first_name, c.last_name, 
COUNT(o.order_id) as total_order,
SUM(o.total_amount) as total_spent
FROM ecommerce-analytics-482417.Ecommerce_db.customers c
LEFT JOIN ecommerce-analytics-482417.Ecommerce_db.order o ON o.customer_id=c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

-- All orders of customers
SELECT o.order_id, o.order_date, o.total_amount, o.status
FROM ecommerce-analytics-482417.Ecommerce_db.order o
WHERE o.customer_id=1;

-- Customers whoes order more than 2
SELECT c.first_name, c.last_name, COUNT(o.order_id) as total_order
FROM ecommerce-analytics-482417.Ecommerce_db.customers c
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.order o on o.customer_id=c.customer_id
GROUP BY c.first_name, c.last_name
HAVING total_order >= 2
ORDER BY total_order DESC;

-- Products whose never sales
SELECT product_id, product_name, price
FROM ecommerce-analytics-482417.Ecommerce_db.products p
WHERE product_id is NULL ;

--Products that have never been ordered
SELECT p.product_name, p.price, p.stock_quantity, c.category_name
FROM ecommerce-analytics-482417.Ecommerce_db.products p
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.categories c ON p.category_id = c.category_id
LEFT JOIN ecommerce-analytics-482417.Ecommerce_db.order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
