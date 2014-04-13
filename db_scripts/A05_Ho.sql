-- Thuong Ho

\W    /* enable warnings! */

use a_vets;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
SELECT an_id, an_name, an_dob
FROM vt_animals
WHERE an_type NOT IN ('dog', 'cat', 'bird')
AND an_dob BETWEEN '2008-01-01' AND '2010-12-31';

/*  TASK 02 */
SET @cost = 50;
SELECT D.srv_id, D.ex_fee, D.ex_id, H.ex_date
FROM vt_exam_details D
JOIN vt_exam_headers H ON D.ex_id = H.ex_id
WHERE D.ex_fee > @cost;

SET @cost = 100;
SELECT D.srv_id, D.ex_fee, D.ex_id, H.ex_date
FROM vt_exam_details D
JOIN vt_exam_headers H ON D.ex_id = H.ex_id
WHERE D.ex_fee > @cost;

/*  TASK 03 */
SELECT *
FROM vt_services
WHERE srv_desc LIKE '%Feline%'
AND srv_desc NOT LIKE '%Dental%'
ORDER BY srv_type, srv_id;

/*  TASK 04 */
SELECT DISTINCT C.cl_id, C.cl_name_last
FROM vt_clients C
JOIN vt_animals A ON C.cl_id = A.cl_id;

/*  TASK 05 */
SELECT DISTINCT cl_id, cl_name_last
FROM vt_clients
WHERE cl_id IN (
	SELECT cl_id
	FROM vt_animals
);

/*  TASK 06 */
SELECT C.cl_id, cl_name_last, an_name, an_type
FROM vt_clients C
LEFT JOIN vt_animals A ON C.cl_id = A.cl_id
ORDER BY cl_id, an_type;

/*  TASK 07 */
SELECT cl_id, cl_name_last
FROM vt_clients
WHERE cl_id IN (
	SELECT cl_id
	FROM vt_animals
	WHERE an_type = 'bird'
);

/*  TASK 08 */
SELECT cl_id, cl_name_last
FROM vt_clients
WHERE cl_id IN (
	SELECT cl_id
	FROM vt_animals
	WHERE an_type = 'bird'
) 
AND cl_id IN (
	SELECT cl_id
	FROM vt_animals
	WHERE an_type IN ('snake', 'chelonian', 'crocodilian', 'lizard')
);
