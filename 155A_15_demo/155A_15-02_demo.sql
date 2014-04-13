use a_emp;

-- Demo 01:	
Select emp_id, name_last, mng, dept_id, year_hired, salary
from a_emp.adv_emp 
order by dept_id, emp_id;


-- demo 02
Select dept_id, Sum(salary), Avg(salary)
from a_emp.adv_emp 
group by dept_id
order by dept_id;


--demo 03 
select Avg(salary) 
from a_emp.adv_emp 
where dept_id = 215;
		  
-- demo 04		  
select   emp_id, salary
,        salary - 
        ( select Avg(salary) 
		  from a_emp.adv_emp 
		  where dept_id = 215)  
         as Over_under_avg
from    a_emp.adv_emp
where   dept_id = 215
;

-- demo 05
set @avgsal = (
    select Avg(salary) 
	from a_emp.adv_emp 
	where dept_id = 215);
	 
select  
  emp_id, salary
, salary - @avgsal  as Over_under_avg
from  a_emp.adv_emp
where dept_id = 215
;
 -- demo 06  
select  emp_id, salary
,   (salary - AvgDept215) as Over_under_avg
from   a_emp.adv_emp
cross join  (
   select Avg(salary )  as AvgDept215
   from   a_emp.adv_emp 
   where dept_id = 215  ) avgSal
where   dept_id = 215;



-- demo 07
select   
   emp_id, dept_id, salary
,  salary - (
      select Avg(salary) 
      from a_emp.adv_emp 
      )  as Over_under_avg
from  a_emp.adv_emp
order by dept_id, salary;

select avg(salary) from a_emp.adv_emp;


-- demo 08
select   
   dept_id, emp_id, salary
,  salary - (
       select avg(salary) 
       from a_emp.adv_emp 
       where dept_id = OTR.dept_id
       ) as Over_under_avg
from  a_emp.adv_emp OTR
order by dept_id, salary
;


-- demo 09
select EmpLevel.dept_id, emp_id, salary, salary - avgSalary
from a_emp.adv_emp as EmpLevel
join (
    select  dept_id, avg(salary)  as avgSalary
    from  a_emp.adv_emp
    group by dept_id) as DeptLevel
    on EmpLevel.dept_id = DeptLevel.dept_Id
order by dept_id, salary;



-- demo 10
Select
  dept_id,emp_id,  salary
, salary / (
     select sum(salary) 
     from a_emp.adv_emp 
     where dept_id = OTR.dept_id
     ) as Over_under_avg
from  a_emp.adv_emp OTR
order by dept_id, salary;


-- demo 11
select  
   dept_id,emp_id,  salary
,  round(100 * salary / (
      select sum(salary) 
      from a_emp.adv_emp 
      where dept_id = OTR.dept_id
      ),0
      ) as Percent
from  a_emp.adv_emp OTR
order by dept_id, salary
;


-- demo 12
select 
  EmpLevel.dept_id
, emp_id, salary
, TotDeptSalary
, Round(100 * salary/totDeptSalary, 0) as PercOfDept
from a_emp.adv_emp as EmpLevel
join  (
   select dept_id, sum(salary)  as TotDeptSalary
   from a_emp.adv_emp
   group by dept_id) 
   as DeptLevel
on EmpLevel.dept_id = DeptLevel.dept_Id
order by EmpLevel.dept_id, EmpLevel.salary  ;




;