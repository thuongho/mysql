use a_prd;

/*  demo 01 */	
Create table a_testbed.z_wildcards   
( cust_id int
, cust_phone varchar(12)
, cust_address varchar(30) )
 engine=INNODB;

insert into a_testbed.z_wildcards   
   values (1, '510-239-8989',  '101 Bush Street');
insert into a_testbed.z_wildcards   
   values (2, '510-45-78785',  'One Bush Street');
insert into a_testbed.z_wildcards   
   values (3, '415-809-8989',  '124 High');
insert into a_testbed.z_wildcards   
   values (4, '415-124-2398',  '15 High Road');
insert into a_testbed.z_wildcards   
   values (5, '415-239-8523',  '1554 Rural Highway 12');

/*  demo 02 */	
select   cust_id, cust_address 
from     a_testbed.z_wildcards  
where    cust_Address LIKE '%Bush%'
;

/*  demo 03 */
select   cust_id, cust_phone 
]from     a_testbed.z_wildcards  
where    cust_phone LIKE '415%'
;

/*  demo 04 */	
select   cust_id, cust_phone 
from     a_testbed.z_wildcards  
where    cust_phone LIKE '%239%'
;

/*  demo 05 */
select   cust_id, cust_phone 
from     a_testbed.z_wildcards  
where    cust_phone LIKE '%-239-%'
;

/*  demo 06 */
select   cust_id, cust_address 
from     a_testbed.z_wildcards  
where    cust_address LIKE '%High%'
;

/*  demo 07 */
select   cust_id, cust_address 
from     a_testbed.z_wildcards  
where    cust_address LIKE '%High %'
;

/*  demo 08 */
Create table a_testbed.z_wild_nbr  
( col_id int not null
, col_test int(5) zerofill
);

Insert into a_testbed.z_wild_nbr   values ( 1, 25);
Insert into a_testbed.z_wild_nbr   values ( 2, 250);
Insert into a_testbed.z_wild_nbr   values ( 3, 25000);
Insert into a_testbed.z_wild_nbr   values ( 4, 250);
Insert into a_testbed.z_wild_nbr   values ( 5, 250);


/*  demo 09 */
select * 
from a_testbed.z_wild_nbr   


/*  demo 10 */
select * 
from a_testbed.z_wild_nbr   
where col_test like '%25%';


/*  demo 11 */
select * 
from a_testbed.z_wild_nbr   
where col_test like '25%';


/*  demo 12 */
Select *
From a_testbed.z_wild_nbr
Where col_test = 25;

/*  demo 13 */
Select col_test + 0 as col_test
From a_testbed.z_wild_nbr ;

/*  demo 14 */
select ex_id, ex_date
from  a_vets.vt_exam_headers
where ex_date like '2011%';

/*  demo 13 */
select ex_id, ex_date
from  a_vets.vt_exam_headers
where ex_date like '%06%';

/*  demo 16 */
select ex_id, ex_date
from  a_vets.vt_exam_headers
where ex_date like '%-06-%';





