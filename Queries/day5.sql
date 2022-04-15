SELECT *
FROM EMPLOYEES;

-- CASE WHEN STATEMENT TO CONDITIONALLY DISPLAY VALUES

-- DISPLAY EMPLOYEE FIRST_NAME ,SALARY , SALARY_GRADE
--- SALARY_GRADE COLUMN SHOULD HAVE THE BELOW VALUES
---- WHEN SALARY > 8000 -- > "ABOVE AVERAGE"
---- ELSE "BELOW AVERAGE"
--- CASE WHEN IS VERY SIMILAR TO SWITCH STATEMENT IN JAVA

SELECT FIRST_NAME,
       SALARY,
       CASE
           WHEN SALARY > 8000 THEN 'ABOVE AVERAGE'
           ELSE 'BELOW AVERAGE'
           END AS SALARY_GRADE

FROM EMPLOYEES;

-- DISPLAY EMPLOYEE FIRST_NAME ,SALARY , SALARY_GRADE2
--- SALARY_GRADE COLUMN SHOULD HAVE THE BELOW VALUES
---- WHEN SALARY > 20000 THEN "A"
---- WHEN SALARY BETWEEN 10000 AND 15000 THEN "B"
---- WHEN SALARY BETWEEN 5000 AND 9999 THEN "C"
---- ELSE "D"

SELECT FIRST_NAME,
       SALARY,
       CASE
           WHEN SALARY > 20000 THEN 'A'
           WHEN SALARY BETWEEN 10000 AND 20000 THEN 'B'
           WHEN SALARY BETWEEN 5000 AND 9999 THEN 'C'
           ELSE 'D'
           END AS SALARY_GRADE

FROM EMPLOYEES;
