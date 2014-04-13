use a_oe;

/*  demo 01  */
select emp_id
 , name_last as "Employee"
 , salary
from a_emp.employees
where salary = 12000 ;

/*  demo 02  */
select emp_id
 , name_last as "Employee"
 , salary
from a_emp.employees
where salary = 18888 ;

/*  demo 03  */
select loc_city
 , loc_street_address
from a_emp.locations
where loc_country_id = 'US' ;

/*  demo 04  */
select loc_city
 , loc_street_address
from a_emp.locations
where loc_city = 'SAN FRANCISCO' ;

/*  demo 05  */
select ord_id
 , cust_id
 , ord_mode
from a_oe.order_headers
where ord_date = '2011-12-15' ;

/*  demo 06  */
select prod_id
 , prod_name
 , catg_id
 , prod_warranty_period
from a_prd.products
where row( catg_id, prod_warranty_period ) = row( 'HW', 12 ) ;

/*  demo 07  */
select loc_city
 , loc_street_address
from a_emp.locations
where loc_country_id != 'US' ;

/*  demo 08  */
select job_id
 , max_salary
 , job_title
from a_emp.jobs
where max_salary < 60000 ;

/*  demo 09  */
select job_id
 , max_salary
 , job_title
from a_emp.jobs
where max_salary >= 60000 ;

/*  demo 10  */
select emp_id
 , name_last as "Employee"
 , salary
from a_emp.employees
where salary = '15000' ;

/*  demo 11  */
select emp_id
 , hire_date
from a_emp.employees
where hire_date < 34567 ;
