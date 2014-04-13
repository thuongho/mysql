-- demo 01
create table xml_bk_1(
  id    int primary key
, datax TEXT)
;

-- demo 02
truncate table xml_bk_1;
insert into xml_bk_1 values (1,
'<book  catalog_id="124">
    <title>SQL is Fun</title>
    <authors>
    <name>
      <first>Joan</first><last>Collins</last>
    </name>
    <name>
      <first>Jill</first><last>Effingham</last>
    </name>
    </authors>
    <categories>
      <topic>SQL</topic>
      <topic>DB</topic>
    </categories>
    <price>29.95</price>
    <publisher>Addison Wesley</publisher>   
</book>'
);

insert into xml_bk_1 values (2,
'<book  catalog_id="275">
    <title>Databases: an Introduction</title>
    <authors>
      <name>
        <first>Mike</first><last>Malone</last>
      </name>
      <name>
        <first>Jill</first><last>Effingham</last>
      </name>
    </authors>
    <categories>
      <topic>SQL</topic>
      <topic>DB</topic>
      <topic>XML</topic>
    </categories>
    <price>79.95</price>
    <publisher>Addison Wesley</publisher>   
</book>'
);
insert into xml_bk_1 values (3,
'<book catalog_id="313">
    <title>Visual Basic and MySQL</title>
    <authors>
      <name><first>Shirley</first><last>Horn</last></name>
      <name><first>Joe</first><last>Cocker</last></name>
      <name><first>Wayne</first><last>Shorter</last></name>
    </authors>
    <categories>
      <topic>VB</topic>
      <topic>MySQL</topic>
      <topic>SQL</topic>
      <topic>DB</topic>
    </categories>
    <price>58.95</price>
    <publisher>Scott Foresman</publisher>
</book>'
);
insert into xml_bk_1 values (4,
'<book catalog_id="49375">
    <title>Databases- Design and Logic</title>
    <authors>
      <name><first>Betty</first><last>LaVette</last></name>
    </authors>
    <categories>
    </categories>
    <price>105.95</price>
    <publisher>McGraw Hill</publisher>
</book>'
);

insert into xml_bk_1 values (5,
'<book catalog_id="5508">
    <title>The truth about everything</title>
    <authors>
      <name><first>June</first><last>Del Ansom</last></name>
    </authors>
    <categories>
      <topic></topic>
    </categories>
    <price>79.95</price>
    <publisher>Addison Wesley</publisher>
</book>'
);
insert into xml_bk_1 values (6,
'<book catalog_id="6006">
    <title>Alice Goes to Oz</title>
    <authors>
      <name><first>Lewis</first><last>Dodgson</last></name>
      <name><first>L. Frank</first><last>Baum</last></name>
    </authors>
    <categories>
      <topic>Fiction</topic>
      <topic>Travel</topic>
    </categories>
      <price>29.50</price>
    <publisher>Addison Wesley</publisher>
</book>'
);

insert into xml_bk_1 values (7,
'<book  catalog_id="125">
    <title>The House Inside</title>
    <authors>
    <name>
      <first>Peter</first><last>Collins</last>
    </name>
    <name>
      <first>Henry</first><last>Collins</last>
    </name>
    </authors>
    <categories>
      <topic>Hist</topic>
    </categories>
    <price>99.95</price>
    <publisher>Addison Wesley</publisher>   
</book>'
);


Select * from xml_bk_1\G

-- demo 03
Select * from xml_bk_1 limit 2\G

-- demo 04
Select id
, extractValue(datax, '/book/price' )          
from xml_bk_1;

Select id
, extractValue(datax, '/book/title' )          
from xml_bk_1;


-- demo 05
Select id
, extractValue(datax, '/book/authors/name/last' )          
from xml_bk_1;

-- demo 06
Select id, extractValue(datax, '/book/Price' )          
from xml_bk_1;

-- demo 07
Select id, extractValue(datax, '/book/pice' )          
from xml_bk_1;

-- demo 08
Select id, extractValue(datax, '/price' )          
from xml_bk_1;

