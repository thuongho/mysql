use a_testbed;

Create table z_numbers ( A integer, B integer, C integer, D integer, E integer, F integer);
insert into z_numbers values ( 1,   10,   10,   50,   90,   45 );
insert into z_numbers values ( 2,   15,    5, null,   10,    0 );
insert into z_numbers values ( 3, null, null,  50,   50,   -1 );
insert into z_numbers values ( 4, null, null, null, null, null );
insert into z_numbers values ( 5, 0, 0, 0, 0, 0 );
insert into z_numbers values ( 6, 10, 10, 10, 10, 10 );
insert into z_numbers values ( 7, -10, 10, 0, -210, 85 );
insert into z_numbers values ( 8, -10, null, 0, -210, 85 );
insert into z_numbers values ( 9, 200, 3, 0, 200, 85 );
insert into z_numbers values ( 10, 200, 200, 0, 5, 46 );


/*   Demo 01	 */
select  A, COALESCE(B,C,D,E), COALESCE(B,9999) 
from    z_numbers
;
select  A, COALESCE(B,0), COALESCE(D,0) 
from    z_numbers
;
/*   Demo 02 */	
select  A
,       B, IFNULL(B,87)  as B_Null
,       D, IFNULL(D,0)   as D_Null
from    z_numbers
;

/*   Demo 03 */
select  A
,       IFNULL(B, IFNULL(C, IFNULL(D, E) ) )  as Result
from    z_numbers
;

/*   Demo 04 */	
Select A, B, C, nullif(B,C) 
from   z_numbers
;

/*   Demo 05 */	
select   A, F, NULLIF(F, -1) 
from     z_numbers
;

/*   Demo 06 */
select   A, B
,        NULLIF(B, 200) 
,        D
,        NULLIF(85, F) 
from     z_numbers
;

/*   Demo 07 */
select   A, B
,        NULLIF(0, B - B)  as Flipped
from     z_numbers
;

/*   Demo 08 */
select D from z_numbers ;


select D from z_numbers where D is not null;
Select A, B, IsNull(B)
From   z_numbers
;
Select avg(D), avg( nullif(D,0))
from z_numbers;

/*   Demo 09 */
Select A, B
From   z_numbers
Where IsNull(B)
;
/*   demo 10 */
Select A, B
From   z_numbers
Where B is null;


/*   demo 11 */
Select A, B
From   z_numbers
where 56;

Select A, B
From   z_numbers
where 0;

/*   Demo 12 */
select an_id, an_name, an_type 
from a_vets.vt_animals
order by an_name;

/*   Demo 12 */
select an_id, an_name 
from a_vets.vt_animals
where length(an_name)
order by an_name;

/*   Demo 13 */
select an_id, an_name 
from a_vets.vt_animals
where not length(an_name)
order by an_name;

/*   Demo 14 */
select an_id, an_name
from   a_vets.vt_animals
where  an_name is null
order by an_name;





