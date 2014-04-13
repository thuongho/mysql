Use a_vets;

/*  Demo 01	*/
Select concat(ClientName, ' lives in ', cl_state )
From (
   Select concat(cl_name_last , ' ', cl_name_first) as ClientName
   , cl_state
   From vt_clients) tbl
;

use a_oe;

/*  demo 02	*/
Select ord_id
, ord_date
, itemTotal 
From (   
   Select 
     OH.ord_id      
   , OH.ord_date    
   , OD.quoted_price * quantity_ordered as itemTotal
   From  a_oe.order_headers OH
   join  a_oe.order_details OD on OH.ord_id = OD.ord_id
   join  a_prd.products     PR on OD.prod_id = PR.prod_id
   Where quoted_price > 0 and quantity_ordered > 0
  )rpt_base
Where ord_date < '2012-11-01'
;

/*  demo 03	*/
Select t_cust.cust_id
, cust_name
, prod_id
, ext_price
From (
   Select 
     cust_id
   , concat(cust_name_first , ' ' ,cust_name_last) as cust_name
   From a_oe.customers
   Where cust_name_first = 'William'
   ) t_cust 
join   (
   Select 
     OH.ord_id
   , ord_date
   , cust_id
   , prod_id
   , quoted_price * quantity_ordered as ext_price
   From a_oe.order_headers OH
   Join a_oe.order_details OD on OH.ord_id = OD.ord_id
   ) t_ord  on t_cust.cust_id = t_ord.cust_id
;

/*  demo 04	*/

Select cust_id
, cust_name_last
, prod_id
, ext_price
From a_oe.customers 
Join (
   Select OH.ord_id
   , ord_date
   , cust_id
   , prod_id
   , quoted_price * quantity_ordered as ext_price
   From a_oe.order_headers OH
   Join a_oe.order_details OD on OH.ord_id = OD.ord_id
   )  t_ord using (cust_id)
;

/*  demo 05	*/
Select cust_name 
From   (
   Select concat(cust_name_first , ' ' , cust_name_last) as cust_name 
   From (
      Select cust_id, cust_name_first, cust_name_last 
      From a_oe.customers
      Where cust_name_first = 'William'
      ) tnbl_1
   ) tbl2
;
