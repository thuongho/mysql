/* Kenneth Posey */

\W    /* enable warnings! */

use   a_bkorders;

/*  TASK 00 */ 

select user(), current_date(), version(), @@sql_mode\G

/*  Task 01 */ 
select CU.cust_id
     , CU.cust_name_last
     , (
	     select count(OH.order_id)
	     from a_bkorders.order_headers OH
         where CU.cust_id = OH.cust_id 
	   ) as "number of orders"
 from a_bkorders.customers CU
where CU.cust_id <= 250000
group by CU.cust_id
order by CU.cust_id 
;

/*  Task 02 */ 
select  CU.cust_id
       ,CU.cust_name_last
from a_bkorders.customers CU
where EXISTS 
      (
	    select 1
		from a_bkorders.order_headers OH 
		where CU.cust_id = OH.cust_id
        and
	    (	 OH.order_date <= DATE_SUB((DATE_SUB(CURDATE(), INTERVAL 1 YEAR)), INTERVAL 1 MONTH)
		 and OH.order_date >= DATE_SUB((DATE_SUB(CURDATE(), INTERVAL 1 YEAR)), INTERVAL 3 MONTH)
	    )
	  )
order by CU.cust_id
;

/*  Task 03 */ 
/*I could not figure out how to do the exist on this on*/ 

select AU.author_name_first
      ,AU.author_name_last
      ,AU.author_id
from a_bkinfo.authors AU
where AU.author_id 
IN (select author_id
    from 
    (
     select count(BA.book_id)
            ,author_id
     from  a_bkinfo.book_authors BA
     where BA.author_id
     in
      (select AU2.author_id
       from a_bkinfo.authors AU2
       )
       group by BA.author_id
       Having count(BA.book_id) > 1
    ) MyTempTBL
  ) 
;

/*  Task 04 */ 


select book_id
from a_bkinfo.book_topic BT
where 
case topic_id = "MySQL" and 
;


/*  Task 05 */ 
/*  Task 06 */ 
select
order_date
order_id
,cust_id
,cust_name_last as "customer"
,sum(quantity) as "NumberBooks"
,sum(order_price)
from a_bkorders.customers
join a_bkorders.order_headers USING (cust_id)
join a_bkorders.order_details USING (order_id)
where YEAR(order_date) = YEAR(CURDATE())
and QUARTER(order_date) = 2
group by cust_id
;


/*  Task 07 */ 
select CU.cust_id
      ,CU.cust_name_last
from a_bkorders.customers CU
join a_bkorders.order_headers  using (cust_id)
join a_bkorders.order_details  using (order_id)
group by cust_id
HAVING count(cust_id) > 1
	
		 ;