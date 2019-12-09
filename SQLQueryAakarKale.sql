--Inner Join
SELECT Customer_T.CustomerID, CustomerName, OrderID
FROM Customer_T , Order_T
WHERE Customer_T.CustomerID = Order_T.CustomerID
ORDER BY ORDER_t.OrderID;

-- Other way to write the above query (By using the INNER JOIN keyword)
SELECT Customer_T.CustomerID, CustomerName, OrderID
FROM Customer_T
INNER JOIN Order_T
ON Customer_T.CustomerID = Order_T.CustomerID
ORDER BY ORDER_t.OrderID;


--Inner Join without WHERE clause

-- I think if you do not mention the where clause it just
-- identifies the common column in the two tables and matches it with it
SELECT Customer_T.CustomerID, CustomerName, OrderID
FROM Customer_T , Order_T
ORDER BY ORDER_t.OrderID;
-- Take a look on the differences between this and the output of above two queries.

--Inner Join...On
-- Same as 2nd Query above

SELECT Customer_T.CustomerID, CustomerName, OrderID
FROM Customer_T 
INNER JOIN Order_T 
ON Customer_T.CustomerID = Order_T.CustomerID
ORDER BY ORDER_t.OrderID;

--Left Outer Join
-- Same as Left Join
-- This will give you all the customers who are in the database which includes 
-- customers who have never placed an order EVER!!! (See the NULL values in OrderID)
SELECT Customer_T.CustomerID, CustomerName, OrderID
FROM Customer_T 
LEFT OUTER JOIN Order_T 
ON Customer_T.CustomerID = Order_T.CustomerID;

-- As you can see in the left join, we

--Right Outer Join
-- This will give you all the customers who have placed an order atleast once
SELECT Customer_T.CustomerID, CustomerName, OrderID
FROM Customer_T 
RIGHT OUTER JOIN Order_T 
ON Customer_T.CustomerID = Order_T.CustomerID;

--Full Outer Join
SELECT Customer_T.CustomerID, CustomerName, OrderID
FROM Customer_T FULL OUTER JOIN Order_T ON
 Customer_T.CustomerID = Order_T.CustomerID;
 -- In this case full outer join is equal to the left outer join.

--Join with AND clause
SELECT CustomerName, CustomerAddress, CustomerCity, CustomerState, Order_T.OrderID
FROM Customer_T, Order_T
WHERE Customer_T.CustomerID = Order_T.CustomerID 
AND OrderID between 20 and 40;

--Join with multiple tables
SELECT Customer_t.CustomerID, CustomerName, Order_t.OrderID, OrderDate, OrderedQuantity, ProductDescription, ProductStandardPrice, (OrderedQuantity*ProductStandardPrice) AS 'Total Sales'
FROM Customer_t, Order_t, Product_t, OrdeLline_t
WHERE Customer_t.CustomerID = Order_t.CustomerID
AND Order_t.OrderID = OrdeLline_t.OrderID
AND OrdeLline_t.ProductID = Product_t.ProductID
AND Order_t.OrderID = 24;


-------------------------------------------------------------------------------------------------------------




--Subquery
SELECT CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode
FROM Customer_T
WHERE CustomerID IN (SELECT CustomerID FROM Order_T WHERE OrderID = 22);

--Subquery using IN operator
SELECT CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode
FROM Customer_T
WHERE CustomerID IN (SELECT CustomerID FROM Order_T);
-- Just add NOT to the where statement above to find out the "Cheapos".

--Subquery using NOT IN operator
SELECT CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode
FROM Customer_T
WHERE CustomerID NOT IN 
(SELECT CustomerID FROM Order_T, OrdeLline_t, Product_t
	WHERE Order_t.OrderID = OrdeLline_t.OrderID
	AND OrdeLline_t.ProductID = Product_t.ProductID
	AND ProductDescription LIKE '%Computer Desk'
);

--Subquery using > operator
SELECT ProductDescription, ProductStandardPrice 
FROM Product_t
WHERE ProductStandardPrice > (SELECT AVG(ProductStandardPrice) FROM Product_t);

--Subquery using Derived Tables
-- Try to dwell on this one
SELECT ProductDescription, ProductStandardPrice, AvgPrice
FROM (SELECT AVG(ProductStandardPrice) FROM Product_t) Derived_t (AvgPrice), Product_t
WHERE ProductStandardPrice > AvgPrice;

------------------------------------- PRACTICE QUERIES --------------------------------------------------
-- Refer the Doc File on your laptop and start solving ASAP..... (Total 24 Queries)

-- 1.	Change the Order Date of OrderID 32 to October 21, 2008

UPDATE Order_T
SET OrderDate = '10-21-2008'
WHERE OrderID = 32;
-- Always put the date in the format shown above when you want to update, 
-- also keep in mind to put it in inverted commas.


-- 2. Display OrderID and Ordered Quantity of Product ID 4

