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


-- Exercício 2 --


-- Exercício 3 --


-- Exercício 4 --


-- Exercício 5 --
