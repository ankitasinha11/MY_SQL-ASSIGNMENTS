use company;
select*from worker;
 --  using like method to ffetch name from the workers table 
select* 
from worker where
first_name like"_____h";


-- using right method to fetch right characters from right side
 select *from worker
 where length(first_name)=6 and right (first_name,1)= "h";  
 -- using right method to fetch right characters from right side

 
  select email 
  from worker  where email like "%_@_%.%";   -- to fetch email from workers table 
  
  
  -- or we can find it with regular expression we can find it on chatgpt or net.
  
  
  select*from worker
   where joining_date between "2014-02-01" and " 2014-02-28" ; -- to fetch a particular date 
   
   select *from worker
   where joining_date < "2024-02-01" and joining_date > "2024-02-29"; --  it can itself calculate leap year so date can be taken itself
  
 -- question to find the column of leap year seperately???
 
   select 
   first_name,
   last_name,
   email,
   count(*) from worker
   group by
   first_name,
   last_name,
   email
   having count(*)>1;  -- to find the duplicate values of the worker imp. question
   
 create temporary table tempworker as
 select min(worker_id)as worker_id,first_name,last_name,department,salary,joining_date,email
 from worker
 group by first_name,last_name,department,salary,joining_date,email;
 
 set sql_safe_updates =0;
 delete from worker;
  set sql_safe_updates =1;
   
   insert into worker( worker_id,first_name,last_name,department,salary,joining_date,email)
   select 
   worker_id,first_name,last_name,department,salary,joining_date,email
   from tempworker;
   
   drop temporary table tempworker; -- next one sol.
   
   
create table temp_worker as   -- one more type sol.
select distinct * from worker;

set sql_safe_updates =0;
delete from worker;
set sql_safe_updates =1;  
    
insert into worker
select *from temp_worker;
    
 drop temporary table tempworker;
 select count(*) from worker;
   
   select*from worker;
   
 -- next assignment 7

SELECT *
FROM Worker
WHERE WORKER_ID % 2 != 0;  -- to find odd number-- 


-- Write an SQL query to clone a new table from another table.

 CREATE TABLE NewWorker AS
SELECT *
FROM Worker
WHERE 0=1;

select* from newworker;

  

  
  
  
  
 
 
 
 
 
 
 

