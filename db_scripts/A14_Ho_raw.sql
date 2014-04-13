-- Thuong Ho

\W    /* enable warnings! */

use a_bkorders;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
Select order_date as OrderDate
, Count(OrdHeaders.order_id) as NumberOrders
, sum(quantity * order_price) as AmntDue
, sum(quantity) as NumbBooksPurch
From a_bkorders.order_headers as OrdHeaders
Join a_bkorders.order_details as OrdDetails on OrdHeaders.order_id = OrdDetails.order_id
Group by OrderDate with Rollup;


/*  TASK 02 */
Select year(order_date) as Year
, month(order_date) as Month
, OrdHeaders.order_id as Order_ID 
, sum(quantity * order_price) as AmntDue
, sum(quantity) as NumbBooksPurch
From a_bkorders.order_headers as OrdHeaders
Join a_bkorders.order_details as OrdDetails on OrdHeaders.order_id = OrdDetails.order_id
Group by Year, Month, OrdHeaders.order_id with Rollup;


/*  TASK 03 */
-- format 2
Select coalesce(OrdYr, 'Grand Total') as Year
, case when OrdYr is null then '..........' else coalesce(OrdM, 'Year Total') end as Month
, case when OrdM is null then '...........' else coalesce(order_id, 'Month Total') end as Order_ID 
, AmntDue
, NumbBooksPurch
From (
	Select year(order_date) as OrdYr
	, month(order_date) as OrdM
	, order_id
	, sum(quantity * order_price) as AmntDue
	, sum(quantity) as NumbBooksPurch
	From a_bkorders.order_headers A
    Join a_bkorders.order_details using (order_id)
	Group by OrdYr, OrdM, order_id with Rollup) tbl;


/*  TASK 04 */
Select coalesce(OrdYr, 'Grand Total') as ''
, 'Yearly Total' as ''
, NumberOrders 
, AmntDue
, NumbBooksPurch
From (
	Select year(order_date) as OrdYr
	, count(order_id) as NumberOrders
	, sum(quantity * order_price) as AmntDue
	, sum(quantity) as NumbBooksPurch
	From a_bkorders.order_headers
    Join a_bkorders.order_details using (order_id)
	Group by OrdYr with Rollup) tbl;


/*  TASK 05 */
-- display all
Select author_id as AuthorID
, book_id as BookID
, quantity
, list_price
, order_price
From a_bkinfo.book_authors
Join a_bkinfo.books using (book_id)
Left Join a_bkorders.order_details using (book_id)
Where author_sequence = 1;

-- practice
Select author_id as AuthorID
, book_id as BookID
, sum(quantity)
, sum(order_price * quantity)
From a_bkinfo.book_authors
Join a_bkinfo.books using (book_id)
Left Join a_bkorders.order_details using (book_id)
Where author_sequence = 1
Group by author_id, book_id with Rollup;

-- convert to subquery -- choose this one
Select coalesce(author_id, 'All Authors') as AuthorID
, coalesce(book_id, 'All books') as BookID
, coalesce(tq, 0) as TotalQuantity
, coalesce(ts, 'No Sales') as TotalSales
From (
	Select author_id
	, book_id
	, sum(quantity) as tq
	, sum(order_price * quantity) as ts
	From a_bkinfo.book_authors
	Join a_bkinfo.books using (book_id)
	Left Join a_bkorders.order_details using (book_id)
	Where author_sequence = 1
	Group by author_id, book_id with Rollup) tbl;
	
-- test for zero
select author_id, author_sequence, A.book_id, quantity, order_price 
from a_bkorders.order_details A
join a_bkinfo.book_authors 
where order_price = 0.00;

select author_id, author_sequence, A.book_id, quantity, order_price 
from a_bkorders.order_details A
join a_bkinfo.book_authors 
where A.book_id = 2032;


/*  TASK 06 */
Select author_id as AuthorID
, book_id as BookID
, author_sequence
, coalesce(tq, 0) as TotalQuantity
, coalesce(ts, 'No Sales') as TotalSales
From (
	Select author_id
	, book_id
	, author_sequence
	, sum(quantity) as tq
	, sum(order_price * quantity) as ts
	From a_bkinfo.authors
	Join a_bkinfo.book_authors using (author_id)
	Left Join a_bkinfo.books using (book_id)
	Left Join a_bkorders.order_details using (book_id)
	Where author_sequence = 1
	Or author_sequence is null
	Group by author_id, book_id with Rollup) tbl;
	

