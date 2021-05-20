REM:Ricky Cruz
REM:Chapter 13

REM:Hands-On Assignment 
#1

CREATE VIEW contact
AS Select name "Publisher", contact, phone "Phone #"
FROM publisher;

SELECT
    *
FROM contact;

#2

CREATE OR REPLACE VIEW contact
AS Select name"Publisher", contact, phone "Phone #"
FROM publisher
WITH READ ONLY;


SELECT
    *
FROM contact;

DROP VIEW contact;

#5
CREATE VIEW reorderinfo
AS Select b.title, b.isbn, p.contact,p.phone
FROM books b JOIN publisher p USING (pubid);

SELECT
    *
FROM reorderinfo;

#10 
DROP VIEW reorderinfo;


REM: Advance Challenge 

SELECT title, qty"QTY", ROUND(profit,0) "PROFIT %"
FROM
(SELECT title, SUM(quantity) qty,((retail-cost)/cost*100) profit
FROM books JOIN orderitems USING(isbn)
GROUP BY title, ((retail-cost)/cost*100)
ORDER BY qty DESC)
Where ROWNUM <=5;