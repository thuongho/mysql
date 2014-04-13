use a_xml;

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

