-- Thuong Ho

\W    /* enable warnings! */

use a_testbed;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  Functions  */
delimiter #

/*  NameFormat  */
Drop function if exists a_testbed.NameFormat#
 
create FUNCTION a_testbed.NameFormat (
	p_mode char(1)
	, lastname varchar(25)
	, firstname varchar(25)
) 
    RETURNS varchar(52)
BEGIN
    declare v_message varchar(52);

    if (firstname is null) then
      set v_message = lastname;
    elseif (p_mode = "F") then
      set v_message = concat(firstname, ' ', lastname);
    else
      set v_message = concat(lastname, ', ', firstname);
    end if;

    return v_message;
END;
#

-- test 
Select mode, lastname, firstname, a_testbed.NameFormat(mode, lastname, firstname)
From (
	Select "F" as mode
	, "Buns" as lastname
	, "Al" as firstname
	union all
	  Select "F", "Jetsons", null
	union all
	  Select "L", "Sims", "Bart"
	union all
	  Select "L", "Taylor", null
	union all
	  Select null, "James", "Jessie"
	union all
	  Select null, "Jetsons", null
	) as testtable1
#	


/*  InternalBlankCount  */
Drop function if exists a_testbed.InternalBlankCount#
 
create FUNCTION a_testbed.InternalBlankCount(
    in_string varchar(250)	
)
    RETURNS varchar(250)
BEGIN
    declare v_count varchar(250);
    declare v_trim varchar(250);
    declare v_srem varchar(250);
    
    if (coalesce(length(in_string), 0) > 0) then
      set v_trim = rtrim(ltrim(in_string));
      set v_srem = replace(v_trim, ' ', '');
      set v_count = length(v_trim) - length(v_srem);
    else
      set v_count = 0;
    end if;

    return v_count;    
END;
#

-- test
select string, a_testbed.InternalBlankCount(string)
From (
	Select 'hi world' as string
    union all
      Select 'This function has 4 spaces'
    union all
      Select ''
    union all
      Select null
    union all
      Select '  Check out the spaces before'
    union all
      Select 'Spaces after   '
    union all
      Select 'Five spaces in   string'
    ) as testtable2
#

/*  BookSize  */
Drop function if exists a_testbed.BookSize#
 
create FUNCTION a_testbed.BookSize(
    in_pages int	
)
    RETURNS varchar(25)
BEGIN
    declare v_message varchar(25);
    
    if (in_pages <= 200) then
      set v_message = "Mini";
	elseif (in_pages between 201 and 500) then
      set v_message = "Small";
	elseif (in_pages between 501 and 1000) then
      set v_message = "Medium";
    elseif (in_pages between 1001 and 1500) then
      set v_message = "Large";
    elseif (in_pages > 1500) then
      set v_message = "TooLong";
    else
      set v_message = "Invalid Input";
    end if;

    return v_message;
END;
#

-- test
Select pages, a_testbed.BookSize(pages)
From (
	Select 100 as pages
	union all
	  Select 200
	union all
	  Select 750
	union all
	  Select 1500
	union all
	  Select 20000
	union all
	  Select null
	/* union all
	  Select 'abc' */
	) as testtable3
#

/*  PrevMonth  */
Drop function if exists a_testbed.PrevMonth#
 
create FUNCTION a_testbed.PrevMonth(
    in_date date
    ,in_mn_count int	
)
    RETURNS varchar(25)
BEGIN
    declare v_date varchar(25);
    set in_mn_count = coalesce(in_mn_count,0);
    
    if (in_date is null) then
      set v_date = Date_Format(Date_sub(current_date, interval in_mn_count month), '%Y-%m');
    else
      set v_date = Date_Format(Date_sub(in_date, interval in_mn_count month), '%Y-%m');
    end if;

    return v_date;
END;
#

/*  PrevMonth v2 */
Drop function if exists a_testbed.PrevMonth#
 
create FUNCTION a_testbed.PrevMonth(
    in_date date
    ,in_mn_count int	
)
    RETURNS varchar(25)
BEGIN
    declare v_date varchar(25);
    set in_mn_count = coalesce(in_mn_count,0);
     
    if (in_date is null) then
      set in_date = current_date;
    else
      set in_date = in_date;
    end if; 

    set v_date = Date_format(Date_sub(in_date, interval in_mn_count month), '%Y-%m');   

    return v_date;
END;
#

/*  PrevMonth v3 */
Drop function if exists a_testbed.PrevMonth#
 
create FUNCTION a_testbed.PrevMonth(
    in_date date
    ,in_mn_count int	
)
    RETURNS varchar(25)
