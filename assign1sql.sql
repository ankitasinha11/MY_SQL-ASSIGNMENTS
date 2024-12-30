drop database if exists Company;
CREATE DATABASE Company;
USE Company;

select *from worker;


-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias
-- name as <WORKER_NAME>;.
SELECT FIRST_NAME AS WORKER_NAME              /* to fetch workers name from table */
FROM Worker;


-- Q-2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

SELECT DISTINCT DEPARTMENT                    /* to find unique department from table */      
FROM Worker;


-- Q-3. Write an SQL query to show the last 5 record from a table.

WITH RankedRecords AS (            -- to find last 5 records from table using window function
    SELECT *, ROW_NUMBER() OVER () AS row_num
    FROM Worker
)
SELECT *
FROM RankedRecords
WHERE row_num > (SELECT COUNT(*) FROM Worker) - 5;
