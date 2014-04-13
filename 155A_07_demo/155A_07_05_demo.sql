use a_testbed;

/*   demo 01 */	
Select year('000731'), year (000731), year (731);

Select month('000731'), month (000731), month (731);

/*   demo 02 */
Select curdate(), current_date(), current_date;  /*   these are synonyms */

Select now();

/*   demo 03  */
select cast('2015-05-31' as date)
, cast('2015-05-31' as datetime);

/*   demo 04 */
Select 
   current_date
,  left(current_date,4) as Str1
,  substring(current_date,6,2) as Str2
,  substring(current_date,9,2) as Str3
,  right(current_date,2) as Str4;

/*   demo 05 */
Select 
   current_date
,  year(current_date) as Str1
,  month(current_date) as Str2
,  dayofmonth(current_date) as Str3;

/*   demo 06 */
set @d := '2011-02-20';
select Date_format(@d, '%Y/%m/%d'), Date_format(@d, '%M %D');

/*   demo 07 */
Select str_to_date( 'July 4, 2012', '%M %e, %Y');
Select str_to_date( 'July 4, 2012', '%M %e %Y');

/*   demo 08 */
Set @d = '2009-08-15';

select
YEAR(@d), MONTH(@d), WEEK(@d), DAYOFMONTH(@d),
DAYOFWEEK(@d), DAYOFYEAR(@d), 
MONTHNAME(@d), DAYNAME(@d)
\G

/*   demo 09 */
select   hire_date
,        EXTRACT(YEAR   FROM  hire_date) AS "YearHired"
,        EXTRACT(MONTH  FROM  hire_date) AS "MonthHired" 
,        EXTRACT(DAY    FROM  hire_date) AS "DayHired"
from     a_emp.employees
limit 4;

/*   demo 10 */	
select   emp_id, hire_date 
from     a_emp.employees
where    EXTRACT(MONTH FROM  hire_date) = 8
;

/*   demo 11 */	
select   emp_id, hire_date 
from     a_emp.employees
where    EXTRACT(YEAR FROM hire_date) = EXTRACT(YEAR FROM current_date() )
;

/*   demo 12 */
Set @d = '2011-08-15  20:15:33';
Select  @d
,       year(@d)  as year,    quarter(@d) as quarter
,       month(@d) as month,   day(@d)     as day
,       hour(@d)  as hour,    minute(@d)  as minute
; 

/*   demo 13 */
Select @d, dayName(@d), monthname(@d)
;
Select @d, dayofWeek(@d), weekday(@d) ;

show variables like 'default_week_format';

/*   demo 14 */
set @dtm = '2009-01-03';
Select week(@dtm) as m_default
,   week(@dtm,0) as m_0,    week(@dtm, 1) as m_1     
,   week(@dtm,2) as m_2,    week(@dtm, 3) as m_3
,   week(@dtm,4) as m_4,    week(@dtm, 5) as m_5
,   week(@dtm,6) as m_6,    week(@dtm, 7) as m_7;

/*   demo 15 */
set @dtm = '2009-01-10';
Select week(@dtm) as m_default
,   week(@dtm,0) as m_0,    week(@dtm, 1) as m_1     
,   week(@dtm,2) as m_2,    week(@dtm, 3) as m_3
,   week(@dtm,4) as m_4,    week(@dtm, 5) as m_5
,   week(@dtm,6) as m_6,    week(@dtm, 7) as m_7;

/*   demo 16 */
set @d = '2011-02-20';
select @d
,  Date_add(@d, interval 40 day)   as '40days'
,  Date_add(@d, interval 40 year)  as '40years'
,  Date_add(@d, interval 51 month) as '51months';

/*   demo 17 */
Select Date_add('2009-01-31', interval 1 month) as Jan31
,      Date_add('2009-01-28', interval 1 month) as Jan28;

/*   demo 18 */
set @d := '2011-02-20 19:55:09';
select @d
,  Date_add(@d , interval '4 3' year_month) as '4 years 3 months'
,  Date_add(@d , interval '2-23' day_hour)  as '2 days 23 hours'
;

/*   demo 19 */
set @d := '2011-02-20 ';
select @d
,  Date_add(@d, interval '-4 3' year_month) 
   as 'minus 4 years 3 months'
,  Date_add(@d, interval '-2' day) as 'minus 2 days'
;

/*   demo 20 */
set @d := '2011-02-20';
select @d
,  Date_sub(@d, interval 40 day)   as '40days'
,  Date_sub(@d, interval 40 year)  as '40years'
,  Date_sub(@d, interval 51 month) as '51months'
;

/*   demo 21 */
set @d = '2009-07-06' ;
select @d
,  SubDate(@d, interval 40 day)   as '40days'
,  SubDate(@d, 40)   as '40days'
;
			  
/*   demo 22 */
select @d
,  DateDiff(@d, '20090720')   as col_2
,  DateDiff(@d, '20090620')   as col_3
,  DateDiff(@d, '20070706')   as col_4
;

/*   demo 23 */
select  DateDiff('2009-07-06 23:59:59', '2009-07-07 00:00:01') ;

/*   demo 24 */
select   ord_id
,        ord_date 
from     a_oe.order_headers
where    dateDiff(date '2012-06-30', ord_date) between 25 and 50;

/*   demo 25 */
Select current_date()
, To_Days(current_date()) as NowCount
, TO_DAYS('2009-07-20') as "20090720"
, TO_DAYS('1066-10-14') as "btlHst"
, TO_DAYS('0079-08-24') as "MtVsv"
;

/*   demo 26 */
set @d1 := '2011-08-17';
set @d2 := '2011-12-17';

Select To_Days(@d2)- To_Days(@d1)
;

/*   demo 27 */
Select From_days(5), From_days(500), From_days(689798), From_days(733736);

/*   demo 28 */
set @d1 = '2011-03-25';
set @d2 = '2011-03-31';
select last_day(@d1), last_day(@d2);

select last_day (From_days(689798))

/*   demo 29 */
select now()
,      now() + 40   as Plus40
;

/*   demo 30 */
select curdate()
,      curdate()+ 40   as Plus40
,      Month(curdate()+ 40)   as Month40;

/*   demo 31 */
select now()
,      now()+ 4   as Plus4
,      Month(now()+ 4)   as Month4;

/*   demo 32 */
Select month ('2525-00-00');

/*   demo 33 */
set @d := '2011-02-20';
select @d
, Date_Add(@d, interval + 1 month);


/*   demo 34 */
  select @d
, cast(Date_Add(@d, interval + 1 month) as char(8)) as WorkingDate;

/*   demo 35 */
  select @d
, concat(cast(Date_Add(@d, interval + 1 month) as char(8)), '15') 
  as WorkingDate;


/*   demo 36 */
  select cast(ord_date as date) as OrderDate, 
  cast(concat(cast(Date_Add(ord_date, interval + 1 month) as char(8)), '15') as Date)
  as DueDate
  from a_oe.order_headers;
