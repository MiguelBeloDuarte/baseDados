-- Matéria Semana 3.1 --
SELECT first_name AS Nome, last_name AS Apelido, phone AS Telefone, email AS 'Endereço Email' FROM sales.customers c

SELECT first_name AS Nome, last_name AS Apelido, phone AS Telefone, email AS 'Endereço Email' FROM sales.customers c WHERE c.phone IS NULL
SELECT first_name AS Nome, last_name AS Apelido, phone AS Telefone, email AS 'Endereço Email' FROM sales.customers c WHERE c.phone IS NOT NULL

SELECT CONCAT(first_name,' ',last_name) AS fullname, first_name, last_name, phone, email FROM sales.customers c WHERE c.phone IS  NULL
SELECT CONCAT(LOWER(first_name),' ',UPPER(last_name)) AS fullname, phone, email FROM sales.customers c WHERE c.phone IS  NULL
SELECT CONCAT(LEFT(first_name,1),'. ',last_name) AS customer_name, email, phone FROM sales.customers c WHERE c.phone IS  NULL
SELECT CONCAT(first_name,' ',LEFT(last_name,1),'.') AS customer_name, email, phone FROM sales.customers c WHERE c.phone IS  NULL

SELECT DISTINCT state AS 'Estado' FROM sales.customers c WHERE c.phone IS NULL order by 'Estado' ASC

SELECT product_name AS Produto, list_price AS 'Preço' FROM production.products p WHERE p.list_price BETWEEN 350 AND 850 ORDER BY 'Preço' DESC
SELECT product_name AS Produto, list_price AS 'Preço' FROM production.products p WHERE p.list_price IN (999.99,1999.99,2999.99) ORDER BY 'Preço' ASC
SELECT product_name AS Produto, list_price AS 'Preço' FROM production.products p WHERE p.product_name LIKE '%Fuel%'
SELECT product_name AS Produto, list_price AS 'Preço' FROM production.products p WHERE p.product_name LIKE 'Trek%'

-- Exercício 1 --
SELECT first_name, last_name, email, state, phone FROM sales.customers c WHERE c.phone IS NULL AND c.state = 'TX'
SELECT first_name, last_name, email, state, phone FROM sales.customers c WHERE c.phone IS NOT NULL AND c.state = 'CA'
SELECT * FROM sales.stores s WHERE s.zip_code IN (95060,75088)

SELECT first_name, last_name, email, phone FROM sales.staffs s WHERE s.email LIKE '%serrano%'
SELECT first_name, last_name, email, phone FROM sales.staffs s WHERE s.manager_id IS NULL
SELECT first_name, last_name, email, phone FROM sales.staffs s WHERE s.phone LIKE '%55'
SELECT first_name, last_name, email, phone FROM sales.staffs s WHERE s.first_name LIKE 'M%'

SELECT * FROM sales.orders o WHERE o.order_date BETWEEN '2016-01-01' AND '2016-01-15'
SELECT * FROM sales.orders o WHERE o.customer_id IN (541,1212,1326) AND LEFT(order_date,4) IN (2016,2017)

-- Exercício 2 --
SELECT CONCAT(first_name,' ',last_name) AS Nome, SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) AS 'Domínio', email AS 'Email'  FROM sales.customers