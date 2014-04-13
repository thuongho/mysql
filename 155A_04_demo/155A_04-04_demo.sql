use a_prd;

/*   demo 01  */	
Select emp_id, name_last as "Employee", hire_date, salary
From a_emp.employees
Where hire_date BETWEEN '2008-01-01' AND '2008-12-31'
;


/*   demo 02  */
Select emp_id, name_last as "Employee", hire_date, salary
From a_emp.employees
Where hire_date BETWEEN '2008-01-01' AND '2008-12-31'
   AND salary > 50000
;

/*   demo 03  */
Select job_id, min_salary, max_salary
From a_emp.jobs
Where job_id NOT LIKE '%Sales%'
   AND   min_salary > 40000
;

/*   demo 04  */	
Select emp_id, name_last as "Employee", salary From a_emp.employees
Where salary BETWEEN 12000 and 25000
Order by salary, emp_id
;

/*   demo 05  */	
Select emp_id, name_last as "Employee", salary  From a_emp.employees
Where salary > 12000
   AND salary < 25000
Order by salary, emp_id
;

/*   demo 06  */
Select emp_id, name_last as "Employee", salary  From a_emp.employees
Where salary < 12000
   AND salary > 25000
Order by salary, emp_id
;

/*   demo 07  */
Select emp_id, name_last as "Employee"
,	      hire_date, salary, job_id
From a_emp.employees
Where hire_date between '1985-01-01' AND '2005-12-31'
AND salary > 50000
AND job_id in (8, 16)
;

/*   demo 08  */
Select prod_id, prod_name, catg_id, prod_warranty_period
From a_prd.products 
Where row(catg_id, prod_warranty_period ) = row('HW', 12);

Select prod_id, prod_name, catg_id, prod_warranty_period
From a_prd.products 
Where catg_id= 'HW' and prod_warranty_period = 12;


/*   demo 09  */
Select emp_id, name_last as "Employee", dept_id 
From a_emp.employees
Where dept_id = 30
    OR   dept_id = 20
Order by `Employee`
;

/*   demo 10  */
Select emp_id, hire_date, salary, job_id
From a_emp.employees
Where salary > 50000
;

/*   demo 11  */
Select emp_id, hire_date, salary, job_id
From a_emp.employees
Where hire_date between '1985-01-01' AND '2005-12-31'
  OR   salary > 50000
;

/*   demo 12  */
Select emp_id, hire_date, salary, job_id
From a_emp.employees
Where hire_date between '1985-01-01' AND '2005-12-31'
  OR salary > 50000
  OR job_id in (8, 16)
;

/*   demo 13  */
Select job_id, job_title, min_salary, max_salary
From a_emp.jobs
Where max_salary >= 20000 
OR    max_salary is null
;

/*   demo 14  */
Select emp_id, name_last as "Employee", dept_id 
From a_emp.employees
Where NOT dept_id IN ( 30, 20)
Order by "Employee"
;

/*   demo 15  */
Select prod_id, prod_list_price, catg_id
From a_prd.products
Where catg_id = 'PET' or catg_id = 'SPG'
and   prod_list_price < 100
;

/*   demo 16  */
Select emp_id, name_last as  Employee, dept_id , salary
From a_emp.employees
Where dept_id =30
Or salary < 20000
Order by dept_id , salary;

/*   demo 17  */
Select emp_id, name_last as Employee, dept_id , salary
From a_emp.employees
Where dept_id =30
Xor  salary < 20000
Order by dept_id , salary;

			  
/*   demo 18  */
Select prod_id, prod_list_price, catg_id
From a_prd.products
Where catg_id = 'SPG' or catg_id = 'PET'
and      prod_list_price < 100
;


/*   demo 19  */
Select prod_id, prod_list_price, catg_id
From a_prd.products
Where (catg_id = 'SPG' or catg_id = 'PET')
and   prod_list_price < 100
;


/*   demo 20  */
Select prod_id, prod_list_price, catg_id
From a_prd.products
Where catg_id IN ( 'SPG', 'PET')
and   prod_list_price < 100
;