-- test for no authors
Select book_id, author_id
From a_bkinfo.books
Left Join a_bkinfo.book_authors using (book_id);

-- use this -- recheck authors with no books
Select case when author_sequence is null then '_anon' else coalesce(author_id,'All Authors') end as AuthorID
, case when author_sequence is not null and author_id is not null then coalesce(book_id, 'All books') end as BookID
, coalesce(tq, 0) as TotalQuantity
, coalesce(ts, 'No Sales') as TotalSales
From (
	Select author_id
	, book_id
	, author_sequence
	, sum(quantity) as tq
	, sum(order_price * quantity) as ts
	From a_bkinfo.authors
	Left Join a_bkinfo.book_authors using (author_id)
	Right Join a_bkinfo.books using (book_id)
	Left Join a_bkorders.order_details using (book_id)
	Where author_sequence = 1
	Or author_sequence is null
	Group by author_id, book_id with Rollup) tbl;
	

/*  TASK 07 */
Select book_id as Book_ID
, page_count as Page_count
, (
	Select count(distinct page_count)
	From a_bkinfo.books as books2
	Where books2.page_count >= books1.page_count) as Rank
From a_bkinfo.books as books1
Order by Rank;

set @rank = 1;
set @bucket = 50;

Select book_id as Book_ID
, page_count as Page_count
, Rank
from (
	select 
		book_id, page_count
		, case when page_count > @bucket then @rank := (@rank + 1)
		  else @rank :=1
		  end as Rank
		, case when @bucket < page_count then @bucket:= (@bucket + 50)
		end as buk
		from a_bkinfo.books
		order by Rank ) tbl;

-- test -- this counts correctly
Select book_id as Book_ID
, page_count as Page_count
, (
	Select count((round(page_count,-2)))
	From a_bkinfo.books as books2
	Where books2.page_count >= books1.page_count) as Rank
From a_bkinfo.books as books1
Order by Rank;

Select book_id as Book_ID
, page_count as Page_count
, truncate(page_count,-1)
, (
	Select count(distinct (truncate(page_count,-1)))
	From a_bkinfo.books as books2
	Where truncate(books2.page_count,-1) >= truncate(books1.page_count,-1)) as Rank
From a_bkinfo.books as books1
Order by Rank;

-- another test
set @bucket := 50;
set @rank := 0;

Select book_id, page_count, Rank
From (
	select
	book_id, page_count
	, case when @bucket < page_count then @rank := @rank + 1
	else @rank:=1
	end as Rank
	, case when @bucket < page_count then @bucket := @bucket + 50
	else @bucket:= @bucket
	end as bk
From (
	Select book_id, page_count
	From a_bkinfo.books
	order by page_count) as tb1	
) tb2;


/*  TASK 08 */
Select Publ_ID, left(title,25) as Title, books1.page_count as Page_Count
, (
	Select count(distinct page_count)
	from a_bkinfo.books as books2
	Where books2.page_count <= books1.page_count
	and books2.publ_id = books1.publ_id
	and page_count > 0
	) as Rank
From a_bkinfo.books as books1
where page_count is not null
and page_count > 0
Order by publ_id, Rank;

-- test my own stuff
Select Publ_ID, left(title,25) as Title, books1.page_count as Page_Count
, (
	Select count(distinct page_count)
	from a_bkinfo.books as books2
	Where books2.page_count <= books1.page_count
	and books2.publ_id = books1.publ_id
	and page_count > 0
	) as Rank
From a_bkinfo.books as books1
where page_count is not null
and page_count > 0
and Rank in (1,2,3)
Order by publ_id, Rank;

-- test
set @publ := 0;
set @rank := 0;

Select Publ_ID, Title, Page_Count, Rank
From (
	Select Publ_ID, left(title,25) as Title, page_count as Page_Count
	, case when @publ = publ_id then @rank:=(@rank + 1)
	else @rank:=1
	end as Rank
	, case when @publ <> publ_id then @publ:=publ_id
	end as Brk
	From a_bkinfo.books
	order by publ_id, Rank
	) tbl;
	
-- another test
set @publ := 0;
set @rank := 0;

