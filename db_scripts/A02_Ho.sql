-- Thuong Ho

\W    /* enable warnings! */

use a_vets;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
SELECT stf_name_first, stf_name_last, stf_job_title
FROM vt_staff;

/*  TASK 02 */
SELECT stf_hire_date, stf_salary
FROM vt_staff_pay
ORDER BY stf_hire_date DESC;

/*  TASK 03 */
SELECT an_id AS 'ID'
, an_name AS 'Name'
, an_type AS 'Animal Type'
, an_dob AS 'Birth Date'
FROM vt_animals
ORDER BY an_dob;

/*  TASK 04 */
SELECT DISTINCT an_type
FROM vt_animals;

/*  TASK 05 */
SELECT *
FROM vt_services
ORDER BY srv_desc;

/*  TASK 06 */
SELECT srv_id, srv_list_price, srv_desc
FROM vt_services
ORDER BY srv_list_price DESC;

/*  TASK 07 */
SELECT ex_id, ex_fee
FROM vt_exam_details
ORDER BY ex_id, ex_fee;

/*  TASK 08 */
SELECT DISTINCT an_name, an_type
FROM vt_animals
ORDER BY an_type, an_name; 

/*  TASK 09 */
SELECT ex_id, ex_date, stf_id
FROM vt_exam_headers
ORDER BY stf_id, ex_date DESC;

/*  TASK 10 */
SELECT DISTINCT cl_state, cl_city
FROM vt_clients
ORDER BY cl_state, cl_city;