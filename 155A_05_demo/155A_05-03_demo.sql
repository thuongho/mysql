use a_emp;

/*   Demo 01  */
select emp_id, dept_id, job_id 
from a_emp.employees
Order by dept_id, emp_id;


/*   Demo 02  */
select emp_id, dept_id, job_id 
from a_emp.employees
where job_id = 16
Order by dept_id, emp_id
;


/*   Demo 03  */
select emp_id, dept_id, job_id 
from a_emp.employees
where job_id = 16 or job_id = 32
Order by emp_id;


/*   Demo 04  */
select emp_id, dept_id, job_id 
from a_emp.employees
where job_id = 16 AND job_id = 32
Order by emp_id
;


/*   Demo 05  */
Select distinct dept_id
from a_emp.employees
where job_id = 16 ;


/*   Demo 06  */
Select distinct dept_id
from a_emp.employees
where job_id = 32 ;


/*   Demo 07  */
Select distinct dept_id
from a_emp.employees
where job_id = 16  or job_id = 32;


/*   Demo 08  */
Select distinct dept_id
from a_emp.employees
where job_id = 16  AND job_id = 32;

/*   Demo 09  */
select dept_id
From a_emp.departments
where dept_id in (
   select dept_id
   from a_emp.employees
   where job_id =16 )
and    dept_id in (
   select dept_id
   from a_emp.employees
   where job_id =32 );



/*   demo 10  */
Select oh.cust_id, ord_id, od.prod_id
from a_oe.order_headers oh 
join a_oe.order_details od using (ord_id)
where prod_id in (1050, 1060)
Order by oh.cust_id, ord_id, od.prod_id;



/*  demo 11  */
Select oh.cust_id, ord_id, od.prod_id
from a_oe.order_headers oh 
join a_oe.order_details od using (ord_id)
where prod_id = 1050
or   prod_id = 1060
Order by oh.cust_id, ord_id, od.prod_id;


/*   demo 12  */
Select oh.cust_id, ord_id, od.prod_id
from a_oe.order_headers oh 
join a_oe.order_details od using (ord_id)
where prod_id = 1050
and   prod_id = 1060
Order by oh.cust_id, ord_id, od.prod_id;

/*   demo 13  */
Select oh.cust_id, ord_id, od.prod_id
from a_oe.order_headers oh 
join a_oe.order_details od using (ord_id)
Order by ord_id;


/*   demo 14  */
Select oh.cust_id, ord_id
from a_oe.order_headers oh 
where ord_id in (
   select ord_id
   from a_oe.order_details od 
   where prod_id = 1050)
and ord_id in (
   select ord_id
   from a_oe.order_details od 
   where prod_id = 1060)
Order by oh.cust_id, ord_id;


/*   demo 15  */
Select cust_id
From a_oe.customers
Where cust_id  in (
   select cust_id
   from a_oe.order_headers oh 
   join a_oe.order_details od using (ord_id)
   where prod_id = 1050)
and cust_id  in (
   select cust_id
   from a_oe.order_headers oh 
   join a_oe.order_details od using (ord_id)
   where prod_id = 1060)
Order by cust_id;


