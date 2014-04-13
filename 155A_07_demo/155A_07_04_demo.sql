use a_testbed;

/*   Demo 01 */	
select   A
,        GREATEST(B,C,D,E,F)
,        LEAST(B, C, D, E,F) 
from     a_testbed.z_tst_numbers;

/*   Demo 02 */	
Select greatest(4, 45.78, 9);

/*   Demo 03 */
Select greatest( 'p', 4, 45.78, 9);

/*   Demo 04 */	
Select least( 'p', 4, 45.78, 9);

/*   Demo 05 */	
select   ord_id
,        prod_id 
,        quoted_price
,        prod_list_price            
from     a_oe.order_details  
  join   a_prd.products using (prod_id)
where    GREATEST(quoted_price, prod_list_price) > (prod_list_price)
;

/*   Demo 06 */
Select if(curdate() > '1888-08-08', 'passed the test', 'this is really old');

Select if(month(curdate()) in (6,7,8), 'Summer!', 'Not summer');

Select if( 5 > null, 'passed the test', 'nulls make unknown values');

/*   Demo 07 */
select   catg_id, prod_id, prod_list_price
,        if(catg_id IN('PET','SPG'), 0.95, 1) as "Price Multiplier"
from     a_prd.products products
order by prod_id
;

/*   Demo 08 */
select   catg_id, prod_id, prod_list_price
,        if(catg_id IN('PET','SPG'), 0.95, if(catg_id IN('APL'), 0.90, 1)
) as "Price Multiplier"
from     a_prd.products products
order by prod_id
; 

