-- Display all FIRST_NAME that has letter a in second character
-- '_a%'

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_a%';


SELECT EMPLOYEES.FIRST_NAME
FROM EMPLOYEES;

SELECT bla.FIRST_NAME
FROM EMPLOYEES bla;


-------- SQL JOIN -------
--- IS USED TO GET DATA FROM 2 OR MORE TABLES THAT ARE RELATED TO EACH OTHER BY PRIMARY KEY
--- AND FOREIGN KEY RELATIONSHIP.
-- THE YELLOW KEY IS THE PRIMARY KEY (NO DUPLICATES , NO NULL VALUE , SHOULD BE UNIQUE)
-- THE BLUE KEY IS THE FOREIGN KEY (BASICALLY IT IS THE PRIMARY KEY OF ANOTHER TABLE) , IT CAN HAS DUPLICATES AND NULL.

---TYPES OF JOINS:
--- INNER JOIN , LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN

--IN ORDER TO JOIN TWO TABLES THAT HAS A RELATIONSHIP
-- SELECT DESIRED COLUMNS FROM BOTH TABLES
-- FROM TABLE 1
-- INNER JOIN TABLE 2 ON THE COMMON COLUMN


--- Nicknames are followed by space and the letter or word
--- you can use nickname to select the columns
--- just like you did in java obj.VariableName
--example:
SELECT bla.FIRST_NAME
FROM EMPLOYEES bla;
-- the reason why we are giving an alias is because it is going to be longer and longer in the future. so to make
-- it shorter and cleaner it is better to choose an alias.

SELECT COUNTRIES.COUNTRY_NAME, REGIONS.REGION_NAME
FROM COUNTRIES
         INNER JOIN REGIONS ON COUNTRIES.REGION_ID = REGIONS.REGION_ID;

-- we can use alias for table to make above query slightly more readable
SELECT c.COUNTRY_NAME, r.REGION_NAME
FROM COUNTRIES c
         INNER JOIN REGIONS r ON c.REGION_ID = r.REGION_ID;
-- 1..n<->1 means many countries in one region

--- FIND OUT CITY (LOCATIONS) AND COUNTRY_NAME (COUNTRIES)
SELECT l.CITY, c.COUNTRY_NAME
FROM LOCATIONS l
       INNER JOIN COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID;

-- IT DOESN'T MATTER WHICH TABLE COMES FIRST WHEN YOU DO INNER JOIN
SELECT l.CITY, c.COUNTRY_NAME
FROM COUNTRIES c
         INNER JOIN LOCATIONS l ON l.COUNTRY_ID = c.COUNTRY_ID;

--YOU CAN JOIN AS MANY TABLES AS YOU WANT , PROVIDED THAT THEY HAVE A RELATIONSHIP WITH EACH OTHER AND THE
-- CONDITION IS MET (WHICH DEPENDS ON PRIMARY AND FOREIGN KEY RELATIONSHIP)

--- FIND OUT DEPARTMENT_NAME (DEPARTMENTS) AND CITY (LOCATIONS)
SELECT l.CITY, d.DEPARTMENT_NAME
FROM LOCATIONS l
         INNER JOIN DEPARTMENTS d ON l.LOCATION_ID = d.LOCATION_ID;

-- OR (SAME RESULT)
SELECT d.DEPARTMENT_NAME, l.CITY
FROM DEPARTMENTS d
INNER JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID;

--- INNER JOIN WILL RETURN THE DATA THAT MATCH FROM BOTH TABLE
--- IT'S RETURNING ONLY ROWS THAT HAS MATCHING DEPARTMENT_ID FROM BOTH TABLES
--- ANYTHING ELSE IS EXCLUDED
--- FOR EXAMPLE: KIMBERLY WITH NO DEPARTMENT_ID
---              DEPARTMENTS WITH NO EMPLOYEES (MEANING NONE OF THE EMPLOYEES HAS THOSE DEPARTMENT_ID)


-- FIND OUT EMPLOYEE FIRST_NAME AND DEPARTMENT_NAME
SELECT e.FIRST_NAME , d.DEPARTMENT_NAME
FROM EMPLOYEES e
INNER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- WE WANT TO DISPLAY FIRST_NAME, DEPARTMENT_NAME
--- INCLUDING THOSE THAT DOES NOT HAVE MATCHING DEPARTMENT_ID
   --- LIKE KIMBERLY WHO HAS NULL DEPARTMENT_ID BUT WE STILL WANT TO GET THAT DATA

SELECT e.FIRST_NAME , d.DEPARTMENT_NAME
FROM EMPLOYEES e
     LEFT OUTER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;
--  WHATEVER COMES FIRST IS THE LEFT AND THE SECOND IS RIGHT
--  HERE EMPLOYEES IS WRITTEN FIRST (IN SELECT STATEMENT) SO IT IS THE LEFT TABLE AND THE DEPARTMENTS IS THE RIGHT TABLE
--  LEFT OUTER JOIN MEANS GIVE ME EVERYTHING FROM THE LEFT TABLE

-- WE WANT TO DISPLAY FIRST_NAME, DEPARTMENT_NAME
-- INCLUDING THOSE DEPARTMENTS THAT DOES NOT HAVE ANY MATCHING EMPLOYEES


-- HERE WE GOT ALL DEPARTMENT NAME INCLUDING DEPARTMENTS WITHOUT EMPLOYEES.

-- WE WANT TO DISPLAY FIRST_NAME, DEPARTMENT_NAME
--- INCLUDING THOSE DEPARTMENTS THAT DOES NOT HAVE ANY MATCHING EMPLOYEES AND
--- INCLUDING THOSE DEPARTMENTS THAT DOES NOT HAVE ANY MATCHING EMPLOYEES

SELECT e.FIRST_NAME , d.DEPARTMENT_NAME
FROM EMPLOYEES e
         FULL JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

--- FACT: ALL DEPARTMENTS ARE LOCATED IN 7 DISTINCT CITIES
--- FACT : THERE ARE 27 CITY IN LOCATIONS TABLE MEANING 16 OF THEM HAS NO DEPARTMENTS
--- DISPLAY ALL DEPARTMENT_NAME (DEPARTMENTS) AND CITY (LOCATIONS)
--- INCLUDING THOSE CITY WITH NO DEPARTMENT IN IT

SELECT d.DEPARTMENT_NAME , l.CITY
FROM DEPARTMENTS d
RIGHT OUTER JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID;

--- DISPLAY FIRST_NAME AND JOB_TITLE
SELECT e.FIRST_NAME, j.JOB_TITLE
FROM EMPLOYEES e
INNER JOIN JOBS j ON e.JOB_ID = j.JOB_ID;

--- DISPLAY FIRST_NAME (EMPLOYEES) , JOB_TITLE (JOBS) AND DEPARTMENT_NAME (DEPARTMENTS)
SELECT e.FIRST_NAME , j.JOB_TITLE , d.DEPARTMENT_NAME
FROM EMPLOYEES e
INNER JOIN JOBS J on e.JOB_ID = J.JOB_ID
INNER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

---- DISPLAY CITY (LOCATION) ,COUNTRY_NAME (COUNTRIES) , REGION_NAME (REGIONS)
SELECT l.CITY, c.COUNTRY_NAME, r.REGION_NAME
FROM LOCATIONS l
INNER JOIN COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID
INNER JOIN REGIONS r ON c.REGION_ID = r.REGION_ID;

---- SELECT e.FIRST_NAME, d.DEPARTMENT_NAME
SELECT  d.DEPARTMENT_NAME, COUNT(e.FIRST_NAME)
FROM EMPLOYEES e
INNER JOIN  DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME;