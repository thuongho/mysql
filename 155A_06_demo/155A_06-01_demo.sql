use a_oe;



/*  demo 01	*/	
Select * 
From a_oe.credit_ratings
;

/*  demo 02	*/	
Select cust_id, credit_limit, rating
From a_oe.customers 
Join a_oe.credit_ratings on credit_limit between low_limit and high_limit
order by cust_id
;

/*  demo 03	*/	
Select cust_id, credit_limit, rating
From a_oe.customers
       , a_oe.credit_ratings 
Where credit_limit between low_limit and high_limit
order by cust_id
;

/*  demo 04	*/	
Select a_prd.products.prod_id, quoted_price, prod_list_price, ord_id
From a_oe.order_details od
Join a_prd.products on   od.prod_id = a_prd.products.prod_id 
   and   quoted_price > prod_list_price 
;

/*  demo 05	*/	
Select concat(m.emp_id, ' ' , m.name_last) as "Manager"
,         concat(e.emp_id, ' ' , e.name_last) as "Supervises"
From a_emp.employees e 
Left join a_emp.employees  m on  m.emp_id = e.emp_mng
Order by  `Manager`, `Supervises` 
;

/*  demo 06	*/	
Select emp_1.job_id
, emp_1.emp_id as emp1, emp_2.emp_id as emp2
From a_emp.employees emp_1  
Join a_emp.employees emp_2
   on  emp_1.job_id = emp_2.job_id
   and emp_1.emp_id < emp_2.emp_id
Order by emp_1.job_id, emp_1.emp_id, emp_2.emp_id;


/*  demo 07	*/	
Select 
  e1.emp_id, e1.salary ,' earns more than '
, e2.emp_id ,e2.salary 
From a_emp.employees e1 ,
     a_emp.employees e2
Where e1.salary > e2.salary
Order by  e1.salary desc, e1.emp_id
;

/*  demo 08	*/	
Select cust_id
, oh.ord_id
, prod_id
, quantity_ordered * quoted_price as "extprice"
From a_oe.order_headers oh
Join a_oe.order_details od on oh.ord_id = od.ord_id
Order by cust_id, oh.ord_id
;

/*  demo 09	*/	
Select oh.cust_id
, oh.ord_id
, od.prod_id
, od.quantity_ordered * od.quoted_price as "extprice"
From a_oe.order_headers oh
,    a_oe.order_details od
Where oh.ord_id = od.ord_id
order by oh.cust_id, oh.ord_id
;


