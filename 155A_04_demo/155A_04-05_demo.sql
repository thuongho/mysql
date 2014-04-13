use a_prd;

/*   Demo 01	*/
set @v_price = 12.95;

select @v_price as Price;

/*   Demo 02	*/	
set @v_price = 12.95;

select prod_id, prod_list_price, catg_id 
from a_prd.products
where prod_list_price = @v_price;


/*   Demo 03	*/
set @v_price = 25.50;
select prod_id, prod_list_price, catg_id 
from a_prd.products
where prod_list_price = @v_price;

/*   Demo 04	*/	
set @sales_tax_rate := 0.095;

select prod_id
, quantity_ordered as Quantity
, quoted_price as Price
, quantity_ordered * quoted_price as AmtDue
, quantity_ordered * quoted_price * @sales_tax_rate as SalesTaxDue
from a_oe.order_details
limit 5; 

/*   Demo 05	*/	
set @target := 'Shingler Hammer';

select  prod_id, prod_list_price, prod_name 
from a_prd.products
where prod_name  = @target;


/*   Demo 06	*/
set @r := 25/8 + 4 + 4 * 1.0;
select @r;

/*   Demo 07	*/
set @r := 25/8 + 4 + 4 * 1.0;
Set @r2 := @r + 3;
Select @r2;

/*   demo 08	*/
set @target := 'Hammer';
set @target2 := concat('%', @target, '%');
select  prod_id, prod_list_price, prod_name 
from a_prd.products
where prod_name Like @target2;






