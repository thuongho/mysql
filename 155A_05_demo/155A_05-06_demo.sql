use a_testbed;

/*  Demo 01	*/
Select z_em_emp.d_id as "EM_Emp.d_id"
,        z_em_dept.d_id as "EM_Dept.d_id"
       , d_name
From z_em_dept LEFT JOIN z_em_emp ON z_em_dept.d_id = z_em_emp.d_id
Where z_em_emp.d_id IS NULL
;

/*  Demo 02	*/
Select z_em_emp.d_id  as "EM_Emp.d_id"
,        z_em_dept.d_id as "EM_Dept.d_id"
,        d_name
From z_em_dept LEFT JOIN z_em_emp ON z_em_dept.d_id = z_em_emp.d_id
Where z_em_dept.d_id IS NULL
;

/*  Demo 03	*/
Select d_id 
,        d_name
From z_em_dept LEFT JOIN z_em_emp Using(d_id)
Where d_id IS NULL
; 

/*  Demo 04	*/
Select z_em_emp.d_id as "EM_Emp.d_id"
,        z_em_dept.d_id as "EM_Dept.d_id"
,        d_name
From z_em_dept LEFT JOIN z_em_emp Using(d_id)
Where z_em_emp.d_id IS NULL
;

/*  Demo 05	*/
Select z_em_emp.d_id as "EM_Emp.d_id"
,        z_em_dept.d_id as "EM_Dept.d_id"
,        d_name
From z_em_dept LEFT JOIN z_em_emp ON z_em_dept.d_id = z_em_emp.d_id
;

/*  Demo 06	*/
Select cust_id
,         cust_name_last
,         ord_id
From a_oe.customers
left join a_oe.order_headers using(cust_id)
Where  cust_id between 404900 and 409030
and       ord_id IS NULL
order by cust_id
;

/*  Demo 07	*/
Select CS.cust_id
,          CS.cust_name_last
,          OH.ord_id
From a_oe.order_headers OH
left join  a_oe.customers CS on CS.cust_id = OH.cust_id
Where OH.cust_id is null
;


/*  Demo 08	*/
Select catg_id  as catg
,          prod_id  as p_id
,          prod_desc as product
,          prod_list_price as price
From a_prd.products 
left join  a_oe.order_details   using (prod_id) 
Where ord_id is null
order by   catg_id, prod_id 
;

/*  Demo 09	*/
Select catg_id
,          a_prd.products.prod_id
,          prod_name as product
,          quantity_on_hand
From a_prd.products 
left join  a_prd.inventory on a_prd.products.prod_id = a_prd.inventory.prod_id
Where a_prd.inventory.prod_id is null
or         quantity_on_hand = 0
order by   quantity_on_hand , catg_id, prod_id;

/*  Demo 10	*/

Select cust_id
,         cust_name_last
From a_oe.customers
Where  cust_id NOT IN  (
            Select cust_id 
            From a_oe.order_headers)
;

/*  Demo 11	*/
Select catg_id  as catg
, prod_id  as p_id
, prod_desc as product
, prod_list_price as price
From a_prd.products 
Where prod_id NOT IN  (
   Select prod_id 
   From a_oe.order_details
   )
order by catg_id, prod_id ;

/*  Demo 12	*/
Select emp_id
, name_last
, Ord_id
From a_emp.employees  
Left join a_oe.order_headers on emp_id = sales_rep_id
;

/*  Demo 13	*/
Select emp_id
, name_last
From a_emp.employees  
Left join a_oe.order_headers on emp_id = sales_rep_id
Where  ord_id is null
;

/*  Demo 14	*/
Select emp_id
, name_last
From a_emp.employees 
Where  emp_id NOT IN  (
   Select sales_rep_id 
   From a_oe.order_headers 
   );

/*  Demo 15	*/
Select emp_id
, name_last
From a_emp.employees 
Where  emp_id NOT IN  (
   Select sales_rep_id 
   From a_oe.order_headers 
   Where sales_rep_id is not null
   )
;