BEGIN
    declare v_date varchar(25);
    set in_mn_count = coalesce(in_mn_count,0);

    if (in_date is null) then
      set v_date = Date_Format(current_date, '%Y-%m');
    else
      set v_date = Date_Format(in_date, '%Y-%m');
    end if; 
Date_format(Date_sub(@rundate, interval 4 month), '%M %Y');
    set v_date = Date_sub(v_date, interval in_mn_count month);   

    return v_date;
END;
#

-- test
Select some_date, some_month, a_testbed.PrevMonth(some_date, some_month)
From (
  Select '2012-05-19' as some_date, 6 as some_month
  union all
    Select null, 5
  union all
    Select '2011-12-30', null
  union all
    Select null, null
	) as testtable4
#


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
#


/*  TASK 02 */
Select cust_id
, a_testbed.NameFormat("L", cust_name_last, cust_name_first) as formatted_name
From a_bkorders.customers
Order by cust_id
Limit 10;
#


/*  TASK 03 */
Select a_testbed.NameFormat("F", substring(title,1,25), concat(book_id,':')) as Book
From a_bkinfo.books
Limit 10;
#

Select replace(a_testbed.NameFormat("L", book_id, substring(title,1,25)), ',', ':') as Book
From a_bkinfo.books
Limit 10;
#


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
#


/*  TASK 05 */
Select pages, correct_category, a_testbed.BookSize(pages)
From (
	Select 0 as pages, "Mini" as correct_category
	union all
	  Select 200, "Mini"
	union all
	  Select 501, "Small"
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
#

/*  TASK 06 */
Select a_testbed.BookSize(page_count) as BookSize, Count(page_count)
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
#
-- new test
Select cust_id, order_date, Date_Format(order_date, '%Y-%m'), a_testbed.PrevMonth(current_date, 4)
From a_bkorders.order_headers
Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4)

Select cust_id, order_date, Date_Format(order_date, '%Y-%m'), a_testbed.PrevMonth(current_date, 5)
From a_bkorders.order_headers
Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 5)

Select cust_id, order_date, Date_Format(order_date, '%Y-%m'), a_testbed.PrevMonth(current_date, 6)
From a_bkorders.order_headers
Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 6)

Select cust_id, order_date, Date_Format(order_date, '%Y-%m'), a_testbed.PrevMonth(current_date, 4)
From a_bkorders.order_headers
Where cust_id in (
	Select cust_id 
	From a_bkorders.order_headers
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4));
	
-- one subquery
Select Distinct cust_id
From a_bkorders.order_headers
Where cust_id in (
	Select cust_id 
	From a_bkorders.order_headers
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4));
	
-- test for 2 months
Select distinct cust_id, c_name
From a_bkorders.order_headers
Where cust_id IN (
	Select cust_id 
	From a_bkorders.order_headers
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 5))
And cust_id IN (
	Select cust_id
	From a_bkorders.order_headers
	Where Date_format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4));

-- test 
Select c_id, c_name, Date_Format(order_date, '%Y-%m'), a_testbed.PrevMonth(current_date, 4)
From a_bkorders.bkv_custorders
Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4)

-- test a
Select c_id, c_name, Date_Format(order_date, '%Y-%m'), a_testbed.PrevMonth(current_date, 5)
From a_bkorders.bkv_custorders
Where c_id IN (
	Select c_id 
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 5))
And c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4));

-- test 1
Select distinct c_id, c_name, Date_Format(order_date, '%Y-%m'), a_testbed.PrevMonth(current_date, 4)
From (
	Select c_id, c_name, order_date
	From a_bkorders.bkv_custorders
	Where c_id in (
		Select c_id
		From a_bkorder.bkv_custorders
		Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4)
	) as sample;
	
select distinct c_id
from a_bkorders.bkv_custorders
Where c_id in (
	Select c_id
	from a_bkorders.bkv_custorders
	where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4))#


--test 2
Select c_id, c_name
From a_bkorders.bkv_custorders
Where c_id in (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 4))
And c_id in (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 5))#


-- test 3
Select c_id, c_name
From a_bkorders.bkv_custorders
Where c_id in (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 1))
And c_id in (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 2))
And c_id in (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_Format(order_date, '%Y-%m') = a_testbed.PrevMonth(current_date, 3));
#

/*  TASK 08 */
Select Count(order_id) as "Number of Orders", Count(Distinct cust_id) as "Number of Customers"
From a_bkorders.order_headers
Where Date_Format(order_date, '%Y-%m') IN ((a_testbed.PrevMonth(current_date, 1)),(a_testbed.PrevMonth(current_date, 2)));
