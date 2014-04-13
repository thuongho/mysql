use a_testbed;

/*  demo 01  */
select z_name
 , z_cost
from zoo ;

/*  demo 02  */
select z_name
 , z_cost "Price more than 2K"
 , z_type
from zoo
where z_cost > 2000 ;

/*  demo 03  */
select z_dob
 , z_type
 , z_name
from zoo
where z_type = 'giraffe' ;

/*  demo 04  */
select z_name
 , z_cost "Price more than 20K"
 , z_type
from zoo
where z_cost > 20000 ;