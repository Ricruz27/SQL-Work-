REM:Ricky Cruz 
REM: Chapter 8 


REM Drop JLDB.
 START C:/CTS2445/JLDB_Drop.sql;

REM excute JLDB_BUILD_8.
 START C:/CTS2445/JLDB_BUILD_8.sql;

REM Hands-On #4a.
 SELECT customer#, lastname, state
    FROM customers
    WHERE state = 'NJ'
    OR state = 'GA'
    ORDER BY lastname;

REM Hands-On #4b.
 SELECT customer#, lastname, state
    FROM customers
    WHERE state IN ('NJ','GA')
    ORDER BY lastname;

REM Hands-On #5a.
 SELECT order#, orderdate
    FROM orders
    WHERE orderdate = '01-APR-09'
    or orderdate < '01-APR-09';

REM Hands-On #5b.
 SELECT order#, orderdate
    FROM orders
    WHERE orderdate <= '01-APR-09';

REM Hands-On #6.
 SELECT lname, fname
    FROM author
    WHERE lname LIKE '%IN%'
    ORDER BY lname;

REM Hands-On #7.
 SELECT lastname, referred
    FROM customers
    WHERE referred IS NOT NULL;

REM Hands-On #9.
 SELECT isbn, title
    FROM books
    WHERE title LIKE '_A_N%'
    ORDER BY title DESC;

REM Hands-On #10a.
 SELECT title, pubdate
    FROM books
    where pubdate BETWEEN '01-JAN-05' AND '31-DEC-05'
    AND category = 'COMPUTER';

REM Hands-On #10b.
 SELECT title, pubdate
    FROM books
    WHERE pubdate >= '01-JAN-05' AND pubdate <= '31-DEC-05'
    AND category ='COMPUTER';

REM Hands-On #10c.
 SELECT title, pubdate
    FROM books
    WHERE pubdate LIKE '%-05'
    AND category ='COMPUTER';

REM Advanced Challenge #1.
 SELECT title, retail-cost profit
    FROM books
    WHERE retail-cost > 10.00
    ORDER BY profit DESC;

REM Advanced Challenge #2.
 SELECT title, category, PUBID, retail
    FROM books
    WHERE category IN ('COMPUTER', 'FAMILY LIFE')
    AND PUBID IN (1,3)
    AND retail > 45.00;