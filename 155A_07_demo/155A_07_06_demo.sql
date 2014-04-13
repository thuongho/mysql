Create table z_dates ( id int primary key, dtm date);
insert into z_dates values (1, '2010-02-28');
/*   this one fails */
insert into z_dates values (2, '2010-02-29');
ERROR 1292 (22007): Incorrect date value: '2010-02-29' for column 'dtm' at row 1
insert into z_dates values (3, '2010-02-00');
insert into z_dates values (4, '2010-00-00');
insert into z_dates values (5, '0000-00-00');
insert into z_dates values (6, '2010-04-29');
insert into z_dates values (7, '2010-00-29');
insert into z_dates values (8, '2010-04-00');
insert into z_dates values (9, '2010-04-15');
insert into z_dates values (10, '0000-04-29');

select * from z_dates;


/*   demo 01 */
select * from z_dates 
order by dtm;

/*   demo 02 */
Select * 
from z_dates 
where month(dtm) = 2;

/*   demo 03 */
Select * 
from z_dates 
where day(dtm) = 29;

/*   demo 04 */
Select id, dtm, month(dtm) 
from z_dates;

/*   demo 05 */
Select id, dtm, date_add(dtm, interval 5 day) 
from z_dates;

/*   demo 06 */
Select id, dtm, date_add(dtm, interval 5 month) 
from z_dates;

/*   demo 07 */
Select id, dtm, date_add(dtm, interval 15 month) 
from z_dates;

/*   demo 08
select id, dtm, Date_format( dtm, '%M %e, %Y') 
from z_dates; */

