-- Matéria Semana 4.1 --
SELECT customer_id, first_name, last_name, city, state INTO sales.AllCustomers
FROM sales.customers;
SELECT * FROM sales.AllCustomers

SELECT * INTO sales.TexasCustomers
FROM sales.customers
WHERE state = 'TX'
SELECT * FROM sales.TexasCustomers

INSERT INTO sales.ExistingTable
SELECT * FROM sales.customers;

INSERT INTO sales.ExistingTable
SELECT * FROM sales.customers
WHERE state = 'TX'

sp_helpindex 'production.brands'
sp_helpindex 'production.products'
sp_helpindex 'production.stocks'
sp_helpindex 'sales.stores'
sp_helpindex 'sales.customers'

CREATE INDEX idx_lastname ON sales.customers(last_name);
sp_helpindex 'sales.customers'
CREATE INDEX idx_fullname ON sales.customers(first_name, last_name);
sp_helpindex 'sales.customers'

CREATE VIEW sales.texas_customers AS SELECT * FROM sales.customers WHERE state = 'TX';
SELECT 
    OBJECT_SCHEMA_NAME(v.object_id) schema_name,
    v.name
FROM 
    sys.views as v;
SELECT * FROM sales.texas_customers

CREATE VIEW sales.product_price_above_average AS
SELECT product_name, list_price
FROM production.products
WHERE list_price > (SELECT AVG(list_price) FROM production.products);
SELECT * FROM sales.product_price_above_average

-- Exercício 1 --
SELECT customer_id, first_name, last_name, city, state
INTO sales.customers_short
FROM sales.customers
WHERE first_name LIKE '[A-DX-Z]%';

-- Exercício 2 --
CREATE VIEW sales.customers_rich_states AS
SELECT first_name, last_name, email
FROM sales.customers
WHERE state in ('TX','CA');

-- Exercício 3 --
CREATE VIEW sales.customers_special AS
SELECT *
FROM sales.customers
WHERE last_name LIKE '[abt]%' AND (city LIKE '%o' OR city LIKE '%on');

-- Exercício 4 --
CREATE VIEW sales.last_trimester AS
SELECT *
FROM sales.orders
WHERE MONTH(order_date) > 9;

-- Exercício 5 --
CREATE VIEW sales.second_semester AS
SELECT *
FROM sales.orders
WHERE MONTH(order_date) > 6 AND YEAR(order_date) IN (2016,2018) AND YEAR(shipped_date) <> YEAR(order_date);

-- Exercício 6 --
CREATE VIEW sales.long_emails AS
SELECT *
FROM sales.customers
WHERE LEN(email) > 20;

-- Exercício 7 --
SELECT * FROM sales.customers_short
SELECT * FROM sales.customers_rich_states
SELECT * FROM sales.customers_special
SELECT * FROM sales.last_trimester
SELECT * FROM sales.second_semester
SELECT * FROM sales.long_emails