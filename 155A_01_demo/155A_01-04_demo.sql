Use a_testbed;
/* this includes the 8 zoo rows for assignment A01 */

/* demo 01 */

Drop Table If Exists zoo;

Create Table zoo (
  z_id integer Not Null
, z_name varchar(25) Null
, z_type varchar(25) Not Null
, z_cost decimal(7, 2) Unsigned Not Null
, z_dob datetime Not Null
, z_acquired date Not Null
)
Engine = Innodb;

/* demo 02 */
show tables;
desc zoo;
show columns from zoo;

/* demo 03 */
Select
  z_id
, z_name
, z_type
, z_cost
, z_dob
, z_acquired
From zoo;

/* demo 04 */
Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
  Values (23, 'Sam', 'Giraffe', 5000.00, '2002-05-15 10:45:00', '2002-05-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (25, 'Abigail', 'Armadillo', 490.00, '2010-05-15 08:30:00', '2010-04-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (56, 'Leon', 'Lion', 5000.00, '2009-02-25 15:00:00', '2011-01-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (57, 'Lenora', 'Lion', 5000.00, '2009-02-25 15:30:00', '2011-01-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (85, 'Sally Robinson', 'Giraffe', 5000.25, '2009-05-15 02:02:00', '2012-03-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (43, 'Huey', 'Zebra', 2500.25, '2012-06-02 02:02:00', '2012-06-02');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (44, 'Dewey', 'Zebra', 2500.25, '2012-06-02 02:10:00', '2012-06-02');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (45, 'Louie', 'Zebra', 2500.25, '2013-01-02 02:25:00', '2013-01-02');
  
  Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (47, Null, 'Horse', 490.00, '2010-05-15 08:30:00 ', '2010-04-15');

/* demo 05 */
Select
  z_id
, z_name
, z_type
, z_cost
From zoo
Where z_type = 'Armadillo';

/* demo 06 */
Select
  z_id
, z_name
, z_type
, z_cost
From zoo
Where z_cost = 5000;

/* demo 07 */
Select
  z_id
, z_name
, z_type
, z_cost
From zoo
Where z_type = 'Unicorn';