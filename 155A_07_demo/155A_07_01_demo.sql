use a_testbed;


Create table z_reg ( id integer auto_increment primary key, name varchar(25));
Insert into z_reg (name) values ('Fluffy'), ('goofy'), ('ursula'), ('greg');
Insert into z_reg (name) values ('pout'), ('Sam 415'), ('pretty bird');
Insert into z_reg (name) values ('pat'), ('peat'), ('Patricia'), ('Impromptu');
Insert into z_reg (name) values ('Pete'), ('pat the cat'), ('C3PO');
Insert into z_reg (name) values ('Mary Proud'), ('ptt'), ('pita');

select * from z_reg;

/*   Demo 01	 */
Select
  'goofy' Regexp 'goofy' as d_1a
, 'goofy' Regexp 'max'   as d_1b;

/*   Demo 02 */	
Select
  'goofy' Regexp 'goofy' as d_2a
, 'goofy' Regexp 'Goofy' as d_2b
, binary 'goofy' Regexp 'Goofy' as d_2c
;

/*   Demo 03 */
Select 
  'goofy' Regexp 'g'  as d_3a
, 'goofy' Regexp 'oo' as d_3b
, 'goofy' Regexp 'oy' as d_3c
;

/*   Demo 04	 */
Select * from z_reg where name  RegExp '^g';

/*   Demo 05 */	
Select * from z_reg where name  RegExp 'g$';

/*   Demo 06 */
Select * from z_reg where name  RegExp '^p.t$';

/*   Demo 07 */
Select * from z_reg where name  RegExp '^p..t$';

/*   Demo 08 */
Select * from z_reg where name not RegExp '^p..t$';

/*   Demo 09 */
Select * from z_reg where name  RegExp '^p.{3}t';

/*   demo 10 */
Select * from z_reg where name  RegExp '^p.{4,7}a';

/*   Demo 11 */
Select * from z_reg where name  RegExp '^p.*t';


/*   Demo 12 */
Select * from z_reg where name  RegExp 'pr?o';

/*   Demo 13 */
Select * from z_reg where name  RegExp '[aeiouy]$';

/*   Demo 14 */
Select * from z_reg where name  RegExp 'r[aeiouy][a-m]';

/*   Demo 15 */
Select * from z_reg where name RegExp '[[:blank:]]';

/*   Demo 16 */
Select * from z_reg where binary name RegExp '[[:upper:]][[:lower:]]';
			  
/*   Demo 17 */
Select * from z_reg where name RegExp '[[:digit:]]';


