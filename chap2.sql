REM Ricky Cruz 
REM Chapter 2 

REM Hands-On #4
SELECT customer# ,city , state
FROM customers;

REM Hands-On #5
SELECT name, contact AS "Contact Person", phone
FROM Publisher;

REM Hands-On #6
SELECT DISTINCT category
FROM books;

REM Hands-On #7
SELECT DISTINCT customer#
FROM orders;

REM Hands-On #8
SELECT category, title
FROM books;

Advanced Challenge 
#1
SELECT lastname || ',' || firstname "Name" ,address, city|| ',' ||state "Location", zip
FROM customers;

#2
SELECT title, (((retail - cost)/cost)*100) AS "Profit%"
FROM books;
