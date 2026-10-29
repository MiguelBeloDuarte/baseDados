-- Matéria Semana 3.2 --
SELECT COUNT(*) AS '# Produtos' FROM production.products p
SELECT MAX(quantity) AS 'Máxima Quantidade' FROM sales.order_items o
SELECT MAX(list_price) AS 'Preço Máximo' FROM production.products p
SELECT MIN(list_price) AS 'Preço Mínimo' FROM production.products p
SELECT MIN(list_price) AS 'Preço Mínimo', AVG(list_price) AS 'Preço Médio', MAX(list_price) AS 'Preço Máximo' FROM production.products p
SELECT MIN(discount) AS 'Desconto Mínimo', AVG(discount) AS 'Desconto Médio', MAX(discount) AS 'Desconto Máximo' FROM sales.order_items o

SELECT SUM(list_price) AS 'Vendas (Total)' FROM sales.order_items o

SELECT * from sales.customers c WHERE c.last_name LIKE '[j-m]%'
SELECT * from sales.customers c WHERE c.last_name LIKE '_[ou]%';
SELECT product_name AS Produto, list_price AS 'Preço',
CASE
    WHEN list_price < 500 THEN 'Muito Barato'
END AS 'Classificação'
FROM production.products p

SELECT product_id, MIN(discount) AS 'Desconto Mínimo', AVG(discount) AS 'Desconto Médio', MAX(discount) AS 'Desconto Máximo'
FROM sales.order_items o 
GROUP BY product_id ORDER BY 1
SELECT item_id, MIN(discount) AS 'Desconto Mínimo', AVG(discount) AS 'Desconto Médio', MAX(discount) AS 'Desconto Máximo'
FROM sales.order_items o 
GROUP BY item_id
HAVING AVG(discount) > 0.106
SELECT model_year AS 'Ano', COUNT(product_name) AS '# Produtos', MIN(list_price) AS 'Preços Anuais - Mínimo', AVG(list_price) AS 'Preços Anuais - Médio', MAX(list_price) AS 'Preços Anuais - Máximo' 
FROM production.products p
GROUP BY model_year
HAVING  model_year IN (2017, 2019)

-- Exercício 1 --
SELECT first_name AS Nome, last_name AS Apelido, email AS Email,
CASE
    WHEN LEN(email) > 25 THEN LOWER(CONCAT(LEFT(first_name,1),'.',last_name,'@',SUBSTRING(email,CHARINDEX('@',email) + 1,LEN(email))))
    ELSE email
END AS 'Novo Email'
FROM sales.customers

UPDATE sales.customers SET email = LOWER(CONCAT(LEFT(first_name,1),'.',last_name,'@',SUBSTRING(email,CHARINDEX('@',email) + 1,LEN(email)))) WHERE LEN(email) > 25

UPDATE sales.customers SET email = LOWER(CONCAT(first_name,'.',last_name,'@',SUBSTRING(email,CHARINDEX('@',email) + 1,LEN(email))))

SELECT product_name, list_price,
CASE
    WHEN list_price > 4000 THEN '50%'
    WHEN list_price > 3000 THEN '23%'
    WHEN list_price > 2000 THEN '13%'
    WHEN list_price > 1000 THEN '6%'
    ELSE '0%'
END AS '% IVA'
FROM production.products