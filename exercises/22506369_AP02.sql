-- exerc_1 --
SELECT * FROM sales.stores
SELECT brand_name FROM production.brands
SELECT customer_id, first_name, last_name FROM sales.customers WHERE city = 'Houston'
SELECT * FROM sales.customers WHERE state = 'TX' OR state = 'CA'
SELECT * FROM production.products WHERE list_price > 1500
SELECT product_name FROM production.products WHERE model_year > 2017 AND list_price < 1000
SELECT DISTINCT product_name FROM production.products WHERE model_year = 2017 OR model_year = 2018 AND list_price < 1250 AND list_price > 750
SELECT * FROM production.products WHERE list_price = (SELECT max(list_price) FROM production.products)
SELECT avg_price = avg(list_price) FROM production.products
SELECT total_products = count(product_name) FROM production.products
SELECT DISTINCT product_name FROM production.products
SELECT total_products = count(DISTINCT product_name) FROM production.products

-- exerc_2 --
SET IDENTITY_INSERT sales.stores ON;
INSERT INTO sales.stores(store_id,store_name,phone,email,street,city,state,zip_code) VALUES (4, 'Lisbon Bikes', '+351 213456789', 'lisbon@bikes.shop', '210 Rua Augusta', 'Lisbon', 'LX', 11000)
INSERT INTO sales.stores(store_id,store_name,email,street,city,state,zip_code) VALUES (5, 'Porto Bikes', 'porto@bikes.shop', '250 Rua de Santa Catarina', 'Porto', 'PO', 40000)
SET IDENTITY_INSERT sales.stores OFF;
SET IDENTITY_INSERT production.brands ON;
INSERT INTO production.brands(brand_id, brand_name) VALUES (10, 'Biklas')
INSERT INTO production.brands(brand_id, brand_name) VALUES (11, 'Lx Trotinetes')

-- exerc_3 --
UPDATE sales.stores SET phone = '+351 2121212121' WHERE store_id = 5
UPDATE production.brands SET brand_name = 'Lx Cycles' WHERE brand_id = 10
UPDATE production.brands SET brand_name = upper(brand_name) WHERE brand_id = 10

-- exerc_4 --
DELETE FROM sales.stores WHERE store_id = 4
DELETE FROM sales.stores WHERE store_id = 5
DELETE FROM production.brands WHERE brand_id = 10
DELETE FROM production.brands WHERE brand_id = 11