Select Publ_ID
, left(title,25) as Title, Page_Count
, find_in_set(
	page_count
	, (Select case when @publ <> publ_id then @publ:= publ_id end group_concat( distinct page_count order by page_count)
	from a_bkinfo.books)) as rank
From a_bkinfo.books	
order by publ_id, rank;

	, case when @publ = publ_id then @rank:=(@rank + 1)
	else @rank:=1
	end as Rank
	, case when @publ <> publ_id then @publ:=publ_id
	end as Brk
	
	
	) tbl;



/*  TASK 09 */
-- testing sum -- this test correctly
Select a1.order_date
, count(order_id)
, sum(quantity)
from (
	Select order_date, order_id, quantity
	from a_bkorders.order_headers
	join a_bkorders.order_details using (order_id)
	where order_date between '2012-09-01' and '2012-09-05') a1
group by a1.order_date;

-- adding intervals
Select a1.order_date
, count(a1.order_id)
, sum(a1.quantity)
, sum(a2.quantity)
from (
	Select order_date, order_id, quantity
	from a_bkorders.order_headers
	join a_bkorders.order_details using (order_id)
	where order_date between '2012-09-01' and '2012-09-30') a1
Join (
	Select order_date, order_id, quantity
	from a_bkorders.order_headers
	join a_bkorders.order_details using (order_id)
	where order_date between '2012-09-01' and '2012-09-30') a2
	on a2.order_date between date_sub(a1.order_date, interval 1 day) and date_add(a1.order_date, interval 1 day)
group by a1.order_date;

-- test by segment
Select a1.order_date
, count(a1.order_id)
, sum(a1.quantity)
from (
	Select order_date, order_id, quantity
	from a_bkorders.order_headers
	join a_bkorders.order_details using (order_id)
	where order_date between '2012-09-01' and '2012-09-30') a1
group by a1.order_date;

-- segment 2
Select distinct a1.order_date
, sum(a2.quantity)
from (
	Select order_date, order_id, quantity
	from a_bkorders.order_headers
	join a_bkorders.order_details using (order_id)
	where order_date between '2012-09-01' and '2012-09-30') a1
Join (
	Select order_date, order_id, quantity
	from a_bkorders.order_headers
	join a_bkorders.order_details using (order_id)
	where order_date between '2012-09-01' and '2012-09-30') a2
	on a2.order_date between date_sub(a1.order_date, interval 1 day) and date_add(a1.order_date, interval 1 day)
group by a1.order_date, a1.quantity
order by a1.order_date;

-- correct!
Select odDate as OrderDate
, o_ID as "3 Day Order Count"
, sum(a2.quantity) as "3 Day Total Quantity"
from (
	Select order_date as odDate, count(order_id) as o_ID
	from a_bkorders.order_headers
	join a_bkorders.order_details using (order_id)
	group by odDate
	) a1
Join (
	Select order_date, quantity
	From a_bkorders.order_headers
	Join a_bkorders.order_details using (order_id)
	) a2
	on a2.order_date between date_add(odDate, interval -1 day)
	and date_add(odDate, interval 1 day)
where month(odDate) = 9 and year(odDate) = 2012
group by odDate
order by odDate;


/*  TASK 10 */
set @startdate = '2012-09-01';
set @stopdate = '2012-09-30';

select a2.theDate as OrderDate
, coalesce(QO, 0) as QuantityOrdered
, coalesce(TS, 0.00) as TotalSales
from (
	Select theDate
	from
(
	select adddate(@startdate, numvalue) as theDate
	from
	( select b1.val + b2.val + b4.val + b8.val + b16.val + b32.val
		as numvalue
		from
		( select 0 val union all select 1) b1 cross join
		( select 0 val union all select 2) b2 cross join
		( select 0 val union all select 4) b4 cross join
		( select 0 val union all select 8) b8 cross join
		( select 0 val union all select 16) b16 cross join
		( select 0 val union all select 32) b32
	) as gennum
) calendar
where theDate between @startdate and @stopdate) a2
Left Join (
	Select order_date 
	, sum(quantity) as QO
	, sum(quantity * order_price) as TS
	From a_bkorders.order_headers
	Join a_bkorders.order_details using (order_id)
	Where month(order_date) = 9 and year(order_date) = 2012
	Group by order_date) a1 on a2.theDate=a1.order_date;
