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
    WHEN LEN(email) > 25 THEN LOWER(first_name,1)