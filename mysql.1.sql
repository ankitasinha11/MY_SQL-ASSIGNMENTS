 /*1.Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias
      name as <WORKER_NAME>.*/---- -- 

select*from worker;

-- solution 1. using AS keyword.-- 
USE company;
SELECT FIRST_NAME AS WORKER_NAME
FROM Worker;

-- solution 2. Using column name only-- 

SELECT FIRST_NAME 
FROM Worker;

-- solution 3. Using space between column name and alias-- 

SELECT FIRST_NAME WORKER_NAME
FROM Worker;

-- solution 4. write it with double quotes.-- 
SELECT FIRST_NAME "WORKER_NAME"
FROM Worker;

-- solution 5. Using table alias-- 

SELECT W.FIRST_NAME AS WORKER_NAME
FROM Worker W;

-- solution 6. Using common table expression (CTE)-- 

WITH WorkerCTE AS (
  SELECT FIRST_NAME AS WORKER_NAME
  FROM Worker
)
SELECT WORKER_NAME
FROM WorkerCTE;

-- solution 7. Using derived table-- 

SELECT WORKER_NAME
FROM (
  SELECT FIRST_NAME AS WORKER_NAME
  FROM Worker
) AS DerivedTable;

-- solution 8.Using subquery-- -- -- -- -- -- //////////////////

SELECT 
(SELECT FIRST_NAME 
FROM Worker WHERE Worker_ID = W.WorkerID) 
AS WORKER_NAME
FROM Worker W;


-- solution 9. Using window function-- 

SELECT DISTINCT FIRST_NAME AS WORKER_NAME
FROM (
  SELECT FIRST_NAME, ROW_NUMBER() OVER (ORDER BY FIRST_NAME) AS row_num
  FROM Worker
) AS subquery;

-- solution 10. Using with clause-- 

WITH WorkerCTE AS (
  SELECT FIRST_NAME AS WORKER_NAME
  FROM Worker
)
SELECT WORKER_NAME FROM WorkerCTE;

-- solution 11.  Using union operator-- 

SELECT FIRST_NAME AS WORKER_NAME FROM Worker
UNION
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;

 -- solution12. Using intersect operator-- 

SELECT FIRST_NAME AS WORKER_NAME FROM Worker
INTERSECT
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;

-- solution 13. Using derived table with alias-- 

SELECT WORKER_NAME FROM (
  SELECT FIRST_NAME AS WORKER_NAME FROM Worker
) AS DerivedTable;

-- solution 14.Using GROUPby-- 

SELECT FIRST_NAME AS WORKER_NAME
FROM Worker
GROUP BY  ((FIRST_NAME));

-- solution 15. solution Using Window Function dengan RANK-- 

SELECT DISTINCT FIRST_NAME AS WORKER_NAME
FROM (
  SELECT FIRST_NAME,
    RANK() OVER (ORDER BY FIRST_NAME) AS rank_num
  FROM Worker
) AS subquery;


-- solution 16. Using Window Function dengan DENSE_RANK()

SELECT DISTINCT FIRST_NAME AS WORKER_NAME
FROM (
  SELECT FIRST_NAME,
    DENSE_RANK() OVER (ORDER BY FIRST_NAME) AS dense_rank_num
  FROM Worker
) AS subquery;

-- solution 17. Using Window Function dengan ROW_NUMBER()-- 

SELECT DISTINCT FIRST_NAME AS WORKER_NAME
FROM (
  SELECT FIRST_NAME,
    ROW_NUMBER() OVER (ORDER BY FIRST_NAME) AS row_num
  FROM Worker
) AS subquery;

-- solution 18. Using Common Table Expression (CTE)-- 

WITH WorkerCTE AS (
  SELECT FIRST_NAME AS WORKER_NAME
  FROM Worker
)
SELECT WORKER_NAME FROM WorkerCTE;


-- -solution 19. Using Derived Table dengan GROUP BY-- 

SELECT WORKER_NAME
FROM (
  SELECT FIRST_NAME AS WORKER_NAME
  FROM Worker
  GROUP BY FIRST_NAME
) AS DerivedTable;

