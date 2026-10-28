-- Matéria Semana 2 --
SELECT * FROM production.products
SELECT product_name, model_year, list_price FROM production.products

SELECT * FROM production.categories
SET IDENTITY_INSERT production.categories ON; 
INSERT INTO production.categories(category_id,category_name) VALUES (8, 'Hybrid Bikes')
UPDATE production.categories SET category_name = 'Multi-Hybrid Bikes' WHERE category_id = 8
DELETE FROM production.categories WHERE category_id = 8

-- Exercício 1 --
SELECT * FROM sales.stores
SELECT brand_name FROM production.brands
SELECT customer_id, first_name, last_name FROM sales.customers WHERE city = 'Houston'
SELECT * FROM sales.customers WHERE state IN ('TX', 'CA')
SELECT product_name, list_price FROM production.products WHERE list_price > 1500
SELECT product_name FROM production.products WHERE model_year > 2017 AND list_price < 1000
SELECT DISTINCT product_name FROM production.products WHERE model_year IN (2017, 2018) AND list_price BETWEEN 750 AND 1250
SELECT * FROM production.products WHERE list_price = (SELECT MAX(list_price) FROM production.products)
SELECT avg_price = avg(list_price) FROM production.products
SELECT total_products = count(product_name) FROM production.products
SELECT DISTINCT product_name FROM production.products
SELECT dif_products = count(DISTINCT product_name) FROM production.products

-- Exercício 2 --
SELECT * FROM sales.stores
SET IDENTITY_INSERT sales.stores ON;
INSERT INTO sales.stores(store_id, store_name, phone, email, street, city, state, zip_code) VALUES (4, 'Lisbon Bikes', '(351) 261432564', 'lisbikes@bikes.shop', 'Rua da Bica', 'Lisboa', 'LX', 15000)
INSERT INTO sales.stores(store_id, store_name, phone, email, street, city, state, zip_code) VALUES (5, 'Porto Bikes', '', 'prtbikes@bikes.shop', 'Rua do Lelo', 'Porto', 'PT', 20000)
SET IDENTITY_INSERT sales.stores OFF;
SELECT * FROM production.brands
SET IDENTITY_INSERT production.brands ON;
INSERT INTO production.brands(brand_id, brand_name) VALUES (10, 'Bicletas')
INSERT INTO production.brands(brand_id, brand_name) VALUES (11, 'Lx Trotinetes')
SET IDENTITY_INSERT production.brands OFF;

-- Exercício 3 --
UPDATE sales.stores SET phone = '(351) 2121212121' WHERE store_id = 5
UPDATE production.brands SET brand_name = 'Lx Cycles' WHERE brand_name = 'Bicletas'
UPDATE production.brands SET brand_name = upper(brand_name) WHERE brand_name = 'Lx Cycles'

-- Exercício 4 --
DELETE FROM sales.stores WHERE store_id IN (4,5)
DELETE FROM production.brands WHERE brand_name LIKE 'Lx%'