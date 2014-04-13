use a_emp;



/*   demo 01  */
Select emp_id, name_last as "Employee"
From a_emp.employees
Where dept_id = 
         (Select dept_id 
          From a_emp.employees
          Where emp_id = 162)
;


/*   demo 02  */
Select emp_id, name_last as "Employee"
From a_emp.employees
Where dept_id = 
         (Select dept_id 
          From a_emp.employees
          Where emp_id = 162)
and      emp_id <> 162
;

/*   demo 03  */
Select emp_id, name_last as "Employee", salary
From a_emp.employees
Where salary > 
         (
          Select salary 
          From a_emp.employees
          Where emp_id = 162
          )
;


/*   demo 04  */
Select emp_id, name_last as "Employee", salary
From a_emp.employees
Where salary > 
         (
          Select salary 
          From a_emp.employees
          Where dept_id = 210
          )
          ;

/*   demo 05   */
Select distinct ord_id
From a_oe.order_details od
Join a_prd.products     pr on od.prod_id = pr.prod_id
Where catg_id = 'spg'
Order by ord_id
;


/*   demo 06  */
Select distinct ord_id
From a_oe.order_details
Where prod_id in (
         Select prod_id 
         From a_prd.products
         Where catg_id = 'spg')
Order by ord_id
;


