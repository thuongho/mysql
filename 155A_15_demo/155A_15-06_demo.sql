-- demo 01
create table a_testbed.tblbook  ( bookid int, title varchar(25));
create table a_testbed.tbltopic ( bookid int, topic varchar(15));
insert into a_testbed.tblbook values (1, 'SQL for Fun and Profit'), (2, 'Gibson''s History');
insert into tbltopic values (1, 'SQL'), (1, 'Bus'),(2, 'History');


select bookid, title,topic 
from a_testbed.tblbook 
join a_testbed.tbltopic using(bookid);


select tblbook.bookid, title,topic 
from a_testbed.tblbook 
cross join a_testbed.tbltopic;


Drop table a_testbed.tblbook; Drop table a_testbed.tbltopic;


-- demo 02
select 0 as digit union  select 1 union  select 2 union  select 3 union  select 4 
union  select 5 union  select 6 union  select 7 union  select 8 union  select 9 

-- demo 03
Select *
from
(select 0 as digit union  select 1 union  select 2 union  select 3 union  select 4 
union  select 5 union  select 6 union  select 7 union  select 8 union  select 9 ) Ones
CROSS JOIN
(select 0 as digit union  select 1 union  select 2 union  select 3 union  select 4 
union  select 5 union  select 6 union  select 7 union  select 8 union  select 9 ) Tens;


-- demo 04
Select Ones.digit + 10 * Tens.digit
from
(select 0 as digit union  select 1 union  select 2 union  select 3 union  select 4 
union  select 5 union  select 6 union  select 7 union  select 8 union  select 9 ) Ones
CROSS JOIN
(select 0 as digit union  select 1 union  select 2 union  select 3 union  select 4 
union  select 5 union  select 6 union  select 7 union  select 8 union  select 9 ) Tens;


-- demo 05
select 0 val union  select 1;
select 0 val union  select 2;
select 0 val union  select 4;
select 0 val union  select 8;
select 0 val union  select 16;
select 0 val union  select 32;


-- demo 06
select *
FROM
(select 0 val union  all  select 1) b1
Cross join
(select 0 val union  all  select 2) b2 
Cross join
(select 0 val union  all  select 4) b4 
Cross join
(select 0 val union  all  select 8) b8
Cross join
(select 0 val union  all  select 16) b16
Cross join
(select 0 val union  all  select 32) b32
;


-- demo 07
select b1.val + b2.val + b4.val + b8.val + b16.val + b32.val
FROM
(select 0 val union  all  select 1) b1
Cross join
(select 0 val union  all  select 2) b2 
Cross join
(select 0 val union  all  select 4) b4 
Cross join
(select 0 val union  all  select 8) b8
Cross join
(select 0 val union  all  select 16) b16
Cross join
(select 0 val union  all  select 32) b32
;

-- demo 08
Create table nums (value int);
	
insert into nums
Select Ones.digit + 10 * Tens.digit
from
(select 0 as digit union  select 1 union  select 2 union  select 3 union  select 4 
union  select 5 union  select 6 union  select 7 union  select 8 union  select 9 ) Ones
CROSS JOIN
(select 0 as digit union  select 1 union  select 2 union  select 3 union  select 4 
union  select 5 union  select 6 union  select 7 union  select 8 union  select 9 ) Tens
;

-- demo 09
select NumValue, Concat ('Unit: ', NumValue)  as Units
From
(
select b1.val + b2.val + b4.val + b8.val + b16.val as NumValue
FROM
(select 0 val union  all  select 1) b1
Cross join
(select 0 val union  all  select 2) b2 
Cross join
(select 0 val union  all  select 4) b4 
Cross join
(select 0 val union  all  select 8) b8
Cross join
(select 0 val union  all  select 16) b16
) as GenNum
Where NumValue between 1 and 18
;

-- demo 10
set @startdtm  := '2012-08-15';
set @stopdtm   := '2012-12-19';

select semesterdate
from
(  select numvalue, adddate(@startdtm, numvalue)  as semesterdate
   from
  (  select b1.val + b2.val + b4.val + b8.val + b16.val + b32.val
     + b64.val + b128.val  as numvalue
    from
    (  select 0 val union  all  select 1) b1     cross join
    (  select 0 val union  all  select 2) b2     cross join
    (  select 0 val union  all  select 4) b4     cross join
    (  select 0 val union  all  select 8) b8     cross join
    (  select 0 val union  all  select 16) b16   cross join
    (  select 0 val union  all  select 32) b32   cross join
    (  select 0 val union  all  select 64) b64   cross join
    (  select 0 val union  all  select 128) b128 
  ) as gennum
) as calendar
where semesterdate between @startdtm  and @stopdtm
;


-- demo 11
set @startdtm  := '2012-08-15';
set @stopdtm   := '2012-12-19';


select semesterdate
from
(  select numvalue, adddate(@startdtm, numvalue)  as semesterdate
   from
  (  select b1.val + b2.val + b4.val + b8.val + b16.val + b32.val
     + b64.val + b128.val  as numvalue
    from
    (  select 0 val union  all  select 1) b1     cross join
    (  select 0 val union  all  select 2) b2     cross join
    (  select 0 val union  all  select 4) b4     cross join
    (  select 0 val union  all  select 8) b8     cross join
    (  select 0 val union  all  select 16) b16   cross join
    (  select 0 val union  all  select 32) b32   cross join
    (  select 0 val union  all  select 64) b64   cross join
    (  select 0 val union  all  select 128) b128 
  ) as gennum
) as calendar
where semesterdate between @startdtm  and @stopdtm
and dayname(semesterdate) in ('Sunday', 'Saturday')
;


-- demo 12
select distinct ord_date 
from a_oe.order_headers
where year(ord_date) = 2012 and month(ord_date) = 12;

-- demo 13
-- calendar for dec 2012
set @startdtm  := '2012-12-01';
set @stopdtm   := '2012-12-31';

select theDate as NoSalesDates
from 
(
   select adddate(@startdtm, numvalue)  as theDate
   from
   (  select b1.val + b2.val + b4.val + b8.val + b16.val + b32.val
      as numvalue
      from
      (  select 0 val union  all  select 1) b1     cross join
      (  select 0 val union  all  select 2) b2     cross join
      (  select 0 val union  all  select 4) b4     cross join
      (  select 0 val union  all  select 8) b8     cross join
      (  select 0 val union  all  select 16) b16   cross join
      (  select 0 val union  all  select 32) b32   
   ) as gennum
) calendar
where theDate between @startdtm  and @stopdtm
and   theDate not in (
   select ord_date 
   from a_oe.order_headers)
;
