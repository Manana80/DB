-- This is how you write comment in sql
-- Single line comment look like this
/*
 This is how you write multi line comment
 */
-- each query you write known as sql statement (Select statement)
-- * means all , here it means all columns
-- from some table that exist in the database

--Just like Java, SQL Statements end in semi-colon; and it's mandatory

SELECT * FROM REGIONS ;

-- If you want to run second statement
-- you just need to click the query to focus the cursor and click run

SELECT  * FROM COUNTRIES ;

SELECT  * FROM DEPARTMENTS;

SELECT  * FROM EMPLOYEES ;

SELECT  * FROM JOBS ;

SELECT  * FROM LOCATIONS;

SELECT * FROM JOB_HISTORY;

-- Restricting columns in the result
-- SQL is space insensitive
SELECT FIRST_NAME FROM EMPLOYEES;
-- if you want to select more than one columns can be specified separated by comma,
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES;

SELECT FIRST_NAME,LAST_NAME,EMAIL FROM EMPLOYEES;
/*
 Task: Select specific columns from other tables to get yourself familiar with HR DB.
 */

SELECT EMPLOYEE_iD, START_DATE FROM JOB_HISTORY;

SELECT COUNTRY_NAME,REGION_ID FROM COUNTRIES;

/*
 Only Getting Unique Value from the result
 for example, only get unique first name from employees table
 DISTINCT MIGHT BE AN INTERVIEW QUESTION
 */
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES;

SELECT DISTINCT LAST_NAME FROM EMPLOYEES;

--This is looking for people with unique first name lastname , aka full name.
SELECT DISTINCT FIRST_NAME,LAST_NAME FROM EMPLOYEES;

-- Restricting raws in the result using WHERE clause

-- Comparison Operators:  = , >, >= , < , <=, not equal either != or  <>
-- Logical Operators : And, Or

-- Display the Employee information for the employee with first name Ellen
-- IN SQL WE USE SINGLE QUOTE FOR STRING.
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME = 'Ellen'; --Ellen != ELLEN != ellen, values are case sensitive

-- Display the Employee FIRST_NAME, LAST_NAME,  SALARY for the employees with SALARY 11000

SELECT FIRST_NAME,LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY = 11000 ;

-- Display the Employee FIRST_NAME, LAST_NAME , SALARY for the employee with FIRST_NAME David

SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David';

-- Display the Employee FIRST_NAME, LAST_NAME , SALARY for the employee with SALARY 4800 and FIRST_NAME David

--LOGICAL AND (BOTH CONDITIONS SHOULD BE TRUE)
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David' AND SALARY = 4800;

-- Display the Employee FIRST_NAME, LAST_NAME,SALARY for the employee with SALARY 4800 OR FIRST_NAME David
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David' OR SALARY = 4800;

--Display the employees that make more than 5000 and less than 12000
SELECT * FROM EMPLOYEES WHERE SALARY> 5000 AND SALARY <12000;

--RANGE CHECKING IS MUCH SIMPLER IN SQL USING
-- BETWEEN ..... AND
-- IS SAME AS COLUMN_VALUE >= LOWER LIMIT AND COLUMN_VALUE <= UPPER LIMIT
-- Above query can be much simpler and more readable as below
SELECT * FROM EMPLOYEES
    WHERE SALARY BETWEEN 5000 AND 12000;


-- Display the first names of employees that have JOB_ID of
                                            -- AD_VP
                                            -- AD_ASST
                                            --FI_ACCOUNT
                                            --AC_ACCOUNT

SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID = 'AD_VP' OR JOB_ID = 'AD_ASST' OR JOB_ID ='FI-ACCOUNT'OR JOB_ID = 'AC_ACCOUNT';

-- Using keyword IN for multiple possible value of same column in condition

SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP','AD_ASST','FI-ACCOUNT','AC_ACCOUNT');

-- HOW TO SAY NOT IN SQL
-- for equality check != <>,
  --- FIND OUT ALL REGIONS EXCEPT THE REGION WITH REGION_ID OF 1
SELECT  * FROM REGIONS
--WHERE REGION_ID != 1;
WHERE REGION_ID <> 1;


--- FIND OUT ALL REGIONS EXCEPT THE REGION WITH REGION_NAME  OF America
SELECT * FROM REGIONS
WHERE REGION_NAME <> 'Americas';

-- for BETWEEN AND --> NOT BETWEEN .. AND
--Display the employees that don't make more than 5000 and less than 12000

SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 12000;


--for IN --> NOT IN

-- Display the first names of employees that don't have a  JOB_ID of
-- 'AD_VP', 'AD_ASST', 'FI_ACCOUNT', 'AC_ACCOUNT'
SELECT  FIRST_NAME,JOB_ID FROM EMPLOYEES
WHERE JOB_ID NOT IN ('AD_VP', 'AD_ASST', 'FI_ACCOUNT', 'AC_ACCOUNT');

-- How to use NULL IN CONDITION?
-- FOR EXAMPLE: FIND OUT ALL DEPARTMENTS WITH NULL MANAGER_ID
SELECT * FROM  DEPARTMENTS
WHERE MANAGER_ID IS NULL;

-- FOR EXAMPLE : FIND OUT ALL DEPARTMENTS THAT DOES NOT HAVE  NULL MANAGER_ID
SELECT * FROM  DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL ;

-- SORTING THE RESULT IN ASCENDING (LOW TO HIGH)
-- OR DESCENDING ORDER (HIGH TO LOW)
-- ORDER BY Clause can be used to order the result of your query
-- It must be the last part of the statement
-- ASC for (LOW TO HIGH), DESC (HIGH TO LOW)

-- Display Employee FIRST_NAME and LAST_NAME and SALARY
-- try to sort be below criteria separately
-- FIRST_NAME ASC
-- SALARY DESC
-- LAST_NAME DESC

SELECT FIRST_NAME, LAST_NAME,SALARY FROM EMPLOYEES
--ORDER BY FIRST_NAME ASC;
ORDER BY SALARY DESC; -- DESCENDING IS NOT BY DEFAULT WE NEED TO WRITE IT DOWN
--ORDER BY LAST_NAME DESC;
--ORDER BY 1 DESC ; -- THIS MEANS SORT THE  FIRST COLUMN IN THE RESULT (1 IS REFERRING TO THE FIRST COLUMN)
--SQL INDEX START WITH 1 NOT 0 !!!!!!!!!!!!!!!!!!!!!!!

-- WHAT ABOUT THE PARTIAL SEARCH !!
-- WE USE LIKE AND % (WILD CARD)
-- % can represent exactly 0 or more character of any kind
-- _ can represent exactly one character of any kind

-- DISPLAY ALL THE FIRST_NAME THAT START WITH LETTER A IN EMPLOYEES TABLE
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE 'A%';

-- DISPLAY ALL THE FIRST_NAME THAT END WITH LETTER a IN EMPLOYEE TABLE
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%a';


-- DISPLAY ALL THE FIRST_NAME THAT CONTAINS LETTER a IN EMPLOYEE TABLE
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%a%';
-- % (0 or more char) a (letter a) % (0 or more char) = contains logic.
--You can use % more than one time wherever and whenever needed.
-- to represent 0 or more characters.