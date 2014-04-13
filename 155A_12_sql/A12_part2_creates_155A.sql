use a_testbed;

Drop table if exists upd_services_changes_1 ;
Drop table if exists upd_services_changes_2 ;
Drop table if exists upd_services_changes_3 ;
Drop table if exists upd_services_changes_4 ;
Drop table if exists upd_services           ;

-- services
create table upd_services (
    srv_id           numeric(6)    
  , srv_desc         varchar(50)    null
  , srv_list_price   numeric(6,2)   not null
  , constraint upd_services_pk primary key(srv_id)
);

-- treatment changes 1, 2, and 3
create table upd_services_changes_1 (
    item_id           numeric(6)     not null     
  , item_desc         varchar(50)    null   
  , item_list_price   numeric(6,2)   null
);

create table upd_services_changes_2 (
    item_id           numeric(6)     not null   
  , item_desc         varchar(50)    null   
  , item_list_price   numeric(6,2)   null
);

create table upd_services_changes_3 (
    item_id           numeric(6)     not null   
  , item_desc         varchar(50)    null   
  , item_list_price   numeric(6,2)   null
);
create table upd_services_changes_4 (
    item_id           numeric(6)     not null   
  , item_desc         varchar(50)    null   
  , item_list_price   numeric(6,2)   null
);
-- end of creates

