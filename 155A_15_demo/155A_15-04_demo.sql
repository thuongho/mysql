
-- Demo 01:	
set @running_total=0; 

select emp_id, dept_id, salary, @running_total := @running_total + salary as RunningTotal 
from  a_emp.adv_emp 
order by dept_id, emp_id;

-- Demo 02	
set @accum = 0; 

select  emp_id, dept_id, salary, @accum := @accum + salary as RunningTotal 
from a_emp.adv_emp
order by salary, emp_id;



-- Demo 03:
set  @total := 0;
select dept_id, DeptTotal,  @total := @total + DeptTotal as RunningTotal 
from (select  dept_id, sum(salary)  as DeptTotal
      from a_emp.adv_emp
	  group by dept_id
     ) dt
order by dept_id;


-- Demo 04:	
select emp_1.emp_id,  emp_1.salary
     , sum(emp_2.salary) as RunningTotal 
from   a_emp.adv_emp emp_1
join   a_emp.adv_emp emp_2 on emp_2.emp_id <= emp_1.emp_id 
group by emp_1.emp_id
order by emp_1.emp_id
;

-- Demo 05:	
select  emp_1.emp_id, emp_1.salary
,    (select sum(emp_2.salary)
      from a_emp.adv_emp as Emp_2
      where emp_2.emp_id <= emp_1.emp_id) as RunningTotal
from a_emp.adv_emp emp_1
group by emp_1.emp_id
order by emp_1.emp_id
;


-- ----------------------
select dt_1.dept_id,  dt_1.DeptTotal
     , sum(dt_2.DeptTotal) as RunningTotal 
from   (select  dept_id, sum(salary)  as DeptTotal
        from a_emp.adv_emp
        group by dept_id
       ) dt_1
join   (select  dept_id, sum(salary)  as DeptTotal
        from a_emp.adv_emp
        group by dept_id
       ) dt_2 on dt_2.dept_id <= dt_1.dept_id 
group by dt_1.dept_id
order by dt_1.dept_id
;



-- Demo 06:	
select * 
from adv_sales
limit 10;

select   a1.sales_day
,        a1.sales
,        sum(a2.sales) as three_day_sum
from     a_oe.adv_sales a1
join     a_oe.adv_sales a2 
    on   a2.sales_day between  a1.sales_day and  date_add(a1.sales_day ,  interval 2 day)
group by a1.sales_day, a1.sales
order by a1.sales_day
;

-- Demo 07:	
select   a1.sales_day
,        a1.sales
,        sum(a2.sales) as three_day_sum
from     a_oe.adv_sales a1
join     a_oe.adv_sales a2 
    on   a2.sales_day between  a1.sales_day 
    and  date_add(a1.sales_day ,  interval 2 day)
    and a1.sales_day <= (select date_add(max(a3.sales_day) ,  interval -2 day) 
                         from a_oe.adv_sales a3)
group by a1.sales_day, a1.sales
order by a1.sales_day
;

-- demo 08
select   a1.sales_day
,        a1.sales
,        sum(a2.sales) as three_day_sum
from     a_oe.adv_sales a1
join     a_oe.adv_sales a2 
    on   a2.sales_day between  a1.sales_day and  date_add(a1.sales_day ,  interval 2 day)
    and a1.sales_day <= (select date_add(max(a3.sales_day) ,  interval -2 day) 
                        from a_oe.adv_sales a3)
where month(a1.sales_day) = 4 and year (a1.sales_day) = 2011
group by a1.sales_day, a1.sales
order by a1.sales_day
;

