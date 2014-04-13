use  a_plants;


/* clear previous inserts */
delete from a_plants.order_details;
delete from a_plants.order_headers;
delete from a_plants.customers;
delete from a_plants.plant_vendors;
delete from a_plants.vendors;
delete from a_plants.plant_taxonomy;
delete from a_plants.plants ;  


/* inserts */

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values 
(1001, 'Cowslip',            130, 12.50,  '1995-01-25', null);
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values 
(1001, 'Primulaceae', 'Primula', 'veris');

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values 	
(1002, 'Common Buttercup',   100, 15.63,  '2010-01-25', null);
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values 
(1002, 'Ranunculaceae', 'Ranunculus', 'acris');

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values  
(1003, 'Anemone',            150,  8.25,  '1995-01-25',  '2010-05-31');
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values  
(1003, 'Ranunculaceae', 'Anemone', 'blanda');

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values  
(1004, 'Wild Wood Anemones',  15, 15.50,  '1995-01-25', null);	
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values 
(1004, 'Ranunculaceae', 'Anemone', 'nemorosa');

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values  
(1005, 'Marsh Marigold',     400,  2.75,  '1995-03-12', null);	
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values  
(1005, 'Ranunculaceae', 'Caltha', 'palustris');

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values 
(1009, 'Cursed Crowfoot',   1302,  9.38,  '2012-01-01',  '2012-01-31');
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values  
(1009, 'Ranunculaceae', 'Ranunuculus', 'sceleratus');

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values  
(1010, 'California Poppy',  1800,  2.75,  '2005-01-01', null);
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values 
(1010, 'Papaveraceae', 'Eschscholzia', 'californica');

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values 
(2020, 'Porcupine Thistle', 150, 25.00,   '2013-02-01', null);
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values 
(2020, 'Asteraceae', 'Cirsium', 'laterifolium'); 

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values 
(2021, 'Hedgehog Thistle', 150, 25.00,  '2013-02-01', null);

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values 
(2022, 'Echinoderm Thistle', 450, 25.00,  '2013-02-01', null);
 
Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values 
(2023, 'Rocky Mountain Thistle', 150, 12.50,   '2013-02-01', null);
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values 
(2023, 'Asteraceae', 'Cirsium', 'perplexans'); 

Insert into a_plants.plants  (plant_id, common_name, on_hand, list_price, acquired_date, discontinued_date) values 
(2057, 'White Cemetery Iris',  15, 9.25,    '2010-07-28', null );
Insert into a_plants.plant_taxonomy (plant_id, family, genus, species) values 
(2057, 'Iridaceae', 'Iris', 'albicans' );



insert into a_plants.vendors (vendor_id, vendor_name, vendor_state, vendor_account_opened, vendor_account_closed) 
  values (3, 'Fungi Specialists',    'CA',  '2001-04-01',  '2003-04-01');
insert into a_plants.vendors (vendor_id, vendor_name, vendor_state, vendor_account_opened, vendor_account_closed) 
  values (4, 'Borders',              'CA',  '2002-06-01', null);  
insert into a_plants.vendors (vendor_id, vendor_name, vendor_state, vendor_account_opened, vendor_account_closed) 
  values (6, 'Perennial Perennials', 'CA',  '2003-04-01', null);
insert into a_plants.vendors (vendor_id, vendor_name, vendor_state, vendor_account_opened, vendor_account_closed) 
  values (7, 'Herbaceous Herb',      'CA',  '2003-04-01', null);
insert into a_plants.vendors (vendor_id, vendor_name, vendor_state, vendor_account_opened, vendor_account_closed) 
  values (10, 'Bulbs and Rhizomes',   'CA', '2012-05-01', null);  
insert into a_plants.vendors (vendor_id, vendor_name, vendor_state, vendor_account_opened, vendor_account_closed) 
  values (11, 'Cissy''s Cirsiums',   'CA',  '2013-01-01', null);  


Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1001,  4);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1002,  7);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1003,  7);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1004,  4);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1004,  7);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1009,  7);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1009, 11);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1010,  4);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1010,  7);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1010, 10);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (1010, 11);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (2020, 11);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (2021, 11);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (2022, 11);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (2023, 11);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (2057, 10);
Insert into a_plants.plant_vendors(plant_id, vendor_id) values (2057,  4);



Insert into a_plants.customers (cust_id, cust_name_last, cust_name_first, cust_state)  values 
(3009, 'Peterson', 'Oscar', 'NY');
Insert into a_plants.customers (cust_id, cust_name_last, cust_name_first, cust_state)  values 
(3010, 'LaVette', 'Betty', 'MI');
Insert into a_plants.customers (cust_id, cust_name_last, cust_name_first, cust_state)  values 
(3001, 'Rollins', 'Sonny', 'OH');
Insert into a_plants.customers (cust_id, cust_name_last, cust_name_first, cust_state)  values 
(3002, 'Lewis', 'Ramsey', 'CA');
Insert into a_plants.customers (cust_id, cust_name_last, cust_name_first, cust_state)  values 
(3012, 'Hawkins', 'Coleman', 'CA');


Insert into a_plants.order_headers  (order_id, cust_id, order_date) values  
(5101,	3010,	 '2013-01-25');
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5101, 1001,	  1,  12.50);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5101, 2022,	  111,  50.00);


Insert into a_plants.order_headers  (order_id, cust_id, order_date) values     
(5102,	3009,	 '2013-01-31');
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values  
(5102, 1002,	100,  15.00);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5102, 1009,	200,   5.20);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5102, 1004,	200,  14.50);

Insert into a_plants.order_headers  (order_id, cust_id, order_date) values     
(5103,	3009,	 '2013-02-12');
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values  
(5103, 2023,	 20,   5.50);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values  
(5103, 1004,	 20,  15.50);

Insert into a_plants.order_headers  (order_id, cust_id, order_date) values    
(5104,	3012,	 '2013-02-23');
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5104, 2023,	 10,   5.50);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5104, 1010,	 10,   2.75);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5104, 1004,	 15,   47.50);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5104, 1009,	 3,   50.00);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values  
(5104, 2022,	 111,   37.50);


Insert into a_plants.order_headers  (order_id, cust_id, order_date) values   
(5105,	3012,	 '2013-07-22');
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5105, 1004,	250,   5.25);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5105, 1009,	 50,   9.38);
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5105, 1010,  25,   2.75);

  
Insert into a_plants.order_headers  (order_id, cust_id, order_date) values   
(5202,	3012,	 '2013-08-01');
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5202, 1001,	  1,  12.50);

Insert into a_plants.order_headers  (order_id, cust_id, order_date) values   
(5203,	3012,	 '2013-08-02');
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5203, 1001,	  10,  12.50);

Insert into a_plants.order_headers  (order_id, cust_id, order_date) values   
(5204,	3012,	 '2013-08-03');
Insert into a_plants.order_details (order_id, plant_id, quantity, price_per) values 
(5204, 1001,	  1,  12.50);

-- 
