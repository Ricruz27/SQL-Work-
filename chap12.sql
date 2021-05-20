REM: RICKY CRUZ
REM: CHAPTER 12 

REM:HANDS-ON 

#1
SELECT title, retail
FROM books
WHERE retail <(SELECT AVG(retail)
FROM books);

#2
SELECT a.title, b.category, a.cost
FROM books a, (SELECT category, AVG(cost) averagecost
FROM books
GROUP BY category) b
WHERE a.category = b.category
AND a.cost < b.averagecost
ORDER BY a.category;

#7 

SELECT shipcity, shipstate
FROM orders
WHERE NVL(shipdate,SYSDATE)-orderdate =
(SELECT MAX(NVL(shipdate,SYSDATE)-orderdate)
FROM orders);

#8
SELECT customer#,customers.lastname, customers.firstname
FROM customers JOIN orders USING(customer#) JOIN orderitems USING(order#) JOIN books USING(isbn)
WHERE retail =
(SELECT MIN(retail)
FROM books)
ORDER BY lastname;

#9
SELECT COUNT(DISTINCT orders.customer#)Customer_Count
FROM orders JOIN orderitems USING(order#)
WHERE isbn IN
(SELECT isbn
FROM orderitems JOIN bookauthor USING(isbn)
JOIN author USING(authorid)
WHERE author.lname = 'AUSTIN'
AND author.fname = 'JAMES');

#10
SELECT title
FROM books
WHERE pubid =
(SELECT pubid
FROM books
WHERE title = 'THE WOK WAY TO COOK')AND TITLE NOT IN ('THE WOK WAY TO COOK');

REM: ADVANCE CHALLENGE 

#1
SELECT SUM(quantity*paideach)*.015 Surcharge
FROM orderitems;

#2
SELECT SUM(quantity*paideach)*.04 Uncollectible
FROM orderitems
WHERE order# IN (SELECT order#
FROM orderitems
GROUP BY order#
HAVING SUM (quantity *paideach)>
(SELECT AVG(SUM(quantity * paideach))
FROM orderitems
GROUP BY order#));
