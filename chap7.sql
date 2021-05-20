REM: Ricky Cruz
REM : Chapter 7

REM: Hands-On #1

CREATE USER rCruz
   IDENTIFIED BY test1;

#2 
Connect rCruz/test1;
REM: Connect to DBA
Connect Ricky/********

#3
GRANT CREATE SESSION, CREATE TABLE, ALTER ANY TABLE
   TO rCruz;

#4
CREATE ROLE CUSTOMERREP;

GRANT insert, delete
    ON orders
    TO CUSTOMERREP;

GRANT insert, delete
   ON orderitems
    TO CUSTOMERREP;

#5
GRANT CUSTOMERREP
   TO rCruz;

REM: Connect to new Account 

Connect rcruz/test1

#6
SELECT * FROM user_sys_privs;
SELECT * FROM user_tab_privs;

REM: Connect to DBA 
Connect ricky/********;

#7
REVOKE delete
    ON orders
    FROM CUSTOMERREP;

REVOKE delete
  ON orderitems
   FROM CUSTOMERREP;

#8 
REVOKE CUSTOMERREP
    FROM rCruz;

#9
DROP ROLE CUSTOMERREP;

#10
DROP USER rCruz;


REM Advance Challenge #1,#2,#3

REM: Ok so after reading this i felt it would be easier to create the role then add the proper tables and grants.

CREATE ROLE Account_Manager_Role;
GRANT insert,delete
	ON books	
	To Account_Manager_Role;

GRANT insert,delete
	ON Orderitems
	To Account_Manager_Role;

GRANT insert,delete
	ON Promotion
	To Account_Manager_Role;

CREATE ROLE Data_Entry_Role;
GRANT insert,delete
	ON Books
	TO Data_Entry_Role;

GRANT insert,delete
	ON Author
	TO Data_Entry_Role;

GRANT insert,delete
	ON BookAuthor
	TO Data_Entry_Role;

GRANT insert,delete
	ON Publisher
	TO Data_Entry_Role;

CREATE ROLE Customer_Service_Role;
GRANT insert,delete 
	ON Customers
	TO Customer_Service_Role;

GRANT insert,delete 
	ON Orders
	TO Customer_Service_Role;

GRANT insert,delete 
	ON OrderItems
	TO Customer_Service_Role;

DROP ROLE Account_Manager_Role;
DROP ROLE Data_Entry_Role;
DROP ROLE Customer_Service_Role;
