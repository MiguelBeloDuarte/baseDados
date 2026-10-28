-- Matéria Semana 3 --
SELECT * FROM information_schema.TABLES t WHERE t.TABLE_SCHEMA = 'production';
SELECT * FROM information_schema.TABLES t WHERE t.TABLE_SCHEMA = 'sales';

SELECT * FROM sys.tables

SELECT * FROM information_schema.COLUMNS c WHERE c.TABLE_NAME = 'products';
SELECT * FROM information_schema.COLUMNS c WHERE c.TABLE_NAME = 'customers';

-- Exercício 2 --
SET IDENTITY_INSERT production.brands ON; 
INSERT INTO production.brands(brand_id,brand_name) VALUES (10, 'Biklas Turbo')
SET IDENTITY_INSERT production.brands OFF;

SET IDENTITY_INSERT production.categories ON; 
INSERT INTO production.categories(category_id,category_name) VALUES (8, 'Hybrid Bikes')
SET IDENTITY_INSERT production.categories OFF; 

SET IDENTITY_INSERT sales.customers ON; 
INSERT INTO sales.customers(customer_id,first_name, last_name, phone, email, street, city, state, zip_code) VALUES (1450, 'João','Caldeira','(351) 21 1234567','john@bikes.shop','Rua dos Ciclistas','Lisboa','LX','1500')
SET IDENTITY_INSERT sales.customers OFF; 

SET IDENTITY_INSERT sales.stores ON; 
INSERT INTO sales.stores(store_id, store_name, phone, email, street, city, state, zip_code ) VALUES (4,'Lisboa Biklas','(351) 21 7654321','biklas@bikes.shop','Rua das Bicicletas','Lisboa','LX','15000')
SET IDENTITY_INSERT sales.stores OFF;

-- Exercício 3 --
UPDATE production.brands SET brand_name = 'Biklas Turbo Extreme Radical' WHERE brand_id = 10

UPDATE production.categories SET category_name = 'Hybrid Bikes + Electric Boost' WHERE category_id = 8

UPDATE sales.customers SET email = 'joao.caldeira@bikes.shop', street = 'Rua dos Desportos' WHERE customer_id = 1450

UPDATE sales.stores SET store_name = 'Lisboa Super Biklas', phone = '(351) 21 4444444' WHERE store_id = 4

-- Exercício 4 --
DELETE FROM production.brands WHERE brand_name = 'Biklas Turbo Extreme Radical'

DELETE FROM production.categories WHERE category_id = 8

DELETE FROM sales.customers WHERE phone = '(351) 21 1234567'

DELETE FROM sales.stores WHERE city = 'Lisboa'