
-- Demo 01:	
select dept_id, sum(salary), count(salary), count(emp_id)
from   a_emp.adv_emp 
group by dept_id;

-- Demo 02:	
select dept_id, sum(salary), count(salary), count(emp_id)
from   a_emp.adv_emp 
group by dept_id WITH ROLLUP
;

-- Demo 03:	
select concat("dept: " , coalesce(dept_id, 'All' ) ) as Dept
 ,     sum(salary) 
 ,     count(salary)
 ,     count(emp_id)
from   a_emp.adv_emp 
group by dept_id WITH ROLLUP
;

-- Demo 04:	
select concat("dept: " ,dept_id) as dept
 ,    sum(salary), count(salary), count(emp_id)
from  a_emp.adv_emp 
group by dept_id
union
select "dept: All"
 ,     sum(salary), count(salary), count(emp_id)
from a_emp.adv_emp
;

-- Demo 05:	
select salary,  count(emp_id)
from   a_emp.adv_emp 
group by salary WITH ROLLUP
;
select coalesce(salary, 'all') as salary,  count(emp_id)
from   a_emp.adv_emp 
group by salary WITH ROLLUP
;
select coalesce(lpad(salary,12,' '), 'All Salaries') as salary,  count(emp_id)
from   a_emp.adv_emp 
group by salary WITH ROLLUP
;

-- Demo 06:	
select truncate(salary, -4),  emp_id
from   a_emp.adv_emp
;

-- Demo 07
select salary_10K, count(emp_id) as NumbrEmp
from (
   select  truncate(salary, -4)as salary_10K, emp_id
   from   a_emp.adv_emp) tbl_trunc
group by salary_10K with rollup;

-- Demo 08
select salary_10K, NumbrEmp
from (
   select salary_10K, count(emp_id) as NumbrEmp
   from (
      select  truncate(salary, -4) as salary_10K, emp_id
      from   a_emp.adv_emp) tbl_trunc
      group by salary_10K with rollup) rolled;

-- Demo 09
select case
    when  salary_10K is null then '    Total'
    when  salary_10K =0  then 'Under 10K'
    else  lpad(format(salary_10K,0), 9, ' ') end as salary_10K , NumbrEmp
from (
   select salary_10K, count(emp_id) as NumbrEmp
   from (
      select  truncate(salary, -4) as salary_10K, emp_id
      from   a_emp.adv_emp) tbl_trunc
      group by salary_10K with rollup) rolled;
	  
-- Demo 10	  
Select dept_id, year_hired, sum(salary), count(salary), count(emp_id)
from   a_emp.adv_emp 
group by dept_id, year_hired WITH ROLLUP
;

-- Demo 11:	
select   cust_id, ord_id
,        sum( quantity_ordered * quoted_price) as AmntDue
,        sum( quantity_ordered) as NumberItems
from     a_oe.order_headers  
join     a_oe.order_details using (ord_id)  
where    ord_date between '2013-02-01' and '2013-02-28'
group by cust_id, ord_id
;

-- Demo 12:	
select   cust_id, ord_id
,        sum( quantity_ordered * quoted_price) as AmntDue
,        sum( quantity_ordered) as NumberItems
from     a_oe.order_headers  
join     a_oe.order_details using (ord_id)  
where    ord_date between '2013-02-01' and '2013-02-28'
group by cust_id, ord_id with rollup
;
-- Demo 12b- not so good:	
select   cust_id, ord_id
,        sum( quantity_ordered * quoted_price) as AmntDue
,        sum( quantity_ordered) as NumberItems
from     a_oe.order_headers  
join     a_oe.order_details using (ord_id)  
where    ord_date between '2013-02-01' and '2013-02-28'
group by  ord_id with rollup
;
-- Demo 12 c better:	
select case when ord_id is null then 'Total' else cust_id end as Customer
, coalesce(ord_id, 'Total') as order_id
, AmntDue, NumberItems
from (
select   cust_id, ord_id
,        sum( quantity_ordered * quoted_price) as AmntDue
,        sum( quantity_ordered) as NumberItems
from     a_oe.order_headers  
join     a_oe.order_details using (ord_id)  
where    ord_date between '2013-02-01' and '2013-02-28'
group by  ord_id with rollup) calc
;

-- demo 13
select coalesce(cust_id, 'Grand Total') as CustID
, case when cust_id is null then ' ' else coalesce(ord_id, 'Cust Total') end as OrderID
, AmntDue, NumberItems
from (
select   cust_id, ord_id
,        sum( quantity_ordered * quoted_price) as AmntDue
,        sum( quantity_ordered) as NumberItems
from     a_oe.order_headers  
join     a_oe.order_details using (ord_id)  
where    ord_date between '2013-02-01' and '2013-02-28'
group by cust_id, ord_id with rollup
) tbl
;

-- Demo 14	
select   cust_id, ord_id
,        sum( quantity_ordered * quoted_price) as AmntDue
,        sum( quantity_ordered) as NumberItems
from     a_oe.order_headers  
join     a_oe.order_details using (ord_id)  
where    ord_date between '2013-02-01' and '2013-02-28'
group by ord_id, cust_id  with rollup
;

-- Demo 15:	
select   year(ord_date), month(ord_date), ord_id
,        sum( quantity_ordered * quoted_price) as amntdue
,        sum( quantity_ordered) as NumberItems
from     a_oe.order_headers  
join     a_oe.order_details using (ord_id)  
group by year(ord_date), month(ord_date), ord_id with rollup;


-- Demo 16:	
select   year(ord_date), month(ord_date), ord_id
,        sum( quantity_ordered * quoted_price) as amntdue
,        sum( quantity_ordered) as NumberItems
from     a_oe.order_headers  
join     a_oe.order_details using (ord_id)  
group by year(ord_date), month(ord_date), ord_id with rollup
having ord_id is null;



