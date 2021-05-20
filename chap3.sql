REM: Ricky Cruz 
REM: Chapter 3 Assignment 

REM: Hands on #2

CREATE TABLE Employees
(Emp# NUMBER (5),
Employee_First VARCHAR2(16),
Employee_Last VARCHAR2(16),
Job_Class VARCHAR2(4));

DESC Employees;

REM:Hands On #3

ALTER TABLE Employees
ADD(EmpDate DATE DEFAULT SYSDATE,
EndDate DATE);

DESC Employees;

REM Hands on #4

ALTER TABLE Employees 
MODIFY ( Job_Class CHAR(2));

DESC Employees;

REM:Hands on #5

ALTER TABLE Employees
DROP COLUMN EndDate;
SE
DESC Employees;


REM: Hands On #7

CREATE TABLE BOOK_PRICING 
AS (SELECT ISBN AS "ID", COST, RETAIL, CATEGORY
FROM BOOKS);

SELECT *
FROM BOOK_PRICING;

Permanently delete the employees and book_pricing tables after Hands-on #7.

DROP TABLE Employees PURGE;

DROP TABLE BOOK_PRICING PURGE;

REM: Advanced Challenge 

Rem: Bullet #1 

ALTER TABLE ACCTMANAGER
ADD (Comm_id NUMBER(2,0) DEFAULT 10,
Ben_id NUMBER (2,0));

REM: Bullet #2

CREATE TABLE COMMRATE 
(Comm_id NUMBER(2),
Comm_rank VARCHAR2(15),
Rate Number (2,2));

REM: Bullet #3

CREATE TABLE BENEFITS
(Ben_id NUMBER(2),
BEN_PLAN VARCHAR2(1),
BEN_PROVIDER NUMBER (3),
ACTIVE_Y_N VARCHAR2(1));

DESCRIBE acctmanager and commrate tables after completing the Advanced Challenge.

DESC ACCTMANAGER;
DESC COMMRATE;

Permanently delete the commrate table after completing the Advanced Challenge.

DROP TABLE COMMRATE PURGE;

Remove the Region column from the Customers table.

ALTER TABLE CUSTOMERS
DROP COLUMN REGION;