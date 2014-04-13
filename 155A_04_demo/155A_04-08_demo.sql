use a_testbed;

use a_testbed;
Create table z_em_dept (d_id integer, d_name varchar(15));
   insert into z_em_dept values (100, 'Manufacturing');
   insert into z_em_dept values (150, 'Accounting');
   insert into z_em_dept values (200, 'Marketing');
   insert into z_em_dept values (250, 'Research');
Create table z_em_emp (e_id integer, e_name varchar(15), d_id integer);
   insert into z_em_emp values (1, 'Jones',   150);
   insert into z_em_emp values (2, 'Martin',  150);
   insert into z_em_emp values (3, 'Gates',   250);
   insert into z_em_emp values (4, 'Anders',  100);
   insert into z_em_emp values (5, 'Bossy',   null);
   insert into z_em_emp values (6, 'Perkins', null);

Create table z_em_EmpProj (p_id varchar(15), e_id integer);
   insert into z_em_EmpProj values ('ORDB-10', 3);
   insert into z_em_EmpProj values ('ORDB-10', 5);
   insert into z_em_EmpProj values ('Q4-SALES', 2);
   insert into z_em_EmpProj values ('Q4-SALES', 4);
   insert into z_em_EmpProj values ('ORDB-10', 2);
   insert into z_em_EmpProj values ('Q4-SALES', 5);
   
/*  demo 01  */
select d.d_name
 , d.d_id
 , e.d_id
 , e.e_id
 , e.e_name
from z_em_dept d
join z_em_emp e on d.d_id = e.d_id;

/*  demo 02  */
select z_em_dept.d_name
 , z_em_dept.d_id
 , z_em_emp.d_id
 , z_em_emp.e_id
 , z_em_emp.e_name
from z_em_dept
 , z_em_emp;
 
/*  demo 03  */
select z_em_dept.d_name
 , z_em_dept.d_id
 , z_em_emp.d_id
 , z_em_emp.e_id
 , z_em_emp.e_name
from z_em_dept
cross join z_em_emp;

/*  demo 04  */
select z_em_dept.d_name
 , z_em_dept.d_id
 , z_em_emp.d_id
 , z_em_emp.e_id
 , z_em_emp.e_name
 , p_id
from z_em_dept
cross join z_em_emp
cross join z_em_empproj;


