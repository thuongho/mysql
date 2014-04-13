-- Thuong Ho

\W    /* enable warnings! */

use a_testbed;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
delete
from zoo
where z_id > 100;

select *
from zoo;

/*  TASK 02 */
Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
  Values (147, 'Maggy', 'Hippo', 9000.00, '2007-02-14 00:47:00', '2009-06-13');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (148, 'Bob', 'Gorilla', 11000.00, '2012-05-20 11:37:00', '2013-04-11');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (149, 'Mike', 'Anaconda', 3000.00, '2004-03-09 18:23:00', '2013-07-03');

/*  TASK 03 */
Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
 Values  (133 , 'Larva', 'Bee', 50.00, '2011-05-12 22:47:10', '2011-05-12');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
 Values  (134, 'Antling', 'Ant', 45.00, '2011-05-13 12:47:15', '2011-05-13');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
 Values  (135, 'Duckling', 'Duck', 60.00, '2012-02-22 02:02:02', '2012-02-28');

insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
 values (122, 'Nathan','Tiger', 3000.00, '2008-10-26 08:00:00','2008-11-26');

insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
 values (112, 'Mark','Tiger', 3000.00, '2008-10-26 08:00:00','2008-11-26');

insert into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
 values (116, 'Jane','Tiger', 3500.00, '2009-06-27 08:00:00','2009-07-27');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
values (201, 'Alex', 'Bear', 8000, '1991-06-11 07:34:00', '2013-05-12');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
values (202, 'Patrick', 'Starfish', 20, '1995-07-05 05:55:00', '2013-05-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
values (203, 'Sandy', 'Squirrel', 55, '1994-08-04 04:44:00', '2013-05-19');



/*  TASK 04 */
select z_id, z_name, z_type, z_cost, z_dob, z_acquired
from zoo;

/*  TASK 05 */
SELECT z_type, z_name, z_cost
FROM zoo;

/*  TASK 06 */
SELECT z_type, z_name
FROM zoo
ORDER BY z_type, z_name;

/*  TASK 07 */
desc zoo;

/*  TASK 08 */
show tables;
