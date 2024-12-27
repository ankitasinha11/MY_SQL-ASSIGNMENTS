use company;
select*from worker;

select substring(first_name,1,3) as first_name 
from worker;


select position("a" in first_name) from worker;

select locate("i",first_name) as_position_a from worker
where first_name = "minakshi" ;

select substring(first_name,3,8) as posit from worker
where first_name = "minakshi" ;

select locate("i", substring(first_name),3,10))+2
as pos from worker
where first_name =" ajay" ;  

select locate ("a",substring(first_name,locate("a",first_name)+1,length(first_name)))+locate("a",first_name)as pos 
from worker
where first_name =" ajay" ;   /*question no.5 */


select 
department, max(salary)from worker        -- find highest salary of each department. (max or min)
group by department;

select first_name,salary from worker where salary in ( 86000,120000,95000);

select first_name,
       salary,
       department from worker
       where (department,salary)in (select department,max(salary)
from worker group by department);
       

select *from worker;

select department,
   first_name,
   last_name,
    salary
from worker as w1
where salary=(
      select max (salary)
	  from worker as w2
	  where w1.department = w2.department);

