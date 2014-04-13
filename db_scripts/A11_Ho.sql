-- Thuong Ho

\W    /* enable warnings! */

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
Select C.cust_id, C.cust_name_last, Coalesce(H.OCount, 0) as 'number of orders'
From a_bkorders.customers C
Left join (
	Select cust_id, count(order_id) as OCount
    From a_bkorders.order_headers
    group by cust_id) H on C.cust_id = H.cust_id
Where C.cust_id <= 250000
Order by cust_id;


/*  TASK 02 */
Set @rundate = current_date;

Set @first_month = Date_format(Date_sub(@rundate, interval 15 month), '%M %Y');
Set @second_month = Date_format(Date_sub(@rundate, interval 14 month), '%M %Y');
Set @third_month = Date_format(Date_sub(@rundate, interval 13 month), '%M %Y');

Select cust_id, cust_name_last
From a_bkorders.customers
Where EXISTS (
	Select 'X'
	From a_bkorders.order_headers
	Where a_bkorders.order_headers.cust_id = a_bkorders.customers.cust_id
	and Date_format(order_date, '%M %Y') IN (@first_month, @second_month, @third_month))
Order by cust_id;

/*  TASK 03 */
Select author_name_first, author_name_last, author_id
From a_bkinfo.authors
Where NOT EXISTS (
	Select 'X'
	From a_bkinfo.book_authors A
	Join a_bkorders.order_details D on A.book_id = D.book_id);
	
-- authors with more than 1 book
Select author_id, bookcount
from 
   (select author_id, count(book_id) as bookcount
    from a_bkinfo.book_authors
    group by author_id) bk1
where bookcount > 1;

-- this gets the books with orders
-- book_id NOT IN 
Select book_id
From a_bkorders.order_details;

/*  TASK 04 */


/*  TASK 05 */


/*  TASK 06 */


/*  TASK 07 */



