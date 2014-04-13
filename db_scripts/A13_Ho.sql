-- Thuong Ho

\W    /* enable warnings! */

use a_testbed;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G


/*  TASK 01 */
Select mode, lastname, firstname, should_display
, a_testbed.NameFormat(mode, lastname, firstname)
From (
	Select "F" as mode
	, "Buns" as lastname
	, "Al" as firstname
	, "Al Buns" as should_display
	union all
	  Select "F", "Jetsons", null, "Jetsons"
	union all
	  Select "L", "Sims", "Bart", "Sims, Bart"
	union all
	  Select "L", "Taylor", null, "Taylor"
	union all
	  Select null, "James", "Jessie", "James, Jessie"
	union all
	  Select null, "Jetsons", null, "Jetsons"
	) as testtable1;


/*  TASK 02 */
Select cust_id
, a_testbed.NameFormat("L", cust_name_last, cust_name_first) as formatted_name
From a_bkorders.customers
Order by cust_id
Limit 10;


/*  TASK 03 */
Select a_testbed.NameFormat("F", substring(title,1,25), concat(book_id,':')) as Book
From a_bkinfo.books
Limit 10;

Select replace(a_testbed.NameFormat("L", book_id, substring(title,1,25)), ',', ':') as Book
From a_bkinfo.books
Limit 10;


/*  TASK 04 */
select string, no_of_spaces, a_testbed.InternalBlankCount(string)
From (
	Select 'hi world' as string, 1 as no_of_spaces
    union all
      Select 'This function has 4 spaces', 4
    union all
      Select '', 0
    union all
      Select null, 0
    union all
      Select '  Check out the spaces before', 4
    union all
      Select 'Spaces after   ', 1
    union all
      Select 'Five spaces in   string', 5
    ) as testtable2;


/*  TASK 05 */
Select pages, correct_category, a_testbed.BookSize(pages)
From (
	Select 0 as pages, "Mini" as correct_category
	union all
	  Select 200, "Mini"
	union all
	  Select 500, "Small"
	union all
	  Select 750, "Medium"
	union all
	  Select 1500, "Large"
	union all
	  Select 20000, "Too Long"
	union all
	  Select null, "Invalid Input"
	/* union all
	  Select 'abc' */
	) as testtable3;
	

/*  TASK 06 */
Select a_testbed.BookSize(page_count) as BookSize, Count(page_count) as NumBooks
From a_bkinfo.books
Group by BookSize
Order by CASE BookSize
  WHEN 'Mini' THEN '1'
  WHEN 'Small' THEN '2'
  WHEN 'Medium' THEN '3'
  WHEN 'Large' THEN '4'
  WHEN 'TooLong' THEN '5'
  ELSE '9999'
  END,
  BookSize;
#
-- do we need to remove Invalid Input?


/*  TASK 07 */
-- some reason this doesn't work
Select c_id, c_name
From a_bkorders.bkv_custorders
Where c_id in (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 6))
And c_id in (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 5))
And c_id in (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4));

-- a simple query works properly
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4);

-- for some reason, a subquery breaks it.
Select distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id in (
	Select c_id 
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4));
	
	
-- another test to make sure function works
Select some_date, some_month, a_testbed.PrevMonth(some_date, some_month)
From (
  Select '2012-05-19' as some_date, 6 as some_month
  union all
    Select null, 5
  union all
    Select '2011-12-30', null
  union all
    Select null, null
	) as testtable4;


/*  TASK 08 */
Select Count(order_id) as "Number of Orders", Count(Distinct cust_id) as "Number of Customers"
From a_bkorders.order_headers
Where Date_Format(order_date, '%Y-%m') IN ((a_testbed.PrevMonth(current_date, 1)),(a_testbed.PrevMonth(current_date, 2)));
