REM:Ricky Cruz
REM:Chapter 4

Rem: Hands On Assignment 

#1

CREATE TABLE store_reps
(rep_ID NUMBER (5),
last VARCHAR2(15),
first VARCHAR2(10),
comm CHAR(1)DEFAULT 'Y',
CONSTRAINT store_reps_rep_ID_pk PRIMARY KEY (rep_ID));

#2
ALTER TABLE store_reps
MODIFY (last CONSTRAINT store_reps_last_nn NOT NULL,
first CONSTRAINT store_reps_first_nn NOT NULL);

#3
ALTER TABLE store_reps
ADD CONSTRAINT store_reps_comm_ck CHECK (comm IN('Y','N'));

#4
ALTER TABLE store_reps
ADD (base_salary NUMBER(7,2) CONSTRAINT store_reps_base_salary_ck CHECK (base_salary > 0));

REM: Special changes here is the out put oracle SQL developer wont let me copy it so i had to take it
from the run SQL command line 
REM:Special Instructions:
REM: Display after #4

CONSTRAINT_NAME                C
------------------------------ -
SEARCH_CONDITION
--------------------------------------------------------------------------------
STORE_REPS_REP_ID_PK           P


STORE_REPS_LAST_NN             C
"LAST" IS NOT NULL

STORE_REPS_FIRST_NN            C
"FIRST" IS NOT NULL


CONSTRAINT_NAME                C
------------------------------ -
SEARCH_CONDITION
--------------------------------------------------------------------------------
STORE_REPS_COMM_CK             C
comm IN('Y','N')

STORE_REPS_BASE_SALARY_CK      C
base_salary > 0

#5
CREATE TABLE book_stores
(store_ID NUMBER(8),
name VARCHAR2(30) NOT NULL,
Contact VARCHAR2(30),
Rep_ID VARCHAR2(5),
CONSTRAINT book_stores_store_ID_pk PRIMARY KEY (store_id),
CONSTRAINT book_stores_name_uk UNIQUE(name));

#6 Modify from error 
ALTER TABLE Book_stores
MODIFY (rep_ID NUMBER(5));

#6
ALTER TABLE book_stores 
ADD( CONSTRAINT book_stores_rep_ID_fk FOREIGN KEY (rep_id)
REFERENCES store_reps(rep_id));

#7 REM: I Had to delete the number 6 task to do the number 7 one correct 

#7ALTER TABLE book_stores 
ADD CONSTRAINT book_stores_rep_ID_fK FOREIGN KEY(rep_ID)
REFERENCES store_reps (rep_ID) ON DELETE CASCADE;

REM:Special Instructions:
REM: Display after #7

CONSTRAINT_NAME                C
------------------------------ -
SEARCH_CONDITION
--------------------------------------------------------------------------------
SYS_C007105                    C
"NAME" IS NOT NULL

BOOK_STORES_STORE_ID_PK        P


BOOK_STORES_NAME_UK            U



CONSTRAINT_NAME                C
------------------------------ -
SEARCH_CONDITION
--------------------------------------------------------------------------------
BOOK_STORES_REP_ID_FK          R

REM:Delete the book_stores Table 

DROP TABLE book_stores PURGE;

REM Delete the store_rep Table

DROP TABLE store_reps PURGE;
