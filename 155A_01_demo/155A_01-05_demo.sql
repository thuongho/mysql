Use a_testbed;

/*  additional inserts */


  
Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired) 
 Values  (70, 'Anders', 'armadillo', 490.00, '2010-01-15 08:30:00', '2010-04-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (71, 'Anne', 'armadillo', 490.01, '2010-01-15 08:30:00', '2010-04-15');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (72, 'Leon', 'Lion', 1850.00, '2009-02-25 15:00:00', '2010-03-25');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (73, null, 'Lion', 1850.00, '2009-02-25 15:00:00', '2010-03-25');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (74, null, 'Lion', 1850.00, '2009-02-25 15:00:00', '2010-03-25');

Insert Into zoo (z_id, z_name, z_type, z_cost, z_dob, z_acquired)
  Values (75, '', 'Lion', 1850.00, '2009-02-25 15:00:00', '2010-03-25');
  


/*   demo 01  */
Select
  z_type
, z_name
From zoo;

/*   demo 02  */
Select
  z_dob
, z_cost
, z_name
From zoo;

/*   demo 03  */
Select  *
From zoo; 

/*   demo 04  */
Select
  z_id
, z_dob As birthdate
, z_cost As price
, z_name As name
From zoo;

/*   demo 05  */
Select
  z_id
, z_dob As "Date of Birth"
, z_cost As "Price $"
, z_name As "Name"
From zoo;

/*   demo 06  */
Select
  z_id
, z_dob As "BirthDate"
, z_cost As "Price"
, z_name As "Name"
From zoo
Order By z_cost;

/*   demo 07  */
Select
  z_id
, z_dob As "BirthDate"
, z_cost As "Price"
, z_name As "Name"
From zoo
Order By z_cost Desc;

/*   demo 08  */
Select
  z_type As "Type"
, z_cost As "Price"
, z_name As "Name"
From zoo
Order By z_type, z_cost;

/*   demo 09  */
Select
  z_type As "Type"
, z_cost As "Price"
, z_name As "Name"
From zoo
Order By z_type, z_cost Desc;

/*   demo 10  */
Select
  z_type As "Type"
, z_name As "Name"
From zoo
Order By z_name;

/*   demo 11  */
Select
  z_type As "Type"
, z_name As "Name"
From zoo
Order By z_name Desc;

/*   demo 12  */
Select
  z_id
, z_dob As "BirthDate"
, z_name As "Name"
From zoo
Order By z_dob Desc;

/*   demo 13  */
Select
  z_id
, z_dob As "Date of Birth"
, z_name As "Name"
From zoo
Order By `Date of Birth`;

/*   demo 14  */
Select
  z_id
, z_dob As "Date of Birth"
, z_name As "Name"
From zoo
Order By "Date of Birth";

/*   demo 15  */
Select
  z_id
, z_type
, z_name
From zoo
Order By 2, 3;

/*   demo 16  */
Select
  z_id
, EXTRACT(Month From z_dob) As "Birth Month"
, z_name As "Name"
From zoo
Order By EXTRACT(Month From z_dob);