SELECT ProductID, OrderID, OrderedQuantity
FROM OrdeLline_T
WHERE ProductID = 4;
-- Here you learned to check the data in each and every table and it's columns carefully 
-- before starting execution of any query.


-- 3. Display OrderID, ProductID, and Ordered Quantity where Ordered Quantity is 1 or 3 or 5.

SELECT OrderID, ProductID, OrderedQuantity
FROM OrdeLline_T
WHERE OrderedQuantity = 1 or OrderedQuantity = 3 or OrderedQuantity = 5
ORDER BY OrderedQuantity;
-- Here you learned that there is a better way to execute this query, --->  WHERE OrderedQuantity IN (1,3,5)


-- 4. Display ProductID, ProductFinish, and ProductDescription for ProductFinish ending with ‘ak’

 SELECT  ProductID, ProductFinish, ProductDescription
 FROM Product_T
 WHERE ProductFinish LIKE '%ak';

 -- 5. Display all orders not placed by Customer ID 1

 SELECT *
 FROM Order_T
 WHERE CustomerID <> 1
 ORDER BY CustomerID;


-- 6. Display all orders placed by Customer ID 1 or orders placed after October 22, 2008

SELECT *
FROM Order_T
WHERE CustomerID = 1 OR OrderDate > '2008-10-22'

-- Shown below is the difference betweeen or/and on the result...
SELECT *
FROM Order_T
WHERE CustomerID = 1 AND OrderDate > '2008-10-22'




-- 7. Display all orders not placed by Customer ID 1 or 3 or 5 and order date after October 24, 2008

SELECT *
FROM Order_T
WHERE CustomerID NOT IN(1,3,5) AND OrderDate > '2008-10-24'


-- 8. Select all orders whose Ordered Quantity is between 3 and 5

SELECT *
FROM OrdeLline_T
WHERE OrderedQuantity BETWEEN 3 and 5
ORDER BY OrderedQuantity;


-- 9. Count all ProductIDs whose standard price is more than 375 and name it as “More than 375”.

SELECT COUNT(ProductID) as [More Than 375]
FROM Product_T
WHERE ProductStandardPrice > 375;


-- 10.	Find the average of Product Standard Price and name it as “Avg Price”.

SELECT AVG(ProductStandardPrice) AS [Avg Price]
FROM Product_T


-- 11. Reorder the OrderLine table by ProductID in ascending order and Ordered Quantity in descending order.

SELECT *
FROM OrdeLline_T
ORDER BY ProductID, OrderedQuantity DESC
-- Here you learned how to arrange two columns according to the requirement



-- 12.	Display ProductID and sum of Ordered Quantity as “Total ordered” categorized by ProductID

SELECT ProductID , SUM(OrderedQuantity) AS [Total Ordered]
FROM OrdeLline_T
GROUP BY ProductID;


-- 13.	Display OrderID and count of Ordered Quantity as “Total Ordered” 
--      categorized by OrderID where “Total Ordered” is more than 1.

SELECT OrderID, COUNT(OrderedQuantity) as [Total Ordered]
FROM OrdeLline_T
GROUP BY OrderID
HAVING COUNT(OrderedQuantity) > 1
-- Here why can't you use where in place of having ?????


-- 14.	Display the OrderID and the number of products ordered in each order. Name the product count as ‘Products Ordered’.

SELECT OrderID, COUNT(ProductID) as [Products Ordered]
FROM OrdeLline_T
GROUP BY OrderID
-- Here, I understood that you need to look at the table and try to make logical sense of what the question is trying to ask.


-- 15. Display CustomerID and total orders of the customers who submitted more than one orders.

SELECT CustomerID, COUNT(OrderID) as [Total Orders]
FROM Order_T
GROUP BY CustomerID
HAVING COUNT(OrderID) > 1

----------------------------------------------------ADVANCED SQL QUERIES----------------------------------------------------------

-- 16. Display ProductID, description, OrderID, and Ordered Quantity. Sort it by ProductID.

SELECT Product_T.ProductID, Product_T.ProductDescription, OrdeLline_T.OrderID, OrdeLline_T.OrderedQuantity
FROM Product_T,OrdeLline_T
-- WHERE Product_t.ProductID = OrdeLline_T.ProductID
ORDER BY ProductID

-- This was a very basic MISTAKE highlighted in GREEN.


-- 17.	Display the CustmerID and the sum of total quantity ordered by each customer. Name the sum as ‘Total Quantity’

SELECT Order_T.CustomerID, SUM(OrdeLline_T.OrderedQuantity) AS [Total Quantity]
FROM Order_T, OrdeLline_T
WHERE Order_T.OrderID = OrdeLline_T.OrderID
GROUP BY CustomerID
-- Well, luckily your approach is good but see the answer given by professor.

-- 18.	Display the CustmerID and the total amount spend by each customer. Name the sum as ‘Total Value’

