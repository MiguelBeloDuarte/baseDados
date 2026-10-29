-- Matéria Semana 5 --
SELECT * from production.categories
SELECT p.product_name, p.category_id, c.category_id, c.category_name
FROM production.products p
INNER JOIN production.categories c ON p.category_id = c.category_id
ORDER BY c.category_id DESC

SET IDENTITY_INSERT production.categories ON; 
INSERT INTO production.categories(category_id, category_name) VALUES (8, 'My New Category')
SET IDENTITY_INSERT production.categories OFF;
SELECT * from production.categories

SELECT p.product_name, p.category_id, c.category_id, c.category_name
FROM production.products p
INNER JOIN production.categories c ON p.category_id = c.category_id
ORDER BY c.category_id DESC

SELECT p.product_name, p.category_id, c.category_id, c.category_name
FROM production.products p
LEFT JOIN production.categories c ON p.category_id = c.category_id
ORDER BY c.category_id DESC

SELECT p.product_name, p.category_id, c.category_id, c.category_name
FROM production.products p
RIGHT JOIN production.categories c ON p.category_id = c.category_id
ORDER BY c.category_id DESC

-- Exercício 1 --
SELECT p.product_name, b.brand_name
FROM production.products p
INNER JOIN production.brands b ON p.brand_id = b.brand_id

-- Exercício 2 --
SELECT p.product_name, c.category_name, p.list_price
FROM production.products p
INNER JOIN production.categories c ON p.category_id = c.category_id

-- Exercício 3 --
SELECT p.product_name, SUM(s.quantity) AS total_encomendado
FROM production.products p
INNER JOIN sales.order_items s ON p.product_id = s.product_id
GROUP BY p.product_name;

-- Exercício 4 --
SELECT DISTINCT c.category_name, p.product_name
FROM production.categories c
INNER JOIN production.products p ON c.category_id = p.category_id
INNER JOIN sales.order_items s ON p.product_id = s.product_id
ORDER BY c.category_name, p.product_name;

-- Exercício 5 --
SELECT b.brand_name, AVG(p.list_price) AS preco_medio
FROM production.brands b
INNER JOIN production.products p ON b.brand_id = p.brand_id
GROUP BY b.brand_name;