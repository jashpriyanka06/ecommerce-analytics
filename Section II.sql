--Total customers 
SELECT COUNT(*) total_customers FROM ecommerce-analytics-482417.Ecommerce_db.customers c;

--Total placed orders
SELECT COUNT(*) total_order FROM ecommerce-analytics-482417.Ecommerce_db.order o;

--Highest amount products
SELECT product_name,price FROM ecommerce-analytics-482417.Ecommerce_db.products
WHERE price=(SELECT MAX(price) FROM ecommerce-analytics-482417.Ecommerce_db.products);

--Lowest amount products
SELECT product_name, price FROM ecommerce-analytics-482417.Ecommerce_db.products
WHERE price = (SELECT MIN(price) FROM ecommerce-analytics-482417.Ecommerce_db.products);

--Maximum amount
select max(price) FROM ecommerce-analytics-482417.Ecommerce_db.products;

-- Average order value
SELECT AVG(total_amount) as avg_order_value FROM ecommerce-analytics-482417.Ecommerce_db.order;

-- Total revenue
SELECT SUM(total_amount) as total_revenue
FROM ecommerce-analytics-482417.Ecommerce_db.order
WHERE status != 'Cancelled';

-- Show products with category name
SELECT p.product_name, c.category_name
FROM ecommerce-analytics-482417.Ecommerce_db.products p
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.categories c ON p.category_id=c.category_id;

--Show customer details with order
SELECT c.first_name, c.last_name, c.email, c.city, c.state, o.order_id, o.order_date, o.total_amount, o.status
FROM ecommerce-analytics-482417.Ecommerce_db.customers c
INNER JOIN ecommerce-analytics-482417.Ecommerce_db.order o ON c.customer_id=o.customer_id;

--Show order_items with product details
SELECT p.product_name,oi.order_id, oi.quantity, oi.price
FROM ecommerce-analytics-482417.Ecommerce_db. products p
INNER JOIN ecommerce-analytics-482417.Ecommerce_db. order_items oi ON p.product_id =oi.product_id;
