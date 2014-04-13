-- Thuong Ho

\W    /* enable warnings! */

use a_vets;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
SELECT DISTINCT concat(cl_postal_code, ': ', cl_city, ' ', cl_state) AS "Location"
FROM vt_clients;

/*  TASK 02 */
SELECT cl_id, cl_name_first, cl_name_last
FROM vt_clients
WHERE row(cl_city, cl_state) = row('San Francisco', 'CA');

/*  TASK 03 */
SELECT cl_name_first, cl_name_last, cl_phone
FROM vt_clients
WHERE cl_phone IS NOT NULL
ORDER BY cl_id;

/*  TASK 04 */
SELECT stf_name_first, stf_name_last, stf_id
FROM vt_staff
WHERE stf_job_title IN ('vet', 'vet assnt');

/*  TASK 05 */
SELECT srv_id AS 'Service ID'
, srv_type AS 'Service Type'
, srv_desc AS 'Description'
, srv_list_price AS 'Curr Price'
, (srv_list_price * 1.1) AS 'Incr Price'
FROM vt_services
ORDER BY srv_type, srv_id;

/*  TASK 06 */
SELECT cl_id, an_id, an_name
FROM vt_animals
WHERE an_type IN ('hamster', 'capybara', 'porcupine', 'dormouse')
ORDER BY cl_id, an_id;

/*  TASK 07 */
SELECT DISTINCT cl_id, an_type
FROM vt_animals
WHERE an_type IN ('snake', 'chelonian', 'crocodilian', 'lizard')
ORDER BY cl_id;

/*  TASK 08 */
SELECT cl_id, an_id, an_name, an_dob
FROM vt_animals 
WHERE an_type NOT IN ('snake', 'chelonian', 'crocodilian', 'lizard', 'hamster', 'capybara', 'porcupine', 'dormouse')
ORDER BY an_dob DESC;

/*  TASK 09 */
SELECT ex_id, srv_id, ex_fee
FROM vt_exam_details
WHERE ex_fee BETWEEN 35 AND 50
ORDER BY srv_id;

/*  TASK 10 */
SELECT an_id, an_name
FROM vt_animals
WHERE an_dob BETWEEN '2000-01-01' AND '2005-12-31';