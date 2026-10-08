SELECT * FROM sys.databases
CREATE DATABASE BikeStoresPlus
USE BikeStoresPlus
SELECT * FROM INFORMATION_SCHEMA.TABLES
SELECT * FROM INFORMATION_SCHEMA.SCHEMATA

SELECT * FROM sys.schemas WHERE name NOT LIKE 'db%'

CREATE SCHEMA "marketing"
CREATE SCHEMA "analytics"
SELECT * FROM sys.schemas WHERE name NOT LIKE 'db%'

USE BikeStoresPlus
CREATE TABLE marketing.products (
    product_id INT,
    product_name VARCHAR (255)
)
SELECT * FROM marketing.products

SET IDENTITY_INSERT marketing.products ON;
INSERT INTO marketing.products(product_id, product_name) VALUES (1, 'pão')
INSERT INTO marketing.products(product_id, product_name) VALUES (2, 'fiambre')
INSERT INTO marketing.products(product_id, product_name) VALUES (3, 'queijo')
SET IDENTITY_INSERT marketing.products OFF;
SELECT * FROM marketing.products

CREATE TABLE analytics.products2 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR (255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DECIMAL (10,2) NOT NULL
)
SELECT * FROM analytics.products2

SET IDENTITY_INSERT analytics.products2 ON;
INSERT INTO analytics.products2(product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (1, 'pão', 325, 586, 2016, 2)
INSERT INTO analytics.products2(product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (2, 'fiambre', 439, 678, 2020, 3)
INSERT INTO analytics.products2(product_id, product_name, brand_id, category_id, model_year, list_price) VALUES (3, 'queijo', 234, 787, 2007, 3.2)
SET IDENTITY_INSERT analytics.products2 OFF;
SELECT * FROM analytics.products2

CREATE TABLE analytics.products3 (
    product_id INT IDENTITY (1,1) PRIMARY KEY,
    product_name VARCHAR (255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DECIMAL (10,2) NOT NULL
)
SELECT * FROM analytics.products3
INSERT INTO analytics.products3(product_name, brand_id, category_id, model_year, list_price) VALUES ('pão', 325, 586, 2016, 2)
INSERT INTO analytics.products3(product_name, brand_id, category_id, model_year, list_price) VALUES ('fiambre', 439, 678, 2020, 3)
INSERT INTO analytics.products3(product_name, brand_id, category_id, model_year, list_price) VALUES ('queijo', 234, 787, 2007, 3.2)
SELECT * FROM analytics.products3