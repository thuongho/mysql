use a_emp;
-- (1) initial simpler demo for aggregate
select OH.Cust_ID as "CustID", OH.ord_Id as "OrdID"
,  cast(OH.Ord_Date as DATE) as "OrdDate"
,  sum(OD.quoted_price  * OD.quantity_ordered )  as "OrdTotal"
from a_oe.order_headers  OH 
join a_oe.order_details  OD on OH.ord_id= OD.ord_id
where  year( ord_Date) = 2013 and month( Ord_date) between 1 and 6
group by  OH.Cust_ID,  OH.ord_Id,  OH.ord_date
order by  OH.Cust_ID,  OH.ord_Id desc;



-- (2) CREATE THIS VIEW
-- This gives total sales for each order
create or replace view  a_oe.oe_cust_sales as (
select 
   OH.ord_id  as ordID  
,  cast(OH.ord_date as Date) as ordDate
,  OH.cust_id  as CustID
,  sum(OD.quoted_price  * OD.quantity_ordered ) as ordTotal
from a_oe.order_headers  OH 
join a_oe.order_details  OD on OH.ord_id= OD.ord_id
where OD.quoted_price > 0 
and OD.quantity_ordered > 0
group by OH.ord_id , OH.cust_id , OH.ord_date
);

-- (3) this uses subqueries for  the above logic

select CS1.CustID, CS1.ordId, CS1.OrdDate, CS1.OrdTotal

, (  select SUM(CS2.ordTotal) 
     from a_oe.oe_cust_sales CS2  
     where CS1.CustID = CS2.custid 
     and YEAR(CS2.ordDate) = 2013 and MONTH(CS2.Orddate) between 1 and 6) as CustTotal
    
,  cast(100 * ordTotal /( 
     select  SUM(CS3.ordTotal) 
     from a_oe.oe_cust_sales CS3  
     where CS1.CustID = CS3.custid 
     and YEAR(CS3.ordDate) = 2013 and MONTH(CS3.Orddate) between 1 and 6) as decimal(12,1)) as "%CustTotal"
    
, cast(OrdTotal - (
     select  avg(CS4.ordTotal)
     from  a_oe.oe_cust_sales CS4 
     where CS1.CustID = CS4.custid 
     and YEAR(CS4.ordDate) = 2013 and MONTH(CS4.Orddate) between 1 and 6 ) as decimal(12,2)) as OverUnderAvgCust

,  cast(100 * ordTotal /( 
     select  SUM(CS5.ordTotal) 
     from a_oe.oe_cust_sales CS5  
     where YEAR(CS5.ordDate) = 2013 and MONTH(CS5.Orddate) between 1 and 6 )as decimal(12,1)) as "%AllTotal"    
    
From a_oe.oe_cust_sales CS1
where YEAR(CS1.ordDate) = 2013 and MONTH(CS1.Orddate) between 1 and 6
order by CS1.CustID, CS1.ordId desc;


-- (4) CREATE THIS VIEW
create or replace view a_emp.adv_emp as
(select 
  emp_id
, name_last
, emp_mng as mng
, dept_id
, year(hire_date) as year_hired
, cast(coalesce(salary,0) as signed integer) as salary
from a_emp.employees);


-- (5) CREATE THIS TABLE
Create table a_oe.adv_sales (
  sales_day     date primary key
, sales integer not null check (sales >= 0)); 

--demo 03
--  The sales table inserts for analytical queries
truncate table a_oe.adv_sales;
Insert into a_oe.adv_sales values('2011-04-25', 400);
Insert into a_oe.adv_sales values('2011-04-26', 400);
Insert into a_oe.adv_sales values('2011-04-27', 400);
Insert into a_oe.adv_sales values('2011-04-28', 300);
Insert into a_oe.adv_sales values('2011-04-29', 900);
Insert into a_oe.adv_sales values('2011-04-30', 580);
Insert into a_oe.adv_sales values('2011-05-01', 425);
Insert into a_oe.adv_sales values('2011-05-02', 010);
Insert into a_oe.adv_sales values('2011-05-03', 325);
Insert into a_oe.adv_sales values('2011-05-04', 500);
Insert into a_oe.adv_sales values('2011-05-05', 550);
Insert into a_oe.adv_sales values('2011-05-06', 000);
Insert into a_oe.adv_sales values('2011-05-07', 000);
Insert into a_oe.adv_sales values('2011-05-08', 200);
Insert into a_oe.adv_sales values('2011-05-09', 450);
Insert into a_oe.adv_sales values('2011-05-10', 580);
Insert into a_oe.adv_sales values('2011-05-11', 425);
Insert into a_oe.adv_sales values('2011-05-12', 475);
Insert into a_oe.adv_sales values('2011-05-13', 375);
Insert into a_oe.adv_sales values('2011-05-14', 500);
Insert into a_oe.adv_sales values('2011-05-15', 650);
Insert into a_oe.adv_sales values('2011-05-16', 550);
Insert into a_oe.adv_sales values('2011-05-17', 450);
Insert into a_oe.adv_sales values('2011-05-18', 500);
Insert into a_oe.adv_sales values('2011-05-19', 575);
Insert into a_oe.adv_sales values('2011-05-20', 450);
Insert into a_oe.adv_sales values('2011-05-21', 500);
Insert into a_oe.adv_sales values('2011-05-22', 575);
Insert into a_oe.adv_sales values('2011-05-23', 850);
Insert into a_oe.adv_sales values('2011-05-24', 500);
Insert into a_oe.adv_sales values('2011-05-25', 575);
Insert into a_oe.adv_sales values('2011-05-26', 500);
Insert into a_oe.adv_sales values('2011-05-27', 575);
Insert into a_oe.adv_sales values('2011-05-28', 500);
Insert into a_oe.adv_sales values('2011-05-29', 575);
Insert into a_oe.adv_sales values('2011-05-30', 575);
Insert into a_oe.adv_sales values('2011-05-31', 575);


select  ord_date 
, cast(coalesce(sum(quantity_ordered * quoted_price),0) as signed integer)  as sales
from a_oe.order_headers OH
join a_oe.order_details OD on OH.ord_id = OD.ord_id 
group by ord_date;

