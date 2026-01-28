--All customers details 
SELECT * FROM ecommerce-analytics-482417.Ecommerce_db.customers;

--All customers name and email details
SELECT first_name, last_name, email FROM ecommerce-analytics-482417.Ecommerce_db.customers; 

--Customers of Mumbai city
SELECT first_name, last_name, city FROM ecommerce-analytics-482417.Ecommerce_db.customers
WHERE city='Mumbai'; 

--Customers name in alphabetically
SELECT first_name, last_name FROM ecommerce-analytics-482417.Ecommerce_db.customers
ORDER BY first_name ASC;

--First 10 customers name
SELECT first_name, last_name, email FROM ecommerce-analytics-482417.Ecommerce_db.customers 
LIMIT 10;

-- All products and price
SELECT product_name, price, stock_quantity FROM ecommerce-analytics-482417.Ecommerce_db.products
ORDER BY price DESC;

-- All products name whose price less than 1000
SELECT product_name, price, stock_quantity FROM ecommerce-analytics-482417.Ecommerce_db.products
WHERE price<1000 order by price DESC;

-- All products with less than 50 items in stock
SELECT product_name, stock_quantity, price FROM ecommerce-analytics-482417.Ecommerce_db.products
WHERE stock_quantity < 50 
ORDER BY stock_quantity ASC;

-- All delivered order
SELECT order_id, customer_id, order_date, total_amount, status FROM ecommerce-analytics-482417.Ecommerce_db.order
WHERE status='Delivered';

-- Order of June 2024
SELECT order_id, customer_id, order_date, total_amount, status FROM ecommerce-analytics-482417.Ecommerce_db.order
WHERE order_date >= '2024-06-01' AND order_date <= '2024-06-30';

