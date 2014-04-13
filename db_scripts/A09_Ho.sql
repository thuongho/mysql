-- Thuong Ho

\W    /* enable warnings! */

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
Set @rundate = current_date;

Set @first_month = Date_format(Date_sub(@rundate, interval 6 month), '%M %Y');
Set @second_month = Date_format(Date_sub(@rundate, interval 5 month), '%M %Y');
Set @third_month = Date_format(Date_sub(@rundate, interval 4 month), '%M %Y');

Select @rundate, @first_month, @second_month, @third_month\G

--Please delete 
-- select distinct c_id, c_name, order_date from a_bkorders.bkv_custorders where c_id = 212921

/*  TASK 02 */
Select *
From a_bkorders.bkv_custorders
Where Date_format(order_date, '%M %Y') = @first_month;

Select *
From a_bkorders.bkv_custorders
Where Date_format(order_date, '%M %Y') = @second_month;

Select *
From a_bkorders.bkv_custorders
Where Date_format(order_date, '%M %Y') = @third_month;


/*  TASK 03 */
Select c_id, c_name
From a_bkorders.bkv_custorders
Where Date_format(order_date, '%M %Y') = @first_month
UNION
Select c_id, c_name
From a_bkorders.bkv_custorders
Where Date_format(order_date, '%M %Y') = @second_month
UNION
Select c_id, c_name
From a_bkorders.bkv_custorders
Where Date_format(order_date, '%M %Y') = @third_month;


/*  TASK 04 */
-- not this first one
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id NOT IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') IN (@first_month, @second_month, @third_month));
	
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id NOT IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @first_month
	UNION
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @second_month
	UNION
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @third_month);


/*  TASK 05 */
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @first_month)
And c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @second_month)
And c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @third_month);
	

-- test
Select Distinct c_id, c_name, Date_format(order_date, '%M %Y'), @third_month, @second_month
From a_bkorders.bkv_custorders
Where c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @third_month)
And c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @second_month)
	

/*  TASK 06 */
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @first_month)
And c_id NOT IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @second_month
	UNION
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @third_month);

/*  TASK 07 */
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @first_month)
And c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') IN (@second_month, @third_month));

/*  TASK 08 */
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @first_month)
And c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') IN (@second_month, @third_month))
And c_id NOT IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where c_id IN (
		Select c_id
		From a_bkorders.bkv_custorders
		Where Date_format(order_date, '%M %Y') = @second_month)
	And c_id IN (
		Select c_id
		From a_bkorders.bkv_custorders
		Where Date_format(order_date, '%M %Y') = @third_month));


/*  TASK 09 */
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') IN (@first_month, @second_month))
And c_id NOT IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @third_month);

-- result is slower with UNION
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @first_month
	UNION
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @second_month)
And c_id NOT IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @third_month);

/*  TASK 10 */
Select Distinct c_id, c_name
From a_bkorders.bkv_custorders
Where c_id IN (
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @first_month
    And c_id NOT IN (
		Select c_id
		From a_bkorders.bkv_custorders
		Where Date_format(order_date, '%M %Y') IN (@second_month, @third_month))
	UNION
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @second_month
    And c_id NOT IN (
		Select c_id
		From a_bkorders.bkv_custorders
		Where Date_format(order_date, '%M %Y') IN (@first_month, @third_month))
	UNION
	Select c_id
	From a_bkorders.bkv_custorders
	Where Date_format(order_date, '%M %Y') = @third_month
    And c_id NOT IN (
		Select c_id
		From a_bkorders.bkv_custorders
		Where Date_format(order_date, '%M %Y') IN (@second_month, @first_month)));