Select id, extractValue(datax, 'price' )          
from xml_bk_1;

Select  extractValue(datax, 'price' )          
from xml_bk_1;

-- demo 09
Select  coalesce(extractValue(datax, 'price' )  , 'Nothing')        
from xml_bk_1;
Select  concat(extractValue(datax, 'price' )  , 'Nothing')        
from xml_bk_1;

-- demo 10
Select id, extractValue(datax, 'book/price' )          
from xml_bk_1;

-- demo 11
Select id
, extractValue(datax, '//price' )  as Price
, Concat(extractValue(datax, '//first' ) , ' ', 
         extractValue(datax, '//last' ) )   as Authors       
from xml_bk_1;

-- demo 12
Select id, extractValue(datax, '/book/title' )  As Title
from xml_bk_1
where extractValue(datax, '/book/price' ) > 50;


-- demo 13
select extractValue (
'<animal>
 <an_id>136</an_id>
 <an_type>bird</an_type>
 <an_name>ShowBoat</an_name>
 <an_price>75</an_price>
 <an_dob>2000-01-15</an_dob>
 </animal>', 'animal/an_name')  as Result;

-- demo 14
select extractValue (
'<animal>
 <an_id>136</an_id>
 <an_type>bird</an_type>
 <an_name>ShowBoat</an_name>
 <an_price>75
 <an_dob>2000-01-15</an_dob>
 </animal>', 'animal/an_name')  as Result;

-- demo 15
Select id
, extractValue(datax, '//price' )              as Price
, extractValue(datax, '//title  | //topic'  )  as "Title and  Topics"       from xml_bk_1;


select * from xml_bk_1 where id in (4,5);

-- demo 16
Select id
, extractValue(datax, '//price' )  as Price
, concat(extractValue(datax, '//title') ,
        ' (categories: ' ,  
        extractValue(datax, '//topic'  ), ')' )  as "Title and  Topics"       
from xml_bk_1;


-- demo 17
Select id
, extractValue(datax, 'book/@catalog_id' )  as "catalog id"        
from xml_bk_1;


-- demo 18
Select id
, extractValue(datax, '//title ') as Title
, extractValue(datax, '//topic[1]'  )   as "tpc 1"
, extractValue(datax, '//topic[2]'  )   as "tpc 2"
, extractValue(datax, '//topic[3]'  )   as "tpc 3"
, extractValue(datax, '//topic[4]'  )   as "tpc 4"
, extractValue(datax, '//topic[5]'  )   as "tpc 5"
from xml_bk_1;

-- demo 19
Select id
, extractValue(datax, '//title ') as Title
, extractValue(datax, '//topic[last()]'  )   as "last topic"
 from xml_bk_1;

-- demo 20
Select id
, cast(extractValue(datax, '//title ') as char(10))as Title
, extractValue(datax, '//topic[last()]'  )   as "last topic"
, extractValue(datax, '//topic[last()-1]'  ) as "almost topic"
, extractValue(datax, '//topic[last()-2]'  ) as "third from the end"
 from xml_bk_1;


-- demo 21
SELECT 
ExtractValue('<animal><an_name>ShowBoat</an_name></animal>', '/animal/an_name') as name
,
ExtractValue('<animal><an_name>ShowBoat</an_name></animal>', 'count(/animal/an_name)') as CountValue;

-- demo 22
SELECT 
ExtractValue('<animal><an_name>Tweetie</an_name><an_name>Sylvester</an_name></animal>', '/animal/an_name') as name
,
ExtractValue('<animal><an_name>Tweetie</an_name><an_name>Sylvester</an_name></animal>', 'count(/animal/an_name)') as CountValue;

-- demo 23
select 
ExtractValue('<animal><an_name></an_name></animal>', '/animal/an_name') as name
,
ExtractValue('<animal><an_name></an_name></animal>', 'count(/animal/an_name)') as CountValue;

-- demo 24
SELECT 
ExtractValue('<animal><an_price>75</an_price></animal>', '/animal/an_name') as name
,
ExtractValue('<animal><an_price>75</an_price></animal>', 'count(/animal/an_name)') as CountValue;

-- demo 25
Select id
, Concat(extractValue(datax, '//first' ) , ' ', 
         extractValue(datax, '//last' ) )   as Authors  
, 	ExtractValue(datax, 'count(//last)') as authorCount	 
from xml_bk_1;

-- demo 26
Select id
, extractValue(datax, '//title' )  as Title
, Concat(extractValue(datax, '//first' ) , ' ', 
         extractValue(datax, '//last' ) )   as Authors   
from xml_bk_1
where ExtractValue(datax, 'count(//last)') =1;


-- demo 27
set @x1 ='<book  catalog_id="624">
    <authors>
    <name><first>Joan</first><last></last></name>
    <name><first></first><last>Effingham</last></name>
    </authors>
</book>';

select 
extractvalue(@x1, '//first');

-- demo 28
select concat(
 extractvalue(@x1, '//first')
, ' '
, extractvalue(@x1, '//last')
) as author
, ExtractValue(@x1, 'count(//last)') as authorCount
; 

-- bug
set @x2 ='//first';
select extractvalue(@x1, @x2)

 
-- demo 29
select 
  ExtractValue('<animal><an_price>75</an_price></animal>', 'count(/animal[an_price=75])') as CountValue1

 , ExtractValue('<animal><an_price>75</an_price></animal>', 'count(/animal[an_price=85])') as CountValue2

  , ExtractValue('<animal><an_price>75</an_price></animal>', 'count(/animal[an_price!=75])') as CountValue3
  ;

-- demo 30
select
  ExtractValue('<animal><an_price>75</an_price></animal>', 'count(/animal[an_price>=50])') as CountValue1

 , ExtractValue('<animal><an_price>75</an_price></animal>', 'count(/animal[an_price>100])') as CountValue2;

-- demo 31
select 
  ExtractValue('<animal><an_name>ShowBoat</an_name></animal>', 'count(/animal[an_name="ShowBoat"])') as CountValue1

 , ExtractValue('<animal><an_name>ShowBoat</an_name></animal>', 'count(/animal[an_name="Showboat"])') as CountValue2;

-- demo 32
select id
, extractValue(datax, '/book/price' ) As Price  
, extractValue(datax, '/book/title' ) as Title
from xml_bk_1
where extractValue (datax, 'count(/book[price= 29.95])')  > 0;

-- demo 33
select id
, extractValue(datax, '/book/price' ) As Price  
, extractValue(datax, '/book/title' ) as Title
from xml_bk_1
where extractValue (datax, 'count(/book[price>= 29.95  and price<= 60 ])')  > 0;

-- demo 34
select 
ExtractValue('<animal><an_name>ShowBoat</an_name></animal>',  'contains(/animal/an_name, "Showboat")')  as test_1
,
ExtractValue('<animal><an_name>ShowBoat</an_name></animal>',  'contains(/animal/an_name, "oa")') as test_2
,
ExtractValue('<animal><an_name>ShowBoat</an_name></animal>',  'contains(/animal/an_name, "oo")') as test_3;


-- demo 35
Select id
, extractValue(datax, '/book/title' ) as title
, extractValue(datax, '//topic' ) as topiclist
from   xml_bk_1
where  extractValue(datax,'count(//categories/topic[self:text()="DB"])') > 0;

-- demo 36
select id
, extractValue(datax,'/book/title') as title
, extractValue(datax, '//topic' ) as topiclist
from xml_bk_1
where extractValue(datax,'count(//categories/topic[self:text()="XML"  or self:text()="Travel"])') > 0;

-- demo 37
select extractValue(datax,'/book/categories/child::*') 
from  xml_bk_1
limit 2;

-- demo 38
select extractValue(datax,'//name/child::*') 
from  xml_bk_1
;

-- demo 39
select 
ExtractValue('<animal><an_name>Tweetie</an_name><an_name>Sylvester</an_name><price>24</price></animal>' ,'/animal/child::an_name')  as col_1
,
 ExtractValue('<animal><an_name>Tweetie</an_name><an_name>Sylvester</an_name><price>24</price></animal>' ,'/animal/child::*')  as Col_2
;

-- demo 40
select extractValue(datax,'/book/child::*') 
from  xml_bk_1
limit 2;

-- demo 41
Select id
, extractValue(datax,'(//title)') as "All Titles"
, extractValue(datax,'(//categories/topic[self:text()="SQL"]/../../price)') as "SQL Title Prices"
from   xml_bk_1
;


-- demo 42
select id
, extractValue (datax, '(//name[last="Effingham"]/first)') As Effingham_FirstName_v1
, extractValue (datax, '(//name/last[self:text()="Effingham"]/../first)') As Effingham_FirstName_v2
from xml_bk_1
;

-- demo 43
Select id
, Concat(extractValue(datax, '//name[1]/first' )  , ' ' 
      ,  extractValue(datax, '//name[1]/last' )  )  as FirstAuthor
, Concat(extractValue(datax, '//name[2]/first' )  , ' ' 
      ,  extractValue(datax, '//name[2]/last' )  )  as SecondAuthor 	  
from xml_bk_1;



-- demo 44
select replace(extractValue(datax,'/book/child::*'), '\n', '')   as Result
from  xml_bk_1
limit 2;

-- demo 45
select 
replace(replace(extractValue(datax,'/book/child::*'), '\n', ''), ' ' ,'')  
   as Result
from  xml_bk_1
limit 2;

-- demo 46
select 
replace(replace(extractValue(datax,'/book/child::*'), '\n', ''), '  ' ,'')  as result
from  xml_bk_1
limit 2;

-- demo 47
create table xml_bk_2(
  id    int primary key
, datax TEXT)
;
truncate table xml_bk_2;
insert into xml_bk_2 values (1,
'<book><title>SQL is Fun</title><authors><name><first>Joan</first><last>Collins</last></name><name><first>Jill</first><last>Effingham</last></name></authors><categories><topic>SQL</topic><topic>DB</topic></categories><price>29.95</price><publisher>Addison Wesley</publisher></book>'
);

insert into xml_bk_2 values (2,
'<book><title>Databases: an Introduction</title><authors><name><first>Mike</first><last>Malone</last></name></authors><categories><topic>SQL</topic><topic>DB</topic></categories><price>79.95</price><publisher>Addison Wesley</publisher></book>'
);
insert into xml_bk_2 values (3,
'<book><title>Databases3: an Introduction</title><authors><name><first>Mike</first><last>Malone</last></name></authors><categories><topic>SQL</topic><topic>VB</topic><topic>DB</topic></categories><price>45</price><publisher>Addison Wesley</publisher></book>'
);
insert into xml_bk_2 values (4,
'<book><title>Databases4: an Introduction</title><authors><name><first>Mike</first><last>Malone</last></name></authors><categories></categories><price>53</price><publisher>Addison Wesley</publisher></book>'
);

insert into xml_bk_2 values (5,
'<book><title>Databases5: an Introduction</title><authors><name><first>Susan</first><last>Malone</last></name></authors><categories><topic></topic></categories><price>79.95</price><publisher>Addison Wesley</publisher></book>'
);
insert into xml_bk_2 values (6,
'<book><title>Databases: an Introduction</title><authors><name><first>June</first><last>Del Ansom</last></name></authors><categories><topic>VB</topic><topic>DB</topic></categories><price>79.95</price><publisher>Addison Wesley</publisher></book>'
);

-- demo 45
select extractValue(datax,'/book/child::*') 
from  xml_bk_2
limit 2;

-- demo 46
 select extractValue(
 '<book><name>SQL is Fun</name><authors><name>Joan Collins</name><name>Jill Effingham</name></authors><categories><topic>SQL</topic><topic>DB</topic></categories><price>29.95</price><publisher><name>Addison Wesley</name></publisher></book>', '//name') as Result;

 
 









