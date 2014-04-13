use a_prd;

/*   Demo 01 */	
select   catg_id, prod_id, prod_list_price
,        CASE 
             WHEN catg_id ='PET'   THEN 0.95
             WHEN catg_id ='SPG'   THEN 0.95
             WHEN catg_id ='APL'   THEN 0.90
         ELSE  1 
         END  as "Price Multiplier"
from     a_prd.products
order by catg_id
;


/*   Demo 02 */	
select   catg_id, prod_id, prod_list_price
,        CASE 
             WHEN catg_id ='PET'   THEN 0.95
             WHEN catg_id ='SPG'   THEN 0.95
             WHEN catg_id ='APL'   THEN 0.90
         ELSE  1 
         END  * prod_list_price AS "Today's Price"  
from     a_prd. products
order by catg_id
; 


/*   Demo 03 */
select   catg_id, prod_id, prod_list_price
,        CASE 
             WHEN catg_id ='PET'   THEN 0.95
             WHEN catg_id ='SPG'   THEN 0.95
             WHEN catg_id ='APL'   THEN 0.90
         END  * prod_list_price AS "Today's Price"  
from     a_prd.products
order by catg_id;

/*   demo 04 */
select   catg_id, prod_id, prod_list_price
,        CASE 
             WHEN catg_id ='PET'   THEN 0.95
             WHEN catg_id ='SPG'   THEN 0.95
             WHEN catg_id ='APL'   THEN 0.90
         ELSE  'no discount' 
         END  "Savings %"  
from     a_prd.products
order by catg_id;

/*   demo 05 */
select   catg_id, prod_id, prod_list_price
,        CASE 
             WHEN catg_id ='PET'   THEN 0.95
             WHEN catg_id ='SPG'   THEN 0.95
             WHEN catg_id ='APL'   THEN 0.90
         ELSE  'no discount' 
         END  * prod_list_price as "Today's Price %"  
from     a_prd.products
order by catg_id;

/*   demo 06 */
select   catg_id, prod_id, prod_list_price
,      Round(  CASE 
             WHEN catg_id ='PET'   THEN 0.95
             WHEN catg_id ='SPG'   THEN 0.95
             WHEN catg_id ='APL'   THEN 0.90
         ELSE  1 
         END  * prod_list_price, 2 ) AS "Today's Price"  
from     a_prd.products
order by catg_id
; 

/*   Demo 07 */	
select   catg_id, prod_id, prod_list_price
,        CASE 
             WHEN prod_list_price < 50 THEN 1
             WHEN catg_id ='PET'   THEN 0.95
             WHEN catg_id ='SPG'   THEN 0.95
             WHEN catg_id ='APL'   THEN 0.90
         ELSE  1 
         END  * prod_list_price AS "Today's Price"  
from     a_prd.products
order by catg_id
; 

/*   Demo 08	 */
select   catg_id, prod_id, prod_list_price
,        CASE 
         WHEN catg_id ='PET'   THEN 
           CASE 
           WHEN prod_list_price < 10 THEN 'LowCost pet item'
           ELSE 'HighCost pet item'
           END
        WHEN catg_id ='SPG'   THEN 
           CASE 
           WHEN prod_list_price < 25 THEN 'LowCost sports item'
           WHEN prod_list_price between 25 and 150 THEN 'MidCost sports item'
           ELSE 'HighCost sports item'
           END
        WHEN catg_id ='APL'   THEN 'appliance item'
        END  AS "Result"  
from    a_prd.products
order by prod_id
; 

/*   Demo 09 */
select   cust_id, credit_limit
,        CASE
              WHEN credit_limit >= 10001  THEN 'Superior'
              WHEN credit_limit >=  5001  THEN 'Excellent'
              WHEN credit_limit >=  2001  THEN 'High'
              WHEN credit_limit >=  1001  THEN 'Good'
         ELSE 'Standard'
         END  AS  Rating
from     a_oe.customers
;


/*   Demo 10 */
select   catg_id, prod_id, prod_list_price
,        CASE catg_id
              WHEN 'PET'   THEN 0.95
              WHEN 'SPG'   THEN 0.95
              WHEN 'APL'   THEN 0.90
         ELSE  1 
         END  * prod_list_price AS "Today's Price"  
from     a_prd.products
; 


/*   Demo 11 */
select   ord_id, date_format(ord_date, '%Y/%m/%d') AS OrderDate
,        CASE quarter(ord_date)
              WHEN 1   THEN 'winter'
              WHEN 2   THEN 'spring'
              WHEN 3   THEN 'summer'
              WHEN 4   THEN 'fall'
         END   AS "Season"  
from     a_oe.order_headers 
;


/*   Demo 12 */
select   catg_id, prod_id, prod_list_price
from     a_prd.products
order by CASE catg_id
              WHEN 'PET'   THEN '1'
              WHEN 'SPG'   THEN '2'
              WHEN 'APL'   THEN '3'
              WHEN 'HW'    THEN '4'
         ELSE  '9999' 
         END,
         catg_id, prod_id
; 
