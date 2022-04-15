/**
-- LIST 1  : APPLE , EGG , MILK , PINEAPPLE, BREAD
-- LIST 2  : MILK , BREAD , OIL , WALNUT
-- UNION ALL -->> APPLE , EGG , MILK , PINEAPPLE, BREAD , MILK , BREAD , OIL , WALNUT
-- UNION     -->> APPLE , BREAD , EGG, MILK, PINEAPPLE , OIL , WALNUT
-- LIST 1  MINUS LIST 2
 -- LIST 2 HERE IS NO-NO LIST
  -- MINUS   --> APPLE , EGG , PINEAPPLE
-- LIST2 MINUS LIST 1
  -- LIST 1 HERE IS NO-NO LIST
  -- MINUS -->>   OIL , WALNUT
 --- INTERSECT
    -- LIST 1 INTERSECT LIST 2
        --->> ONLY COMMON PART OF BOTH LIST  -->> MILK , BREAD
  In order for SET Operators to work ,
Two tables or result of two query being used MUST HAVE
- same exact column count
- same exact column data type
- Ideally  same exact column name (if not first table column name will be used)
Unlike JOIN which require primary key and foreign key relationship,
SET Operator must have above pre-requisite or it will not work at all !
JOIN and SET Operators are two completely different concepts.
CREATE TABLE FIRST_TABLE AS (
    SELECT FIRST_NAME , SALARY FROM EMPLOYEES
    WHERE SALARY BETWEEN 10500 AND 13000
) ORDER BY 2 ;
CREATE TABLE SECOND_TABLE AS (
    SELECT FIRST_NAME , SALARY FROM EMPLOYEES
    WHERE SALARY BETWEEN 12000 AND 24000
) ORDER BY 2 ;
COMMIT ;
  */

/**
In order for SET Operators to work ,
Two tables or result of two query being used MUST HAVE
- same exact column count
- same exact column data type
- Ideally  same exact column name (if not first table column name will be used)

  Unlike JOIN which require primary key and foreign key relationship,
SET Operator must have above pre-requisite or it will not work at all !
JOIN and SET Operators are two completely different concepts.
 */

-- UNION ALL
-- COMBINE THE RESULT OF 2 QUERIES
-- AND RETURN COMBINED RESULT AS IS -- NO SORTING NO REMOVING DUPLICATE

SELECT * FROM FIRST_TABLE
    UNION ALL
SELECT * FROM SECOND_TABLE;

-- UNION
-- COMBINE THE RESULT OF 2 QUERIES
-- AND RETURN COMBINED RESULT AS IS
-- AND REMOVE DUPLICATE, SORT BY FIRST COLUMN (actually keeps the unique rows, better expression than
-- removing duplicate) since the whole row must be a duplicate to be removed not only one value!

SELECT * FROM FIRST_TABLE
UNION
SELECT * FROM SECOND_TABLE;

-- MINUS
-- TABLE1 MINUS TABLE2
-- WILL REMOVE THOSE ROW FROM TABLE1
-- IF IT EXISTS IN TABLE 2

SELECT * FROM FIRST_TABLE
MINUS
SELECT * FROM SECOND_TABLE;

-- TABLE2 MINUS TABLE1
-- WILL REMOVE THOSE ROW FROM TABLE2
-- IF IT EXISTS IN TABLE 1

SELECT * FROM SECOND_TABLE
MINUS
SELECT * FROM FIRST_TABLE ;

--- INTERSECT
/**
  TABLE 1 INTERSECT TABLE 2
    IT WILL RETURN ONLY THE COMMON ROWS
    IN BOTH TABLES
 */
SELECT * FROM SECOND_TABLE
INTERSECT
SELECT * FROM FIRST_TABLE ;

--- LIST 1 : MILK , EGG , BREAD, BANANA, YOGURT , STRAWBERRY

--- LIST 2 : BREAD , EGG , TOMATO, POTATO , ORANGE

-- UNION ALL : MILK , EGG , BREAD, BANANA, YOGURT , STRAWBERRY ,
-- BREAD , EGG , TOMATO, POTATO , ORANGE

-- UNION   : MILK , EGG , BREAD, BANANA, YOGURT , STRAWBERRY
-- TOMATO, POTATO , ORANGE

-- MINUS  : GET EVERYTHING IN LIST 1
--- DO NOT GET ANY ITEM IF IT SHOWS UP IN LIST 2
--- LIST 2 IS YOUR NO NO LIST
-- LIST 1 - LIST 2
-- MILK , BANANA, YOGURT , STRAWBERRY

-- LIST 2 - LIST 1
--    TOMATO, POTATO , ORANGE

-- INTERSECT : LETS JUST GET IF THE ITEMS SHOWED UP IN BOTH LIST
-- LIST 1 INTERSECT LIST 2
--- BREAD AND EGG


--- INTERVIEW QUESTION
/*
 ## Question :
1. given 2 tables with same column names column data types and column count Employee1 and Employee2 with full of data :
How do you determine, they have same exact data

TABLE 1
ID  NAME
1 , ADAM
2 , MARY
3 , JON

TABLE 2
1 , ADAM
2 , MARY
3 , JON
4 , Muhammad

-- check row count equality , if not same END OF STORY!
else
-- Try using intersect, check the result count
     if the result count is same as table row count
         it means every rows are common rows

     if the result count is less than row count
         it means there are rows that not common --> NOT SAME

TABLE 1 - TABLE2
 &&
 TABLE2 -TABLE1 BOTH SHOULD BE 0
 */

/*
REVISION
## SQL JOINS
1. INNER JOIN
-- WILL ONL RETURN THE DATA MATCH IN BOTH TABLES, ANYTHING DOES NOT MATCH WILL N OT BE PART OF THE RESULT
2. OUTER JOIN
2.1 LEFT OUTER JOIN
-- WILL RETURN THE DATA MATCH IN BOTH TABLES , PLUS ALL DATA IN THE LEFT TABLE THAT ARE NOT IN THE RIGHT TABLE
2.2 RIGHT OUTER JOIN
-- WILL RETURN THE DATA MATCH IN BOTH TABLES, PLUS ALL DATA IN THE RIGHT TABLE THAT ARE NOT IN THE LEFT TABLE
2.3 FULL OUTER JOIN
-- WILL RETURN ALL DATA IN BOTH TABLES MATCHING AND UNMATCHING
 */