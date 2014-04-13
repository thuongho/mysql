use a_testbed;

/*   Demo 01 */	
Select 'DOG' = 'dog';

Select binary 'DOG' = 'dog';

/*   Demo 02 */	
select cast(123.567 as char);

select cast(123.567 as char(2));

/*   Demo 03 */
select cast('abcsdefg' as char (2));


/*   Demo 04 */	
select convert('123.567' , char);


/*   Demo 05 */	
Select Format(1234.5678, 3);



/*   Demo 06 */
Select Format(1234.5678, 0);

/*   Demo 07 */
Select Format(1234.5678, 8);

/*   Demo 08 */
Select lpad(Format(1234.5678, 8), 20, ' ') as result ;

Select lpad(Format(1.5678, 8), 20, ' ') as result ;
Select lpad(Format(0.5678, 8), 20, ' ') as result ;
Select lpad(Format(-4.5678, 8), 20, ' ') as result;

/*   Demo 09 */
Select lpad(Format(1234.5678, 8), 2, ' ') as R ;

