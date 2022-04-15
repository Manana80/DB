--- FIND OUT THE DEPARTMENT NAME AND THE MANAGER FIRST_NAME FOR EACH DEPARTMENT
--- FACT: MANAGER_ID COLUMN OF DEPARTMENT TABLE IS THE EMPLOYEE_ID OF THAT MANAGER.
--- ACCORDING TO THE DEPARTMENT TABLE MANAGER COLUMN COMMENT
--- MANAGER_ID IS THE FOREIGN KEY TO EMPLOYEE_ID OF EMPLOYEE COLUMN
--- IN A NUTSHELL, THAT IS THE RELATIONSHIP WE ARE GOING TO USE
--- EMPLOYEES.EMPLOYEES_ID = DEPARTMENT.MANAGER_ID
--- NOTE THAT IN THIS CASE COLUMN NAMES DOESN'T HAVE TO MATCH AS LONG AS THE RELATIONSHIP IS DEFINED

SELECT d.DEPARTMENT_NAME, e.FIRST_NAME
FROM DEPARTMENTS d
INNER JOIN EMPLOYEES e ON d.MANAGER_ID = e.EMPLOYEE_ID ;

--- CONTINUE FROM ABOVE QUERY, FIND OUT THE MANGER FIRST_NAME OF EXECUTIVE
SELECT d.DEPARTMENT_NAME, e.FIRST_NAME
FROM DEPARTMENTS d
         INNER JOIN EMPLOYEES e ON d.MANAGER_ID = e.EMPLOYEE_ID
WHERE DEPARTMENT_NAME ='Executive';

--- FIND OUT THE DEPARTMENT NAME AND THE MANAGER FIRST_NAME FOR EACH DEPARTMENT
--- ONLY DISPLAY IF DEPARTMENT_NAME STARTS WITH A

SELECT d.DEPARTMENT_NAME, e.FIRST_NAME
FROM DEPARTMENTS d
         INNER JOIN EMPLOYEES e ON d.MANAGER_ID = e.EMPLOYEE_ID
WHERE e.FIRST_NAME LIKE 'A%';

--- FIND OUT HOW MANY COUNTRY IN EACH REGION
--- DISPLAY REGION_NAME AND COUNTRY_COUNT

SELECT r.REGION_NAME, COUNT (c.COUNTRY_NAME) AS "COUNTRY COUNT"
FROM COUNTRIES c
INNER JOIN REGIONS r ON c.REGION_ID = r.REGION_ID
GROUP BY r.REGION_NAME;
