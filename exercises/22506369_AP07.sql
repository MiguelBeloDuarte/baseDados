CREATE TABLE Customers (
 CustomerID INT PRIMARY KEY,
 Name NVARCHAR(50),
 Email NVARCHAR(50) );

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
OrderDate DATE,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) );

INSERT INTO Customers (CustomerID, Name, Email) VALUES (1, 'Pascual', 'pascual2014@gmail.com')
INSERT INTO Orders (OrderID, OrderDate, CustomerID) VALUES (58734756, '2025-03-24', 1)

SELECT * FROM Orders
SELECT * FROM Customers

SELECT Orders.OrderID, Customers.CustomerID, Customers.Name, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

----------------------------------------------------------------------------------------------------------

SELECT * FROM production.products
SELECT * FROM production.categories

SELECT production.products.category_id, production.products.product_name, production.categories.category_name, production.products.list_price
FROM production.products
INNER JOIN production.categories ON production.products.category_id=production.categories.category_id;

SELECT * FROM sales.orders
SELECT * FROM sales.customers

SELECT sales.orders.customer_id, sales.customers.first_name, sales.customers.last_name, sales.orders.order_id
FROM sales.orders
LEFT JOIN sales.customers ON sales.orders.customer_id=sales.customers.customer_id;