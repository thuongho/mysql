-- Thuong Ho

\W    /* enable warnings! */

use a_xml;

/*  TASK 00 */ 
select user(), current_date(), version(), @@sql_mode\G

/*  TASK 01 */
-- rerun the provided script to create and populate the table
drop table if exists a_xml.xml_animals;

create table a_xml.xml_animals(
  id    int primary key
, datax TEXT)
;
truncate table a_xml.xml_animals;

insert into a_xml.xml_animals values (1,
'<client cl_id="8243"><cl_name>Johnson</cl_name><pets>
<animal><an_id>136</an_id><an_type>bird</an_type><an_name>ShowBoat</an_name><an_price>75</an_price></animal>
<animal><an_id>137</an_id><an_type>bird</an_type><an_name>Mr. Peanut</an_name><an_price>250</an_price></animal>
</pets></client>');
 
insert into a_xml.xml_animals values (2, 
'<client cl_id="3908"><cl_name>Nelson</cl_name><pets>
<animal><an_id>1201</an_id><an_type>cat</an_type>
<an_name>Ursula</an_name><an_name>Snookums</an_name><an_name>Mittens</an_name><an_price>500</an_price></animal>
</pets></client>');
 
 insert into a_xml.xml_animals values (3,
'<client cl_id="3775"><cl_name>Miller</cl_name><pets/></client>');
 
 insert into a_xml.xml_animals values (4,
'<client cl_id="8467"><cl_name>Miller</cl_name><pets>
<animal><an_id>205</an_id><an_type>bird</an_type><an_name>ShowBoat</an_name><an_price>75</an_price></animal>
<animal><an_id>207</an_id><an_type>bird</an_type><an_name>Mr. Peanut</an_name><an_price>150</an_price></animal>
<animal><an_id>212</an_id><an_type>bird</an_type><an_name>Tweet</an_name><an_price>275</an_price></animal>
<animal><an_id>215</an_id><an_type>bird</an_type><an_name>Charlie</an_name><an_price>380</an_price></animal>
</pets></client>');
 
 insert into a_xml.xml_animals values (5,
'<client cl_id="4578"><cl_name>Leeson</cl_name><pets>
<animal><an_id>358</an_id><an_type>bird</an_type><an_name>Archibald</an_name><an_price>275</an_price></animal>
<animal><an_id>369</an_id><an_type>cat</an_type><an_name>Smithers</an_name><an_name>Smuthers</an_name><an_price>250</an_price></animal>
<animal><an_id>3478</an_id><an_type>dog</an_type><an_name>Bossun</an_name><an_price>250</an_price></animal>
</pets></client>');

  insert into a_xml.xml_animals values (6,
'<client cl_id="9478"><cl_name>Terry</cl_name><pets>
<animal><an_id>658</an_id><an_type>bird</an_type><an_name>Archibald</an_name><an_price>275</an_price></animal>
<animal><an_id>669</an_id><an_type>bird</an_type><an_name>Smithers1</an_name><an_name>Smuthers2</an_name><an_price>250</an_price></animal><
animal><an_id>2478</an_id><an_type>bird</an_type><an_name>cat </an_name><an_price>250</an_price></animal>
</pets></client>');
 

  insert into a_xml.xml_animals values (7,
'<client cl_id="4478"><cl_name>Clyde</cl_name><pets>
<animal><an_id>101</an_id><an_type>bird</an_type><an_name>Archibald</an_name><an_price>275</an_price></animal>
<animal><an_id>102</an_id><an_type>cat</an_type><an_name>Smithers</an_name><an_name>Smuthers</an_name><an_price>250</an_price></animal>
<animal><an_id>103</an_id><an_type>dog</an_type><an_name>Bossun</an_name><an_price>250</an_price></animal>
<animal><an_id>301</an_id><an_type>bird</an_type><an_name>Archibald</an_name><an_price>275</an_price></animal>
<animal><an_id>201</an_id><an_type>cat</an_type><an_name>Smithers</an_name><an_name>Smuthers</an_name><an_price>250</an_price></animal>
<animal><an_id>401</an_id><an_type>dog</an_type><an_name>Bossun</an_name><an_price>250</an_price></animal>
</pets></client>');


/*  TASK 02 */
-- multiple pets where first pet is a cat (task 3)
insert into a_xml.xml_animals values (8,
	'<client cl_id="1111"><cl_name>Mark</cl_name><pets>
	<animal><an_id>9</an_id><an_type>cat</an_type><an_name>Boots</an_name><an_price>50</an_price></animal>
	<animal><an_id>10</an_id><an_type>rodent</an_type><an_name>Furball</an_name><an_price>20</an_price></animal>
	</pets></client>');

-- multiple pets with multiple names (task 6), include last pet as a cat (task 3)
insert into a_xml.xml_animals values (9,
	'<client cl_id="1112"><cl_name>Jason</cl_name><pets>
	<animal><an_id>11</an_id><an_type>snake</an_type><an_name>Mr. Hiss</an_name><an_name>Greeny</an_name><an_price>160</an_price></animal>
	<animal><an_id>12</an_id><an_type>cow</an_type><an_name>Hughbert</an_name><an_name>Hefney</an_name><an_price>300</an_price></animal>
	<animal><an_id>8</an_id><an_type>cat</an_type><an_name>Huggles</an_name><an_name>Pops</an_name><an_price>150</an_price></animal>
	</pets></client>');
	
-- an_type caterpillar to test wildcard for cat	(task 3)
insert into a_xml.xml_animals values (10,
	'<client cl_id="1113"><cl_name>Freddy</cl_name><pets>
	<animal><an_id>16</an_id><an_type>caterpillar</an_type><an_name>Wiggles</an_name><an_name>Fuzzy</an_name><an_price>1</an_price></animal>
	</pets></client>');
	
-- pet with name "NULL" not NULL value (task 7)
insert into a_xml.xml_animals values (11,
	'<client cl_id="1114"><cl_name>Freddy</cl_name><pets>
	<animal><an_id>16</an_id><an_type>spider</an_type><an_name>NULL</an_name><an_price>550</an_price></animal>
	<animal><an_id>13</an_id><an_type>spider</an_type><an_name>Furball</an_name><an_price>500</an_price></animal>
	</pets></client>');
	
-- empty an_name (task 7)
insert into a_xml.xml_animals values (12,
	'<client cl_id="1111"><cl_name>Trisha</cl_name><pets>
	<animal><an_id>14</an_id><an_type>lizard</an_type><an_name></an_name><an_price>80</an_price></animal>
	<animal><an_id>15</an_id><an_type>snake</an_type><an_name>Snake</an_name><an_price>130</an_price></animal>
	</pets></client>');
		
-- display the data
Select extractValue(datax, '/client/cl_name') as Client
, extractValue(datax, '/client/pets/animal/an_type') as TypeOfAnimal
, extractValue(datax, '/client/pets/animal/an_name') as AnimalName
, extractValue(datax, '/client/pets/animal/an_price') as AnimalPrice
From a_xml.xml_animals;


/*  TASK 03 */
Select extractValue(datax, '/client/cl_name') as Client
, extractValue(datax, '/client/@cl_id') as ClientID
From a_xml.xml_animals
Where extractValue(datax, '//an_type') LIKE '% cat %'
or extractValue(datax, '//an_type') LIKE 'cat'
or extractValue(datax, '//an_type') LIKE 'cat %'
or extractValue(datax, '//an_type') LIKE '% cat';


/*  TASK 04 */
Select extractValue(datax, '/client/cl_name') as Client
, extractValue(datax, '/client/@cl_id') as ClientID
From a_xml.xml_animals
Where extractValue(datax, 'count(/client/pets/animal[an_type="cat"])') > 0;


/*  TASK 05 */
Select extractValue(datax, '/client/cl_name') as Client
, extractValue(datax, '/client/@cl_id') as ClientID
, extractValue(datax, '/client/pets/animal/an_type') as Animal
, extractValue(datax, '/client/pets/animal/an_price') as Price
From a_xml.xml_animals
Where extractValue(datax, 'count(/client/pets/animal[an_price=250 and an_type="bird"])') > 0;


/*  TASK 06 */
Select Client
, ClientID
, case 
    when Type is null or Type = ""then 'no animals'
    when Name is null then concat(Type, ' with no name')
    else concat(Type, ' named ', Name)
end as Animal_First
From (
	Select extractValue(datax, '/client/cl_name') as Client
	, extractValue(datax, '/client/@cl_id') as ClientID
	, extractValue(datax, '//animal[1]/an_type') as Type
	, extractValue(datax, '//animal[1]/an_name') as Name
	From a_xml.xml_animals) tbl;


/*  TASK 07 */
Select Client
, ClientID
, case 
    when Type is null or Type = "" then 'no animals'
    when Name is null or Name = "" then concat(Type, ' with no name')
    else concat(Type, ' named ', Animal)
end as Animal_First
From (
	Select extractValue(datax, '/client/cl_name') as Client
	, extractValue(datax, '/client/@cl_id') as ClientID
	, extractValue(datax, '//animal[1]/an_type') as Type
	, extractValue(datax, '//animal[1]/an_name') as Name
	, extractValue(datax, '//animal[1]/an_name[last()]') as Animal
	From a_xml.xml_animals) tbl;


/*  TASK 08 */
-- can an_id value be NULL value otherwise I only need to test for blanks?
Select extractValue(datax, '/client/cl_name') as Client
, extractValue(datax, '/client/@cl_id') as ClientID
From a_xml.xml_animals
Where extractValue(datax, '//animal[2]/an_id') is not null 
and extractValue(datax, '//animal[2]/an_id') != ""
and (extractValue(datax, '//animal[4]/an_id') is null 
    or extractValue(datax, '//animal[4]/an_id') = "");


/*  TASK 09 */
Select extractValue(datax, '/client/cl_name') as Client
, extractValue(datax, '/client/@cl_id') as ClientID
, extractValue(datax, 'count(//animal/an_id)') as NumberOfAnimals
From a_xml.xml_animals
Order by NumberOfAnimals desc;


/*  TASK 10 */
Select extractValue(datax, '/descendant-or-self::*/@cl_id') as ClientID
, extractValue(datax, '//descendant::*') as Client
From a_xml.xml_animals\G

-- combined? Not sure how to display client ID and then all of it's descendant
-- book example wasn't helpful
Select extractValue(datax, '/client/@cl_id | /descendant::*') as ClientInfo
From a_xml.xml_animals\G


/*  TASK 11 */
Select extractValue(datax, '/client/cl_name') as Client
, extractValue(datax, '/client/@cl_id') as ClientID
, extractValue(datax, '//animal/an_type[self:text()="bird"]/../an_name[1]') as AnimalName
, extractValue(datax, '//animal/an_type[self:text()="bird"]/../child::*') as AnimalData
From a_xml.xml_animals\G


/*  TASK 12 */
Select Client, ClientID, nullif(AnimalName,"") as AnimalName, nullif(AnimalData, "") as AnimalData
From (
	Select extractValue(datax, '/client/cl_name') as Client
	, extractValue(datax, '/client/@cl_id') as ClientID
	, extractValue(datax, '//animal/an_type[self:text()="bird"]/../an_name[1]') as AnimalName
	, extractValue(datax, '//animal/an_type[self:text()="bird"]/../child::*') as AnimalData
	From a_xml.xml_animals) tbl\G
