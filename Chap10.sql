REM : Ricky Cruz 
REM: Chapter 10 

REM: Hands-On Assignment 

#2

SELECT lastname, firstname,NVL2(referred,'Refereed', 'Not Referred')"referred?"
    
FROM customers;

#4

SELECT title,retail,cost,ROUND((retail-cost)/cost*100,0) ||'%' "Profit" 
    
FROM books;

#6
SELECT title,LPAD(cost,12,'*') "COST"
    
FROM books;

#8
SELECT title, pubdate,ABS(ROUND(SYSDATE-pubdate))"AGE"    
FROM books
ORDER BY pubdate DESC

REM:Advance Challenge 


SELECT title, category,
TO_CHAR(retail,'$999.99')"Current Price",
CASE category
WHEN 'COMPUTER' THEN ROUND((retail*.10)+retail,2)
WHEN 'FITNESS' THEN ROUND((retail*.15)+retail,2)
WHEN 'SELF HELP' THEN ROUND((retail*.25)+retail,2)
ELSE ROUND((retail*.03)+retail,2)
END "Revised Price"
FROM books
ORDER BY category,title;