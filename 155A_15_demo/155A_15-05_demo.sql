
-- Demo 01:	
set @rownum:= 0; 

select emp_id, dept_id, salary, @rownum:= @rownum + 1 as Ranking 
from   a_emp.adv_emp
order by salary
;


-- Demo 02:	
set @salarynum:= 0; 

select * 
from (
   select 
     emp_id
   , salary
   , year_hired
   , @salarynum:= @salarynum + 1 as RowNumber 
   from a_emp.adv_emp 
   order by salary
   ) tbl
order by year_hired desc;


-- Demo 03:	
set @dept := 0;
set @rank := 0;
select Dept_id, Emp_id, Salary, Rank 
from ( 
   select 
       Dept_id, Emp_id, Salary
     , case when @dept = dept_id then @rank := @rank +1 
       else @rank :=1 
       end as Rank
     , case when @dept <> dept_id then @dept:= dept_id 
       end as  Brk 
   from a_emp.adv_emp 
   order by dept_id, salary) tbl ;


-- Demo 04:	
select Emp_1.emp_id,  dept_id, Emp_1.salary, 
   (select count(distinct salary) 
    from   a_emp.adv_emp as Emp_2 
    where  Emp_2.salary >= Emp_1.salary
    and    dept_id = 30 )as Ranking 
from  a_emp.adv_emp as Emp_1
where dept_id = 30
order by ranking
;


-- Demo 05:	
select 
  Emp_1.emp_id
, dept_id
, Emp_1.salary
, (select count(distinct salary) 
   from   a_emp.adv_emp as Emp_2 
   where  Emp_2.salary > Emp_1.salary 
   and    dept_id = 30)as Ranking 
from  a_emp.adv_emp as Emp_1
where dept_id = 30
order by ranking;


-- Demo 06:	
select 
  Emp_1.emp_id
, dept_id
, Emp_1.salary
, (select count(distinct salary) 
   from  a_emp.adv_emp as Emp_2 
   where Emp_2.salary >= Emp_1.salary
   and   dept_id = 30  )as Ranking1 
, (select count(salary) 
   from   a_emp.adv_emp as Emp_2 
   where  Emp_2.salary >= Emp_1.salary 
   and    dept_id = 30)as Ranking2
from  a_emp.adv_emp as Emp_1
where dept_id = 30
order by ranking1
;


-- Demo 07:	
select 
  Emp_1.emp_id
, dept_id
, Emp_1.salary
, (select count(salary) 
   from a_emp.adv_emp as Emp_2 
   where Emp_2.salary > Emp_1.salary 
   and dept_id = 30) + 1 as Ranking2
from  a_emp.adv_emp as Emp_1
where dept_id = 30
order by ranking2
;


-- Demo 08:	
select 
group_concat(salary order by salary desc)  as salarylist 
from a_emp.adv_emp\G

-- demo 09
select 
group_concat(distinct salary order by salary desc)  as salarylist 
from a_emp.adv_emp\G

-- demo 10
SELECT 
  emp_id
 , salary
 , FIND_IN_SET( 
       salary
     , (SELECT GROUP_CONCAT( DISTINCT salary ORDER BY salary  DESC  )    
        FROM a_emp.adv_emp) ) as rank    
from  a_emp.adv_emp
order by rank;

-- demo 11
select 
  emp_id
 , salary
 , find_in_set( 
       salary
     , (select group_concat(salary order by salary  desc  )    
        from a_emp.adv_emp) ) as rank    
from  a_emp.adv_emp
order by rank
;



