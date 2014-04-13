-- Thuong Ho

\W    /* enable warnings! */

use a_vets;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
SELECT an.cl_id, an.an_id, an.an_name, eh.ex_date, ed.ex_fee
FROM vt_animals an
JOIN vt_exam_headers eh ON an.an_id = eh.an_id 
JOIN vt_exam_details ed ON ed.ex_id = ed.ex_id
WHERE ex_fee >= 100
ORDER BY an.cl_id, an.an_id;

/*  TASK 02 */
SELECT E.ex_id, S.srv_id, S.srv_desc, S.srv_list_price, E.ex_fee
FROM vt_services S
JOIN vt_exam_details E ON S.srv_id = E.srv_id 
WHERE E.ex_fee BETWEEN 30 AND 60
ORDER BY S.srv_id;

/*  TASK 03 */
SELECT D.ex_id, H.ex_date, D.srv_id, D.ex_fee
FROM vt_exam_details D	
JOIN vt_exam_headers H ON D.ex_id = H.ex_id
JOIN vt_animals A ON H.an_id = A.an_id
WHERE A.an_type IN ('hamster', 'capybara', 'porcupine', 'dormouse')
ORDER BY D.srv_id;

/*  TASK 04 */
SELECT an_id, an_name
FROM vt_animals
WHERE an_dob BETWEEN '2002-01-01' AND '2005-12-31';

/*  TASK 05 */
SELECT DISTINCT S.stf_id, S.stf_name_first, S.stf_name_last
FROM vt_staff S
JOIN vt_exam_headers H ON S.stf_id = H.stf_id
JOIN vt_animals A ON H.an_id = A.an_id
WHERE A.an_type IN ('snake', 'chelonian', 'crocodilian', 'lizard');

/*  TASK 06 */
set @client  = 5699;
SELECT C.cl_id, concat(C.cl_name_first, ' ', C.cl_name_last) AS 'cl_name', A.an_id, A.an_name, H.ex_date, D.srv_id, D.ex_fee 
FROM vt_clients C
JOIN vt_animals A ON C.cl_id = A.cl_id
JOIN vt_exam_headers H ON A.an_id = H.an_id
JOIN vt_exam_details D ON H.ex_id = D.ex_id
WHERE C.cl_id = @client
ORDER BY A.an_id;

set @client  = 25479;
SELECT C.cl_id, concat(C.cl_name_first, ' ', C.cl_name_last) AS 'cl_name', A.an_id, A.an_name, H.ex_date, D.srv_id, D.ex_fee 
FROM vt_clients C
JOIN vt_animals A ON C.cl_id = A.cl_id
JOIN vt_exam_headers H ON A.an_id = H.an_id
JOIN vt_exam_details D ON H.ex_id = D.ex_id
WHERE C.cl_id = @client
ORDER BY A.an_id;

/*  TASK 07 */
SELECT DISTINCT C.cl_id, C.cl_name_last
FROM vt_clients C
JOIN vt_animals A ON C.cl_id = A.cl_id
WHERE A.an_type = 'cat'
ORDER BY C.cl_id;

/*  TASK 08 */
SELECT DISTINCT C.cl_id, C.cl_name_last
FROM vt_clients C
JOIN vt_animals A ON C.cl_id = A.cl_id
WHERE A.an_type IS NOT NULL
XOR A.an_type !='cat';

/*  TASK 09 */
SELECT DISTINCT C.cl_id, C.cl_name_last
FROM vt_clients C
JOIN vt_animals A ON C.cl_id = A.cl_id
WHERE A.an_type IN ('hamster', 'capybara', 'porcupine', 'dormouse')
ORDER BY C.cl_id;

/*  TASK 10 */
SELECT DISTINCT C.cl_id, C.cl_name_last
FROM vt_clients C
JOIN vt_animals A ON C.cl_id = A.cl_id
WHERE A.an_type NOT IN ('hamster', 'capybara', 'porcupine', 'dormouse')
ORDER BY C.cl_id;