-- exerc_2 --
SET IDENTITY_INSERT production.brands ON;
INSERT INTO production.brands(brand_id, brand_name) VALUES (10, 'Barreirike')
SET IDENTITY_INSERT production.brands OFF;

SET IDENTITY_INSERT production.categories ON;
INSERT INTO production.categories(category_id, category_name) VALUES (8, 'Barreiro Bikes')
SET IDENTITY_INSERT production.categories OFF;

SET IDENTITY_INSERT sales.customers ON;
INSERT INTO sales.customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code) VALUES (1446, 'Tiago', 'Costa', '+351 987654321', 'tiagocosta@gmail.com', 'Rua Augusta', 'Barreiro', 'ST', '28300')
SET IDENTITY_INSERT sales.customers OFF;

SET IDENTITY_INSERT sales.stores ON;
INSERT INTO sales.stores(store_id, store_name, phone, email, street, city, state, zip_code) VALUES (4, 'Barreiro Bikes', '261543721', 'barreiro@bikes.shop', 'Rua Augusta', 'Barreiro', 'ST', '28300')
SET IDENTITY_INSERT sales.stores OFF;

SELECT * FROM production.brands WHERE brand_id = 10
SELECT * FROM production.categories WHERE category_id = 8
SELECT * FROM sales.customers WHERE customer_id = 1446
SELECT * FROM sales.stores WHERE store_id = 4

-- exerc_3 --
UPDATE production.brands SET brand_name = 'Bareirike' WHERE brand_id = 10
UPDATE production.categories SET category_name = 'Bareiro Bikes' WHERE category_id = 8
UPDATE sales.customers SET phone = '+351 968669872' WHERE customer_id = 1446
UPDATE sales.stores SET phone = '212121212' WHERE store_id = 4

SELECT * FROM production.brands WHERE brand_id = 10
SELECT * FROM production.categories WHERE category_id = 8
SELECT * FROM sales.customers WHERE customer_id = 1446
SELECT * FROM sales.stores WHERE store_id = 4

-- exerc_4 --
DELETE FROM production.brands WHERE brand_id = 10
DELETE FROM production.categories WHERE category_id = 8
DELETE FROM sales.customers WHERE customer_id = 1446
DELETE FROM sales.stores WHERE store_id = 4

SELECT * FROM production.brands WHERE brand_id = 10
SELECT * FROM production.categories WHERE category_id = 8
SELECT * FROM sales.customers WHERE customer_id = 1446
SELECT * FROM sales.stores WHERE store_id = 4