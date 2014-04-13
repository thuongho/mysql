use a_testbed;

/*   Demo 01 */	
Select ABS (12), ABS (-12), ABS (0), ABS(45.34) ;

/*   Demo 02 */	
Select SIGN (0), SIGN (12),  SIGN (-12),  SIGN (8.9); 

/*   Demo 03 */
Select POWER (3, 2), POWER (10, 3), POWER (4.5, 3.2), POWER(10,-3);

select POWER (10, -3), POWER (10.0000, -3), POWER (4.5000, 3.2);
/*   Demo 04 */	
Select  SQRT (64), SQRT (68.56), SQRT(-45);

/*   Demo 05 */	
Select ROUND( 45.678, 0), ROUND( 45.2, 0),  ROUND( 46.5, 0), ROUND ( 45.678, 2);

select ROUND( -46.5, 0),  ROUND( 345.67, -2), ROUND ( 45, -1 ),  ROUND ( 45, -2 );

/*   Demo 06 */
Select  Truncate( 45.678, 0) , Truncate( 45.678, 2) , Truncate( 453446.5, -2) ;

/*   Demo 07 */
Select CEILING (10), CEILING (10.2), CEILING (10.8), CEILING (-10.5); 

/*   Demo 08 */
Select FLOOR (10), FLOOR (10.2), FLOOR (10.8), FLOOR (-10.5) ;

/*   Demo 09 */
Select mod( 25,7) , mod( 12.45, 2.3) ;


/*   demo 10 */
Create table a_testbed.z_numerics( id int, val_1 float);
insert into a_testbed.z_numerics values
  (1,  25.0034)
, (2,  25.0079)
, (3,  25.0279) 
, (4,  25.4239) 
, (5, -25.0279)  
, (6, -25.4239)  
 ;

/*   demo 11 */
 select id
,  val_1
, round(val_1,2)                    as "round"
, truncate(val_1,2)                 as "truncate" 
, ceiling(val_1 * 100.00)/100.00    as "ceil"
, floor(val_1* 100.00)/100.00       as "floor" 
from a_testbed. z_numerics
;

/*   demo 12 */
select 
  quoted_price as price
, round(quoted_price, -1) as Price_10
, round(quoted_price, -2) as Price_100
from a_oe.order_details
limit 10
;

/*   demo 13 */
Select rand() as col_1, rand() as col_2, rand()as col_3;

Select rand(5) as col_1, rand(5) as col_2, rand(5)as col_3;

Select rand(5)  as col_1, rand() as col_2, rand()as col_3;

Select Floor(rand() * 20 + 1 ) as col_1;


/*   Demo 14 */
Select Floor(rand() * 20 + 1 ) as col_1;

Select (floor(rand() * (10-3)) + 3 )/10;