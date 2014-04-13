Use a_testbed;

/*  Demo 01	*/
Select col_id, col_int 
From   z_tst_nulls 
Where col_int is null;

Select col_id, col_int 
From z_tst_nulls 
Where col_int is not null;


/*  Demo 02		*/
Select col_id, col_int 
From z_tst_nulls 
Where col_int > 15;

Select col_id, col_int 
From z_tst_nulls 
Where col_int > 15 or col_int <= 15;


/*  Demo 03	*/
set @tst_1 = 10;


/*  Demo 04		*/
Select col_id, col_int 
From z_tst_nulls
Where col_int = @tst_1;


/*  Demo 05	*/	
Select col_id, col_int 
From z_tst_nulls
Where col_int <=> @tst_1;

/*  Demo 06	*/
Select col_id, col_int 
From z_tst_nulls
Where col_int = @tst_2;


/*  Demo 07	*/
Select col_id, col_int 
From z_tst_nulls
Where col_int <=> @tst_2;


/*  Demo 08	*/
Select col_id, col_int, col_int <=> @tst_1, col_int <=> @tst_2
From z_tst_nulls
;


