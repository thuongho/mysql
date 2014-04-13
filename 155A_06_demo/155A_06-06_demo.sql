use a_testbed;

/*   Demo 01 */	
select Concat('C', 'AT', ' Fluff', 'y') ;

/*   Demo 02 */	
select Concat_ws(' ', 'Fluffy', 'the', 'cat') ;

select 
  concat('a','b')
, concat(null,'b')
, concat('c', null,'b');

select  
  concat_ws(' ','a','b')
, concat_ws(' ',null,'b')
, concat_ws(' ', 'c', null,'b');

select  concat_ws(null,'a','b');

/*   Demo 03 */
select Concat_ws(' ', prod_desc, 'costs', prod_list_price, 
       'and has a warranty of',prod_warranty_period, 'months') as "Item Desc"
from a_prd.products
limit 4\G


/*   Demo 04 */	
select  an_id, an_name, an_type 
from    zoo_animals
where   an_type = 'dog';



/*   Demo 05 */	
select   an_id, an_name, an_type 
from     zoo_animals
where    BINARY an_type = 'dog';


/*   Demo 06 */
select Upper( 'MY sTrInG') , Upper( '50 Phelan Ave SF 94112') , Lower( 'MY sTrInG') ;

/*   Demo 07 */
Select rtrim( '     San Francisco  CA   ') as Rtrim 
,      ltrim( '     San Francisco  CA   ') as Ltrim
,      rtrim(ltrim( '     San Francisco  CA   ')) as  "R&LTrim";


/*   Demo 08 */
Select rpad( 'San Francisco', 15, '-') as RPAD 
,      lpad( 'San Francisco', 15, '-') as LPAD
,      rpad( 'San Francisco',  5, '-') as  "RPad_short";


/*   Demo 09 */
Select SUBSTRING( 'ABCDEFGHIJK',1, 5) , SUBSTRING( 'ABCDEFGHIJK', 5, 3) ;

Select SUBSTRING( 'ABCDEFGHIJK',50, 5) , SUBSTRING( 'ABCDEFGHIJK', 5, 60) ;

Select SUBSTRING( 'ABCDEFGHIJK',-5, 2) , SUBSTRING( 'ABCDEFGHIJK', -50, 20) ;

/*   demo 10 */

Select left('ABCDEFGHIJK', 5) , RIGHT('ABCDEFGHIJK', 5) , RIGHT('ABCDEFGHIJK', 55) ;

/*   Demo 11 */
select SUBSTRING_index( 'Cat,Ant,Elephant, Blue Frog, Zebra', ',', 1);

/*   Demo 12 */
select SUBSTRING_index( 'Cat,Ant,Elephant, Blue Frog, Zebra', ',', 3);

/*   Demo 13 */
select SUBSTRING_index( 'Cat,Ant,Elephant, Blue Frog, Zebra', ',', -1);


/*   Demo 14 */
select SUBSTRING_index( 'Cat,Ant,Elephant, Blue Frog, Zebra', 'a', 2);

/*   Demo 15 */
select INstr( 'ABCDEABCDE', 'CD' ) , INstr(  'ABCDEABCDE','zebra') ;
			  
/*   Demo 16 */
Select LOCATE( 'CD', 'ABCDEABCDE'  ) , LOCATE( 'CD', 'ABCDEABCDE', 5) ;


/*   Demo 17 */
Select REPLACE('ABCDABCDABCD', 'B', 'cat') , REPLACE('ABCDABCDABCD', 'BCD', '-') ;


/*   Demo 18 */
Select  REPLACE('ABCDABCD', 'CD', '') , REPLACE('ABCDABCD', 'C', null) ;

/*   Demo 19 */
Select INSERT('abcdefgh',1,4,'X') , INSERT('abcdefgh',5,2,'xzyxzy') ;

/*   Demo 20 */
Select length('   abc   ') , length('') , length(null) ;


/*   Demo 21 */
Select repeat('*-* ',3) ;


/*   Demo 22 */
Select reverse('abcdefgh');

/*   Demo 23 */
Select concat('A' , space(5) , 'Z') ;

/*   Demo 24 */
Select ascii('Cat') , ascii('Dog') , ascii('dog') , ascii('') , ascii(null) ;

/*   Demo 25 */
Select char(68) | char(69) , char(70) , char(50) , char(123) , char(124) ;
			  
/*   Demo 26 */
select Field('cat', 'ant','bear','catfish','dog','cat','elk');

select Field('moose', 'ant','bear','catfish','dog','cat','elk');

select Field(null, 'ant');

select Field('moose', null);

select Field('moose', null, 'cat');

select Field('moose', null, 'cat', 'moose');

select Field(12,1002,120,2011,12, 2012,12);

select Field(0,1002,120,2011,12, 2012,12);

select Field(0,1002,120,'ant',12, 2012,12);

/*   Demo 27 */
select ELT(2, 'ant', 'cat', 'dog', 'bird', 'hedgehog');

select ELT(8, 'ant', 'cat', 'dog', 'bird', 'hedgehog');

select ELT(0, 'ant', 'cat', 'dog', 'bird', 'hedgehog');


select ELT(3.5, 'ant', 'cat', 'dog', 'bird', 'hedgehog');


/*   Demo 28 */
select Find_In_set('cat', 'ant,bear,catfish,dog,cat,elk');

select Find_In_set('moose', 'ant,bear,catfish,dog,cat,elk');

/*   Demo 29 */
set @list = 'cat,dog,bird';
select an_type, Find_In_set(an_type, @list) as Found
from vt_animals;


select an_name, an_type 
from vt_animals
where Find_In_set(an_type, @list) >0;

/*   Demo 30 */
Select an_name, an_type
From vt_animals
Where an_type in ('cat', 'dog', 'bird');