-- solution 20. Using Window Function dengan NTILE()

SELECT DISTINCT FIRST_NAME AS WORKER_NAME
FROM (
  SELECT FIRST_NAME,
    NTILE(10) OVER (ORDER BY FIRST_NAME) AS ntile_num
  FROM Worker
) AS subquery;

 -- solution 21. Using Window Function dengan LAG()-- 

SELECT DISTINCT FIRST_NAME AS WORKER_NAME
FROM (
  SELECT FIRST_NAME,
    LAG(FIRST_NAME) OVER (ORDER BY FIRST_NAME) AS lag_name
  FROM Worker
) AS subquery;

-- solution 22. Using Window Function dengan LEAD()-- 

SELECT DISTINCT FIRST_NAME AS WORKER_NAME
FROM (
  SELECT FIRST_NAME,
    LEAD(FIRST_NAME) OVER (ORDER BY FIRST_NAME) AS lead_name
  FROM Worker
) AS subquery;



---- ----  ----  /*Q-2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.*/-- ---- -- -- -- 

select*from worker;

-- -solution1.  Using GROUP BY Clause-- 
SELECT DEPARTMENT
FROM Worker
GROUP BY DEPARTMENT;

-- -solution2. Using DISTINCT Keyword-- 
SELECT DISTINCT DEPARTMENT
FROM Worker;

-- solution 3. Using UNION Operator
SELECT DEPARTMENT
FROM Worker
UNION
SELECT DEPARTMENT
FROM Worker;

-- solution 4.Using Subquery with IN Operator
SELECT DISTINCT DEPARTMENT
FROM Worker
WHERE DEPARTMENT IN (
  SELECT DEPARTMENT
  FROM Worker
);

-- solution 5. Using Common Table Expression (CTE)
WITH UniqueDepartments AS (
  SELECT DISTINCT DEPARTMENT
  FROM Worker
)
SELECT DEPARTMENT
FROM UniqueDepartments;

-- solution6.Using DISTINCT with ORDER BY
SELECT DISTINCT DEPARTMENT
FROM Worker
ORDER BY DEPARTMENT;

-- solution7. Using Subquery with EXISTS
SELECT DISTINCT DEPARTMENT
FROM Worker W1
WHERE EXISTS (
  SELECT 1
  FROM Worker W2
  WHERE W2.DEPARTMENT = W1.DEPARTMENT
);

-- solution 8.Using GROUP BY with HAVING
SELECT DEPARTMENT
FROM Worker
GROUP BY DEPARTMENT
HAVING COUNT(DISTINCT DEPARTMENT) = 1;

-- solution 9.Using ROW_NUMBER()
SELECT DISTINCT DEPARTMENT
FROM (
  SELECT DEPARTMENT,
    ROW_NUMBER() OVER (ORDER BY DEPARTMENT) AS row_num
  FROM Worker
) AS subquery;

-- solutiom 10.Using Derived Table
SELECT DEPARTMENT
FROM (
SELECT DISTINCT DEPARTMENT
FROM Worker
) AS DerivedTable;


  -- /*Q-3. Write an SQL query to show the last 5 record from a table.*/-- -- -- -- -- 

 --  solution 1 . using window function
WITH RankedRecords AS (     
    SELECT *, ROW_NUMBER() OVER () AS row_num
    FROM Worker
)
SELECT *
FROM RankedRecords
WHERE row_num > (SELECT COUNT(*) FROM Worker) - 5;

-- solution 2. fetch records in descending order using order by
SELECT *
FROM Worker
ORDER BY WORKER_ID DESC
LIMIT 5 OFFSET 0;

-- solution 3. fetch the records in ascending order using order by
 select * from worker
 order by worker_id ASC
limit 5 offset 0;

-- solution 4.  using row number and cte
WITH NumberedRows AS (
    SELECT *, ROW_NUMBER() OVER () AS RowNum
    FROM Worker
)
SELECT *
FROM NumberedRows
WHERE RowNum > (SELECT MAX(RowNum) - 5 FROM NumberedRows);

-- solution 5. use subquery
select*from worker
where id in (
select  id from
select(workers_id
from workers)
as subquery );
