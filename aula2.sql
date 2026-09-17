SELECT * FROM sales.stores
SELECT brand_name FROM production.brands
SELECT customer_id, first_name, last_name FROM sales.customers WHERE city = 'Houston'
SELECT * FROM sales.customers WHERE state = 'TX' OR state = 'CA'
SELECT * FROM production.products WHERE list_price > 1500
SELECT product_name FROM production.products WHERE model_year > 2017 AND list_price < 1000
SELECT DISTINCT product_name FROM production.products WHERE model_year = 2017 OR model_year = 2018 AND list_price < 1250 AND list_price > 750
SELECT * FROM production.products WHERE list_price = (SELECT max(list_price) FROM production.products)
SELECT list_price = avg(list_price) FROM production.products