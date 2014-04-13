-- Thuong Ho

\W    /* enable warnings! */

-- Doesn't use db;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
Select book_id As 'Book_id', ROUND(Avg(order_price), 0) As 'AvgPrice', Count(quantity) As 'CopiesOrdered'
From a_bkorders.order_details
Group by book_id;

/*  TASK 02 */
Select topic_id As 'ID', topic_descr, Count(book_id) As 'NumberOfBooks', Coalesce(Format(Avg(list_price),2), 'n/a') As 'AvgListPrice'
From a_bkinfo.topics
Left Join a_bkinfo.book_topics using (topic_id)
Left Join a_bkinfo.books using (book_id)
Group by topic_id
Order by topic_id;
 
/*  TASK 03 */
Select Count(order_id) As 'NumberOrders', Count(Distinct cust_id) As 'NumberCustWithOrders'
From a_bkorders.order_headers
Where Year(order_date) = (Year(curdate()) - 1);

/*  TASK 04 */
Select Count(order_id) As 'NumberOrders', Count(Distinct cust_id) As 'NumberCustWithOrders'
From a_bkorders.order_headers
Where Month(order_date) IN ((Month(curdate()) - 1), (Month(curdate()) - 2));

/*  TASK 05 */
Set @topic = 'XML';

Select Count(order_id) As 'NumOrders Indicated Topic'
From a_bkorders.order_details
Join a_bkinfo.book_topics Using (book_id)
Where topic_id = @topic;

/*  TASK 06 */
Select Concat(publ_id, ' ', publ_name) As 'Publisher', Coalesce(Max(order_date), 'No Orders') As 'MostRecentOrder'
, Coalesce(Min(order_date), 'No Orders') As 'OldestOrder'
From a_bkinfo.publishers
Left Join a_bkinfo.books Using (publ_id)
Left Join a_bkorders.order_details Using (book_id)
Left Join a_bkorders.order_headers Using (order_id)
Group by publ_id;

/*  TASK 07 */
Select cust_id, cust_name_last, (order_price * quantity) As 'TotalCost'
From a_bkorders.customers
Join a_bkorders.order_headers Using (cust_id)
Join a_bkorders.order_details Using (order_id)
Group by cust_id;

/*  TASK 08 */
Select Concat(publ_id, ' ', publ_name) As 'Publisher'
From a_bkinfo.publishers
Join a_bkinfo.books Using (publ_id)
Join a_bkinfo.book_topics Using (book_id)
Join a_bkinfo.topics Using (topic_id)
Where topic_descr Regexp 'Programming'
-- Where topic_id = 'PGM'
Group by publ_id
Having Count(book_id) Between 4 And 10;

/*  TASK 09 */
Select Sum(case when topic_descr Regexp 'Science' then 1 else 0 end) 'Science'
, Sum(case when topic_descr Regexp 'Programming' then 1 else 0 end) 'Pgm'
, Sum(case when topic_descr Regexp 'Database Systems' then 1 else 0 end) 'DB/SQL'
, Sum(case when topic_descr Regexp 'Data Storage Techniques' then 1 else 0 end) 'Data Storage'
, Sum(case when topic_descr Regexp 'Literature' then 1 else 0 end) 'Fict/Poe'
, Count(book_id) As 'all Books'
From a_bkinfo.book_topics
Join a_bkinfo.topics Using (topic_id);

/*  TASK 10 */
Select concat(year(order_date), '-', Date_format(order_date, '%b')) As 'Year-month', Count(order_id) As 'NumberOrders', (quantity * order_price) As 'TotalSales'
From a_bkorders.order_headers
Join a_bkorders.order_details Using (order_id)
Group by concat(year(order_date), '-', Date_format(order_date, '%b'))
Order by year(order_date), month(order_date);

/*  TASK 11 */
Select CASE quarter(order_date)
	WHEN 1 THEN 'First Quarter'
	WHEN 2 THEN 'Second Quarter'
	WHEN 3 THEN 'Third Quarter'
	WHEN 4 THEN 'Fourth Quarter'
	END AS "SalesQuarter"
, Count(order_id) As 'NumberOfOrders'
From a_bkorders.order_headers
Group by CASE quarter(order_date)
	WHEN 1 THEN 'First Quarter'
	WHEN 2 THEN 'Second Quarter'
	WHEN 3 THEN 'Third Quarter'
	WHEN 4 THEN 'Fourth Quarter'
	END;