-- 1. Get the names and the quantities in stock for each product.

SELECT DISTINCT(productid), productname, quantityperunit, unitsinstock
FROM products
ORDER BY productid, productname;


-- 2. Get a list of current products (Product ID and name).
SELECT  productid, productname
FROM products
ORDER BY productid, productname;


-- 3. Get a list of the most and least expensive products (name and unitprice).
SELECT  productid, productname, unitprice
FROM products
ORDER BY unitprice LIMIT 20;

SELECT  productid, productname, unitprice
FROM products
ORDER BY unitprice DESC LIMIT 20;


-- 4. Get products that cost less than $20.
SELECT  productid, productname, unitprice
FROM products
WHERE unitprice < 20 ORDER BY unitprice DESC;


-- 5. Get products that cost between $15 and $25.
SELECT  productid, productname, unitprice
FROM products
WHERE unitprice BETWEEN 15 AND 25 ORDER BY unitprice DESC;


-- 6.Get products above average price.
SELECT productname, unitprice
FROM products
WHERE unitprice >
	(SELECT AVG(unitprice) 
	FROM products);


-- 7. Find the ten most expensive products.
SELECT  productid, productname, unitprice
FROM products
ORDER BY unitprice DESC LIMIT 10;


-- 8. Get a list of discontinued products (Product ID and name).
SELECT  productid, productname, discontinued
FROM products
WHERE discontinued = 1;


-- 9. Count current and discontinued products.
SELECT COUNT(productid) 
FROM products
WHERE discontinued =0;

SELECT COUNT(productid) 
FROM products
WHERE discontinued =1;


--10. Find products with less units in stock than the quantity on order.

SELECT  p.productid, p.productname, p.unitsinstock, p.unitsonorder
FROM products AS p
JOIN order_details AS od ON p.productid = od.productid 
WHERE p.unitsinstock < p.unitsonorder;


-- 11. Find the customer who had the highest order amount

SELECT c.customerid, c.companyname, c.country, od.quantity
FROM customers AS c ∏
JOIN orders AS o ON c.customerid = o.customerid
JOIN order_details AS od ON o.orderid = od.orderid
ORDER BY od.quantity DESC LIMIT 1;


-- 12. Get orders for a given employee and the according customer
SELECT o.orderid, o.orderdate, e.employeeid, e.lastname, e.firstname, e.city, c.customerid, c.companyname, c.city
FROM employees as e
 
JOIN orders as o ON e.employeeid = o.employeeid 
JOIN customers as c ON o.customerid = c.customerid
WHERE e.lastname = 'Buchanan'; 



-- 13. Find the hiring age of each employee
SELECT employeeid, lastname, firstname, (hiredate - birthdate) AS age
FROM employees
ORDER BY age DESC; 


-- 14. Find top employees by customer order amount

SELECT e.lastname, e.firstname, e.city, c.companyname
FROM customers AS c
JOIN orders AS o ON c.customerid = o.customerid
JOIN employees AS e on e.employeeid = o.employeeid
JOIN order_details AS od ON o.orderid = od.orderid
ORDER BY od.quantity DESC LIMIT 10;


-- 15. What is the average weight of all the orders, delivered to each country?

SELECT c.country, AVG(o.freight) AS weight
FROM orders AS o
JOIN customers AS c ON o.customerid = c.customerid
GROUP BY c.country
ORDER BY weight;

--16. What is the total revenue delivered to each country?
-- i.e. total money made from all orders to each country

SELECT SUM(od.unitprice * od.quantity) AS revenue, c.country
FROM order_details AS od
JOIN orders AS o ON o.orderid = od.orderid
JOIN customers AS c ON o.customerid = c.customerid
GROUP BY c.country
ORDER BY revenue;


-- 17. Which of the customers never made any orders?

SELECT c.companyname, c.contactname, o.orderid, c.country
FROM customers AS c
LEFT JOIN orders as o ON c.customerid = o.customerid
WHERE o.orderid IS NULL;


-- 18: Display order transactions for all customers

SELECT c.customerid, c.companyname, c.contactname, o.orderid, o.orderdate, o.shippeddate, od.productid, od.unitprice, od.quantity 
FROM customers AS c 
LEFT JOIN orders AS o ON c.customerid = o.customerid
LEFT JOIN order_details as od ON o.orderid = od.orderid
ORDER BY c.customerid, o.orderid;


-- 19. Top employees by revenue
SELECT SUM(od.unitprice * od.quantity) AS revenue, e.lastname, e.firstname, e.city
FROM order_details AS od
JOIN orders AS o ON o.orderid = od.orderid
JOIN customers AS c ON o.customerid = c.customerid
JOIN employees AS e on e.employeeid = o.employeeid
GROUP BY e.lastname, e.firstname, e.city
ORDER BY revenue DESC LIMIT 5;


-- 20. Top 5 most ordererd products

SELECT  p.productid, p.productname, od.quantity
FROM products AS p
JOIN order_details AS od ON p.productid = od.productid 
ORDER BY od.quantity DESC LIMIT 5;

-- 21. Top 5 least ordered products

SELECT  p.productid, p.productname, od.quantity
FROM products AS p
JOIN order_details AS od ON p.productid = od.productid 
ORDER BY od.quantity LIMIT 5;


-- 22. Average unit price, grouped by supplier
SELECTbAVG(od.unitprice),bs.companyname
FROM order_details AS od
JOIN products AS p ON p.productid = od.productid
JOIN suppliers AS s ON p.supplierid = s.supplierid
GROUP BY s.companyname;


-- 23. Top 10 newest orders with revenue

SELECT c.companyname, p.productname, SUM(od.unitprice * od.quantity) AS revenue
FROM customers AS c 
JOIN orders AS o ON c.customerid = o.customerid
JOIN order_details as od ON o.orderid = od.orderid
JOIN products AS p ON p.productid = od.productid
GROUP BY c.companyname, p.productname, o.orderdate
ORDER BY o.orderdate DESC LIMIT 10;
