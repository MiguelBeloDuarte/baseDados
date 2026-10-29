-- Matéria Semana 4 --
SELECT COUNT(*) AS '# Produtos' FROM production.products p
SELECT MAX(quantity) AS 'Máxima Quantidade' FROM sales.order_items o
SELECT MAX(list_price) AS 'Preço Mínimo' FROM production.products p
SELECT MIN(list_price) AS 'Preço Mínimo' FROM production.products p
SELECT MIN(list_price) AS 'Preço Mínimo', AVG(list_price) AS 'Preço Médio', MAX(list_price) AS 'Preço Máximo' FROM production.products p
SELECT MIN(discount) AS 'Desconto Mínimo', AVG(discount) AS 'Desconto Médio', MAX(discount) AS 'Desconto Máximo' FROM sales.order_items o

SELECT SUM(list_price) AS 'Vendas (Total)' FROM sales.order_items o

SELECT product_id, MIN(discount) AS 'Desconto Mínimo', AVG(discount) AS 'Desconto Médio', MAX(discount) AS 'Desconto Máximo'
FROM sales.order_items o 
GROUP BY product_id ORDER BY 1
SELECT item_id, MIN(discount) AS 'Desconto Mínimo', AVG(discount) AS 'Desconto Médio', MAX(discount) AS 'Desconto Máximo'
FROM sales.order_items o 
GROUP BY item_id
HAVING AVG(discount)  > 0.106
SELECT model_year AS 'Ano', COUNT(product_name) AS '# Produtos', MIN(list_price) AS 'Preços Anuais - Mínimo', AVG(list_price) AS 'Preços Anuais - Médio', MAX(list_price) AS 'Preços Anuais - Máximo' 
FROM production.products p
GROUP BY model_year
HAVING  model_year IN (2017, 2019)

SELECT * FROM sys.databases
CREATE DATABASE BikeStoresPlus
SELECT * FROM sys.databases

SELECT * FROM sys.schemas WHERE name NOT LIKE 'db%'
SELECT * FROM sys.schemas WHERE name NOT LIKE 'db%'

USE BikeStoresPlus
CREATE TABLE marketing.products (
    product_id INT,
    product_name VARCHAR (255) 
)
USE BikeStoresPlus
CREATE TABLE analytics.products (
    product_id INT IDENTITY (1, 1) PRIMARY KEY,
    product_name VARCHAR (255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DECIMAL (10, 2) NOT NULL,
);
USE BikeStoresPlus
SELECT * FROM sys.tables

-- Exercício 1 --
CREATE DATABASE BikeStoresAnalytics

CREATE SCHEMA metrics
CREATE SCHEMA events

CREATE TABLE metrics.indicators (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255) UNIQUE,
    description VARCHAR(255),
    val INT CHECK(val > 20),
    dt DATETIME
);

CREATE TABLE events.messages (
    id INT IDENTITY(1,1) PRIMARY KEY,
    message VARCHAR(255) DEFAULT 'General Event',
    dt DATETIME
);

INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_1', 'Category_1', 'Description', 21, GETDATE())
INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_2', 'Category_2', 'Description', 21, GETDATE())
INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_3', 'Category_3', 'Description', 21, GETDATE())
INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_4', 'Category_4', 'Description', 21, GETDATE())
INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_5', 'Category_5', 'Description', 21, GETDATE())
INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_6', 'Category_6', 'Description', 21, GETDATE())
INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_7', 'Category_7', 'Description', 21, GETDATE())
INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_8', 'Category_8', 'Description', 21, GETDATE())
INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_9', 'Category_9', 'Description', 21, GETDATE())
INSERT INTO metrics.indicators(name, category, description, val, dt) VALUES ('indicator_10', 'Category_10', 'Description', 21, GETDATE())

INSERT INTO events.messages(message, dt) VALUES ('Message for event 1', GETDATE())
INSERT INTO events.messages(message, dt) VALUES ('Message for event 2', GETDATE())
INSERT INTO events.messages(message, dt) VALUES ('Message for event 3', GETDATE())
INSERT INTO events.messages(message, dt) VALUES ('Message for event 4', GETDATE())
INSERT INTO events.messages(message, dt) VALUES ('Message for event 5', GETDATE())
INSERT INTO events.messages(message, dt) VALUES ('Message for event 6', GETDATE())
INSERT INTO events.messages(message, dt) VALUES ('Message for event 7', GETDATE())
INSERT INTO events.messages(message, dt) VALUES ('Message for event 8', GETDATE())
INSERT INTO events.messages(message, dt) VALUES ('Message for event 9', GETDATE())
INSERT INTO events.messages(message, dt) VALUES ('Message for event 10', GETDATE())