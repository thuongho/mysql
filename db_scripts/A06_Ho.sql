-- Thuong Ho

\W    /* enable warnings! */

use a_plants;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
SELECT cust_id, cust_name_last
FROM customers 
WHERE cust_id NOT IN (
	SELECT cust_id 
	FROM order_headers
);

/*  TASK 02 */
SELECT plant_id, common_name
FROM plants
WHERE plant_id NOT IN(
	SELECT plant_id
	FROM order_details
);

/*  TASK 03 */
SELECT P.plant_id, common_name, CONCAT(genus,' ',family) AS "Scientific_Name"
FROM plants P
LEFT JOIN plant_taxonomy T ON P.plant_id = T.plant_id
JOIN order_details D ON P.plant_id = D.plant_id
JOIN order_headers H ON D.order_id = H.order_id
WHERE order_date BETWEEN '2013-07-01' AND '2013-08-31';

/*  TASK 04 */
SELECT P.plant_id, common_name, CONCAT(genus,' ',family) AS "Scientific_Name"
FROM plants P
LEFT JOIN plant_taxonomy T ON P.plant_id = T.plant_id
LEFT JOIN order_details D ON P.plant_id = D.plant_id
LEFT JOIN order_headers H ON D.order_id = H.order_id
WHERE order_date NOT BETWEEN '2013-07-01' AND '2013-08-31'
OR order_date IS NULL;

/*  TASK 05 */
SELECT P.plant_id, common_name, CONCAT(genus,' ',family) AS "Scientific_Name"
FROM plants P
LEFT JOIN plant_taxonomy T ON P.plant_id = T.plant_id
JOIN order_details D ON P.plant_id = D.plant_id
JOIN order_headers H ON D.order_id = H.order_id
WHERE order_date NOT BETWEEN '2013-07-01' AND '2013-08-31';

/*  TASK 06 */
SET @name = 'Buttercup';
SELECT common_name, CONCAT(genus,' ',family) AS "Scientific_Name"
FROM plants P
LEFT JOIN plant_taxonomy T ON P.plant_id = T.plant_id
WHERE LOCATE(@name, common_name) > 0;

SET @name = 'Thistle';
SELECT common_name, CONCAT(genus,' ',family) AS "Scientific_Name"
FROM plants P
LEFT JOIN plant_taxonomy T ON P.plant_id = T.plant_id
WHERE LOCATE(@name, common_name) > 0;

SET @name = 'Lupine';
SELECT common_name, CONCAT(genus,' ',family) AS "Scientific_Name"
FROM plants P
LEFT JOIN plant_taxonomy T ON P.plant_id = T.plant_id
WHERE LOCATE(@name, common_name) > 0;

/*  TASK 07 */
SELECT plant_id, common_name, on_hand, list_price, ROUND((on_hand * list_price),-2) AS "InventoryCost"
FROM plants
WHERE discontinued_date IS NOT NULL;

/*  TASK 08 */
SET @midwest = 'IL,IN,IA,KS,MI,MN,MO,NE,ND,OH,SD,WI';
SELECT H.cust_id, cust_name_last, order_date, cust_state
FROM order_headers H
RIGHT JOIN customers C ON H.cust_id = C.cust_id
WHERE FIND_IN_SET(cust_state, @midwest) = 0;

/*  TASK 09 */
SET @randcost = FLOOR(RAND()*(50-10) + 10);
SELECT plant_id, list_price
FROM plants
WHERE list_price < @randcost;

SET @randcost = FLOOR(RAND()*(50-10) + 10);
SELECT plant_id, list_price
FROM plants
WHERE list_price < @randcost;

