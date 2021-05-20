REM: Ricky Cruz 
REM: Chapter 5

REM: Hands-On Assignments
#1

INSERT INTO orders (order#, Customer#,Orderdate)
VALUES('1032','1009', '20-Jul-09');

#1a

SELECT *   
FROM orders;

#6
UPDATE books
SET cost= '&cost'
WHERE ISBN = '&ISBN';


#9
REM: i am not sure if this is correct but i figured we needed to get ride of the primary and forgin key in order for me to
delete the row because everytime i tryed the code from the book to delete the row it gave me the same error the primary and forgin key
were stopping me so i did a commit took off the forign key and the primary key did everything you asked and then did rollback to 
remove it all in 10.


COMMIT;

ALTER TABLE orders
DROP PRIMARY key CASCADE;

DELETE FROM orders
WHERE order# = 1005;

#9A
REM: I used the data from the output page you gave us just so i can make sure it matches and works.

INSERT INTO orders
VALUES('&order_number','&customer_number','&orderdate','&shipdate',
'&shipstreet','&shipcity','&shipstate','&shipzip','&shipcost');

#10
RollBack;

REM:Advanced Challenge

(a)
CREATE TABLE Category
(Catcode VARCHAR2(3),
Catdesc VARCHAR2(11) NOT NULL,
CONSTRAINT category_catcode_pk PRIMARY KEY(catcode));

 INSERT INTO category
 VALUES ('BUS', 'Buiness');

INSERT INTO category
 VALUES ('CHN', 'CHILDREN');
 
 INSERT INTO category
 VALUES ('COK', 'COOKING');
 
 INSERT INTO category
 VALUES ('COM', 'COMPUTER');
 
INSERT INTO category
 VALUES ('FAL', 'FAMILY LIFE');
 
 INSERT INTO category
 VALUES ('FIT', 'FITNESS');
 
  INSERT INTO category
 VALUES ('SEH','SELF HELP');
 
 INSERT INTO category
 VALUES ('LIT', 'LITERATURE');

DESCRIBE category;
SELECT constraint_name, constraint_type, search_condition
            FROM user_constraints
                WHERE table_name = 'category';
SELECT *
FROM Category



(b)
ALTER TABLE books
add (Catcode VARCHAR2(3),
CONSTRAINT books_Catcode_fk FOREIGN KEY(catcode)
references category(catcode));

DESCRIBE books;
SELECT constraint_name, constraint_type, search_condition
            FROM user_constraints
                WHERE table_name = 'books';
(C)

UPDATE books
SET catcode = '&catcode'
WHERE category = '&category';

UPDATE books
SET catcode = '&catcode'
WHERE category = '&category';

UPDATE books
SET catcode = '&catcode'
WHERE category = '&category';

UPDATE books
SET catcode = '&catcode'
WHERE category = '&category';

UPDATE books
SET catcode = '&catcode'
WHERE category = '&category';

UPDATE books
SET catcode = '&catcode'
WHERE category = '&category';

UPDATE books
SET catcode = '&catcode'
WHERE category = '&category';

UPDATE books
SET catcode = '&catcode'
WHERE category = '&category';


(D)

SELECT title,catcode
FROM books;

(E)
ALTER TABLE books
DROP CONSTRAINT books_catcode_fk;

drop table category purge;

ALTER TABLE books
DROP COLUMN catcode;

