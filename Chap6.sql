REM: Ricky Cruz 
REM: Chapter 6 

REM: Hands-on

#1
CREATE SEQUENCE customers_customer#_seq
    START WITH 1021
    NOCACHE;

REM:DISPLAY
SELECT * FROM user_sequences;

#2
INSERT INTO customers (customer#, lastname, firstname, zip)
   VALUES (customers_customer#_seq.NEXTVAL, 'Shoulders', 'Frank', '23567');

REM: Display #2
SELECT * FROM customers WHERE lastname = 'Shoulders';

REM: Drop 

DROP SEQUENCE customers_customer#_seq;

REM: Delete 
DELETE FROM customers WHERE customer# = 1021;

#3
CREATE SEQUENCE MY_FIRST_SEQ
  INCREMENT BY -3
  START WITH 5
  MINVALUE 0
  MAXVALUE 5
  NOCYCLE;

REM : Display #3
SELECT * FROM user_sequences;

#4
SELECT MY_FIRST_SEQ.NEXTVAL
  FROM DUAL;
REM: result for number 4 
(NEXTVAL 5)

REM:#4 Passed a second time
REM: Results 
(NEXTVAL2)

REM:#4 Passed Third time 
Result:
instantiating NEXTVAL would violate one of MAX/MIN VALUE 

#5
ALTER SEQUENCE MY_FIRST_SEQ
  MINVALUE -1000;
REM:Display #5
SELECT * FROM user_sequences;

#7
CREATE SYNONYM NUMGEN
 FOR MY_FIRST_SEQ;

#8
SELECT NUMGEN.CURRVAL
   FROM DUAL;

REM Drop Synonym
DROP SYNONYM NUMGEN;

REM Drop Sequence.
DROP SEQUENCE MY_FIRST_SEQ;

#10
CREATE INDEX CUSTOMERS_LASTNAME_IDX
  ON customers (lastname);

REM: Display #10 
SELECT index_name, index_type
   FROM user_indexes
   WHERE index_name = 'CUSTOMERS_LASTNAME_IDX';

REM:Drop Index
DROP INDEX CUSTOMERS_LASTNAME_IDX;

#11
CREATE INDEX ORDERS_SHIPDAY_IDX
   ON orders (shipdate-orderdate);

REM: Display Hands-On #11
SELECT index_name, index_type
  2  FROM user_indexes
  3  WHERE index_name = 'ORDERS_SHIPDAY_IDX';

REM: Drop Index
DROP INDEX ORDERS_SHIPDAY_IDX;