SELECT CustomerID, SUM(OrderedQuantity*ProductStandardPrice) as [Total Value]
FROM Order_T,OrdeLline_T, Product_T
WHERE Order_T.OrderID = OrdeLline_T.OrderID AND
OrdeLline_T.ProductID = Product_T.ProductID
GROUP BY CustomerID

-- 19.	Display the ProductID and the number of customers who purchased that product.

SELECT ProductID, COUNT(CustomerID) as [Number Of Customers Who Purchased]
FROM Order_T, OrdeLline_T
WHERE Order_T.OrderID = OrdeLline_T.OrderID
GROUP BY ProductID
-- MAJOR BLUNDER, you did not think about grouping by the ProductID, instead you were dwelling over grouping by CustomerID & OrderID.
-- It is now a RULE that you have to GROUP BY the column other than the aggregate column in the SELECT statement, for example ProductID in this case.
-- Check all the GROUP BY examples above to verify this claim.


-- 20.	Display the CustomerID, and name of all customers who submitted more than 1 order.

SELECT Customer_T.CustomerId, CustomerName
FROM Customer_T, Order_T
WHERE Customer_T.CustomerId = Order_T.CustomerID
GROUP BY Customer_T.CustomerId, CustomerName
HAVING COUNT(OrderID)>1
-- YOU COULD NOT HAVE THOUGHT ABOUT THIS ONE. IT'S A SUB QUERY

-- Here's the answer..........
SELECT CustomerID, CustomerName
FROM Customer_T
WHERE CustomerID in 
(SELECT Order_T.CustomerID from Order_T
group by Order_T.CustomerID
having count(OrderID) > 1);



-- 21. Display the ProductID, product description, and standard price for all products which are part of more than 2 orders.

SELECT ProductID, ProductDescription, ProductStandardPrice
FROM Product_T
WHERE ProductID IN
(SELECT OrdeLline_T.ProductID FROM OrdeLline_T
GROUP BY OrdeLline_T.ProductID
HAVING COUNT(OrderID) > 2)


-- 22. Display the OrderID and OrderDate of the orders which does not contain product with product finish ‘Oak’.

SELECT OrderID, OrderDate
FROM Order_T
WHERE OrderID IN
(
    SELECT OrdeLline_T.OrderID
    FROM OrdeLline_T, Product_T
    WHERE OrdeLline_T.ProductID = Product_T.ProductID
    AND Product_T.ProductFinish NOT LIKE '%Oak'
    GROUP BY OrderID
)

-- Check for yourself the correct answer....below
SELECT OrderID, OrderDate
FROM Order_T
WHERE OrderID NOT IN
(
    SELECT OrdeLline_T.OrderID
    FROM OrdeLline_T, Product_T
    WHERE OrdeLline_T.ProductID = Product_T.ProductID
    AND Product_T.ProductFinish LIKE '%Oak'
)

-- One more question arises here, HOW DO YOU KNOW that you will need a SUBQUERY??????

-- 23. Display OrderID, Ordered quantity, and average quantity for all orders with ordered quantity more than the average.

SELECT OrderID, OrderedQuantity
FROM OrdeLline_T
WHERE OrderID IN 
(
    SELECT OrdelLine_T.OrderID
    FROM OrdeLline_T
    WHERE OrderedQuantity > AVG(OrderedQuantity)
    GROUP BY OrderID
)
-- You would have NEVER guessed the ANSWER
-- Here is the answer
SELECT DISTINCT OrderID, OrderedQuantity, AvgQty
FROM OrdeLline_T,
(SELECT AVG(OrderedQuantity) FROM OrdeLline_T) Temp_t (AvgQty)
WHERE OrderedQuantity - AvgQty > 0;



-- 24.	Display the OrderID, OrderDate of the order which has the maximum ordered quantity. 
--      Your query should also display the Maximum ordered quantity.

SELECT Order_T.OrderID, OrderDate, MAX(OrderedQuantity) AS [MAX Quantity]
FROM Order_T, OrdeLline_T
GROUP BY Order_T.OrderID, OrderDate
HAVING MAX(OrderedQuantity) > 10
WHERE OrderedQuantity IN
(
SELECT MAX(OrderedQuantity)
FROM OrdeLline_T
)
-- FAIL ATTEMPT

SELECT O.ORDERID,O.ORDERDATE, ORDEREDQUANTITY
FROM Order_T O, OrdeLline_T OL
WHERE O.ORDERID = OL.OrderID
AND OL.OrderedQuantity = (SELECT MAX(ORDEREDQUANTITY) AS  MAX_ODER_QTY FROM OrdeLline_T);

SELECT O.ORDERID,O.ORDERDATE,MAX(OL.OrderedQuantity) AS MAX_QTY
FROM Order_T O, OrdeLline_T OL
WHERE O.ORDERID = OL.OrderID
GROUP BY  O.ORDERID,O.ORDERDATE
HAVING MAX(OL.OrderedQuantity) = (SELECT MAX(ORDEREDQUANTITY) AS  MAX_ODER_QTY FROM OrdeLline_T);