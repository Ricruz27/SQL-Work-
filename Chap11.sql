REM: RICKY CRUZ 
REM: CHAPTER 11 


REM: HANDS-ON

#1 
SELECT COUNT(category)cooking_books
FROM books
WHERE category IN 'COOKING';

#3
SELECT MAX(pubdate)Newest_Books
FROM books;

#5
SELECT MIN(retail)Least_Expensive_Computer_Book
FROM books
where category IN 'COMPUTER';

#7
SELECT customer#, COUNT(ORDERDATE)Num_of_Orders
FROM orders
GROUP by customer#
ORDER BY customer#;

#9

SELECT customer#, order#, TO_CHAR(SUM(quantity*retail),'$999.99')AMOUNT
FROM orders JOIN orderitems USING (order#) JOIN books USING (isbn)
WHERE (shipstate = 'FL' or shipstate = 'GA')
GROUP BY orders.customer#,order#
HAVING SUM (quantity*retail)>80
ORDER BY orders.customer#;

REM: ADVANCE CHALLENGE

select b.title, count(oi.isbn) "Number of copies sold"
from books b,orderitems oi 
where oi.isbn=b.isbn 
and b.title 
in (select title 
from books 
where (((retail-cost)/cost)*100)<55.00) 
group by b.title 
order by b.title;