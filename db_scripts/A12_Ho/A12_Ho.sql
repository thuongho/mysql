-- Thuong Ho

\W    /* enable warnings! */

use a_testbed;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
select * from upd_animals;
select * from upd_services;
select * from upd_exam_headers;
select * from upd_exam_details;

/*  TASK 02 */
set @noncurrent = date_sub(current_date(), interval 18 month);
	
update upd_animals
Left Join upd_exam_headers using (an_id)
set an_status = 'NC'
Where an_id not in (
	Select an_id
	From upd_exam_headers 
	Where ex_date >= @noncurrent);

Select *
From upd_animals;


/*  TASK 03 */
Drop table if exists upd_nc_felines;

Create table upd_nc_felines as
Select an_id, an_name, max(ex_date) as 'rec_ex_date'
, round(sum(ex_fee), 2) as 'total_ex_fees'
From upd_animals 
Left Join upd_exam_headers using (an_id)
Left Join upd_exam_details using (ex_id)
Where an_status = 'NC'
And an_type = 'cat'
group by an_id;

Select * from upd_nc_felines;
-- this includes Mr. Whipples who should be in C but was set to NC as default


/*  TASK 04 */
Select an_id, an_name, ex_date
From upd_animals
Join upd_exam_headers using (an_id)
Where an_status = 'C';

/*  TASK 05 */
Select an_id, an_name, max(ex_date)
From upd_animals
Join upd_exam_headers using (an_id)
Where an_status = 'C'
group by an_id;

/*  TASK 06 */
replace into upd_services
Select * 
From upd_services_changes_1;

Select *
From upd_services
Order by srv_id;


/*  TASK 07 */
replace into upd_services
Select A.item_id as srv_id
, A.item_desc as srv_desc
, A.item_list_price as srv_list_price
From upd_services_changes_2 A
Where A.item_id not in (
	Select B.srv_id
	From upd_services B);
	
Select *
From upd_services
Order by srv_id;


/*  TASK 08 */
replace into upd_services
Select A.item_id as srv_id
, coalesce((case A.item_desc when '' then null else A.item_desc end), B.srv_desc) as srv_desc
, coalesce(A.item_list_price, B.srv_list_price) as srv_list_price
From upd_services_changes_3 A
join upd_services B on A.item_id = B.srv_id
Where A.item_id in (
	Select B.srv_id
	From upd_services B);

Select *
From upd_services
Order by srv_id;


/*  TASK 09 */
replace into upd_services
Select item_id as srv_id
, item_desc as srv_desc
, item_list_price as srv_list_price
From upd_services_changes_4
Where item_list_price Between 1 and 100;

Select *
From upd_services
Order by srv_id;

