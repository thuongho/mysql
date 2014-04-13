use a_oe;

/*  demo 01  */
select a_prd.warehouses.warehouse_id
 , a_prd.warehouses.loc_id
from a_prd.warehouses ;

/*  demo 02  */
select warehouses.warehouse_id
 , warehouses.loc_id
from a_prd.warehouses ;

select warehouse_id
 , loc_id
from a_prd.warehouses ;

/*  demo 03  */
select wh.warehouse_id
 , wh.loc_id
from a_prd.warehouses wh;
select warehouse_id
 , loc_id
from a_prd.warehouses wh;

-- demo04  */
select emp_id
 , name_last as "Employee"
 , dept_name
from a_emp.employees
inner join a_emp.departments using( dept_id ) 
limit 10 ;

/*  demo 05  */
select cust_id
 , cust_name_last as "Customer"
 , ord_id
from a_oe.customers
inner join a_oe.order_headers using( cust_id )
order by cust_id 
limit 10 ;

/*  demo 06  */
select cust_id
 , cust_name_last as "Customer"
 , ord_id
 , prod_id
from a_oe.customers
inner join a_oe.order_headers using( cust_id )
inner join a_oe.order_details using( ord_id )
order by cust_id
 , ord_id 
 limit 10 ;
 
/*  demo 07  */
select cust_id
 , cust_name_last as "Customer"
 , ord_id
 , prod_id
 , prod_name
from a_oe.customers
join a_oe.order_headers using( cust_id )
join a_oe.order_details using( ord_id )
join a_prd.products using( prod_id ) 
limit 10 ;

/*  demo 08  */
select cust_id
 , ord_id
 , prod_id
 , prod_name
 , quoted_price
from a_oe.customers
join a_oe.order_headers using( cust_id )
join a_oe.order_details using( ord_id )
join a_prd.products using( prod_id )
join a_prd.categories using( catg_id )
where catg_desc in( 'APPLIANCES' ) 
limit 10 ;

/*  demo 09  */
select ord_id
 , cust_id
 , emp_id
 , name_last as "SalesRep"
from a_oe.order_headers oh
join a_emp.employees em on oh.sales_rep_id = em.emp_id 
limit 10 ;

/*  demo 10  */
select cs.cust_id
 , cust_name_last as "Customer"
 , ord_id
from a_oe.customers cs
join a_oe.order_headers oh on cs.cust_id = oh.cust_id 
limit 10 ;

/*  demo 11  */
select cs.cust_id
 , cs.cust_name_last as "Customer"
 , oh.ord_id
from a_oe.customers cs
join a_oe.order_headers oh on cs.cust_id = oh.cust_id 
limit 10 ;

/*  demo 12  */
select cs.cust_id
 , cs.cust_name_last as "Customer"
 , oh.ord_id
 , em.emp_id
 , em.name_last as "SalesRep"
from a_oe.customers cs
join a_oe.order_headers oh using( cust_id )
join a_emp.employees em on oh.sales_rep_id = em.emp_id 
limit 10 ;

/*  demo 13  */
select cs.cust_id
 , oh.ord_id
 , od.prod_id
 , pr.prod_name
 , od.quoted_price
from a_oe.customers cs
join a_oe.order_headers oh on cs.cust_id = oh.cust_id
join a_oe.order_details od on oh.ord_id = od.ord_id
join a_prd.products pr     on od.prod_id = pr.prod_id
join a_prd.categories ct   on pr.catg_id = ct.catg_id
where ct.catg_desc in( 'APPLIANCES' ) 
limit 10 ;

/*  demo 14  */
select a_oe.customers.cust_id, a_oe.order_headers.ord_id, a_oe.order_details.prod_id, a_prd.products.prod_name,a_oe.order_details.quoted_price
from  a_oe.customers  join  a_oe.order_headers on a_oe.customers.cust_id = a_oe.order_headers.Cust_id join a_oe.order_details  on a_oe.order_details.ord_id = a_oe.order_headers.ord_id  
join  a_prd.products  on a_oe.order_details.prod_id = a_oe.order_details.prod_id join a_prd.categories  on a_prd.categories.catg_id  = a_prd.products.catg_id  
where   a_prd.categories.catg_desc in( 'APPLIANCES' )
limit 10;


/*  demo 15  */
select *
from a_prd.warehouses w
join a_prd.inventory i on w.warehouse_id = i.warehouse_id limit 2;
select *
from a_prd.warehouses w
join a_prd.inventory i using( warehouse_id ) limit 2;