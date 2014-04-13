use a_testbed;

Drop table if exists upd_exam_details       ;
Drop table if exists upd_exam_headers       ;
Drop table if exists upd_animals            ;
 
 
-- animals
create table upd_animals (
     an_id            numeric(6)   
   , an_name          varchar(25)  null
   , an_type          varchar(25)  not null   
   , an_status        varchar(3)   null
   , constraint upd_animal_pk primary key(an_id)
   , constraint upd_animal_status check (an_status in ('C', 'NC'))
)
engine = innoDb;


-- exams
create table upd_exam_headers (
    ex_id           numeric(6)   
  , ex_date         date          not null 
  , an_id           numeric(6)    not null
  , constraint upd_exam_pk primary key (ex_id)
)
engine = innoDb;

-- exam details
create table upd_exam_details (
    ex_id           numeric(6)        
  , srv_id          numeric(6)     not null                    
  , ex_fee          numeric(6,3)   not null
  , constraint upd_exam_detail_pk primary key(ex_id, srv_id)
)
engine = innoDb;
-- end of creates

