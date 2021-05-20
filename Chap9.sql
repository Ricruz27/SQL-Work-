REM: Ricky Cruz 
REM: Chapter 9

REM: Hands-on Assignment 

#1

SELECT b.title, p.contact, p.phone
FROM books b, Publisher p
Where b.pubid = p.pubid
Order BY p.pubid;

#1 JOIN 

SELECT b.title, p.contact, p.phone
FROM books b JOIN Publisher p 
USING (PUBID);

#2

SELECT c.firstname,c.lastname,o.order#
FROM customers c, orders o
WHERE c.customer# = o.customer#
AND o.shipdate IS NULL
ORDER BY o.orderdate;

#2 JOIN
SELECT c.firstname,c.lastname,o.order#
FROM customers c JOIN orders o
USING (CUSTOMER#)
WHERE o.shipdate IS NULL
ORDER BY o.orderdate;

#3

SELECT c.customer#, c.firstname, c.lastname
FROM customers c,orders o, orderitems oi, books b
WHERE c.customer# = o.customer#
AND o.order# = oi.order#
AND oi.isbn = b.isbn
AND b.category = 'COMPUTER'
AND c.state = 'FL';

#3 Join 

SELECT customer#, c.firstname, c.lastname
FROM customers c JOIN orders o USING (customer#)
JOIN orderitems oi USING (order#)
JOIN books b USING (isbn)
WHERE b.category = 'COMPUTER'
AND c.state = 'FL';

#7

SELECT p.gift
FROM books b, promotion p
WHERE b.retail BETWEEN p.minretail AND p.maxretail
AND b.title = 'SHORTEST POEMS';

#7 JOIN 
SELECT p.gift
FROM books b JOIN promotion p
ON b.retail BETWEEN p.minretail AND p.maxretail
WHERE b.title = 'SHORTEST POEMS'

#8
SELECT a.Lname, a.Fname, b.title
FROM customers c, orders o, orderitems oi,books b, bookauthor ba, author a
WHERE c.customer# = o.customer#
AND c.firstname = 'BECCA'
AND c.lastname = 'NELSON'
AND o.order# = oi.order#
AND oi.isbn = b.isbn
AND b.isbn = ba.isbn
AND ba.authorid = a.authorid;

#8 JOIN 

SELECT a.Lname, a.Fname, b.title
FROM customers c JOIN orders o USING (customer#)
JOIN orderitems oi USING (order#)
JOIN books b USING (isbn)
JOIN bookauthor ba USING (isbn)
JOIN author a USING (authorid)
WHERE c.firstname = 'BECCA'
AND c.lastname = 'NELSON';

REM: Advanced Challenge 

#1
SELECT b.title, pb.name,(b.retail-b.cost)"profit", p.gift
FROM books b JOIN publisher pb USING (pubid)
JOIN promotion p ON b.retail BETWEEN p.minretail and p.maxretail
ORDER BY "profit" ;

#2
SELECT isbn
FROM books
MINUS
SELECT isbn
from orderitems

