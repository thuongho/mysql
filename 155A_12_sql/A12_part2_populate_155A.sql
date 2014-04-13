use a_testbed;

--  upd populates
-- clear earlier versions of tables
delete from upd_services_changes_4;
delete from upd_services_changes_3;
delete from upd_services_changes_2;
delete from upd_services_changes_1;

delete from upd_services ;

   
-- services ------------------
insert into upd_services values
  ( 100, 'Consult- no charge',            0.00)
, ( 101, 'Routine Exam- Bird',           35.00)
, ( 102, 'Followup Exam-Bird',           32.00)
, ( 103, 'Routine Exam-Feline',          50.00)
, ( 104, 'Followup Exam-Feline',         45.00)
, ( 105, 'Routine Exam-Reptile',         25.00)
, ( 106, 'Followup Exam-Reptile',        23.00)
, ( 107, 'Rabies_V-2008 SFall-Canine',   15.00)
, ( 108, 'Rabies_V-2008 SFall-Feline',   15.00)
, ( 109, 'Rabies_Ve-2008 Spring-Canine', 25.00)
, ( 110, 'Rabies_V-2008 Spring-Feline',  25.00)
, ( 111, 'Rabies_V-Rodent',              20.00)
, ( 112, 'Rabies_V-2008 Winter-Canine',  15.00)
, ( 118, 'First Feline PCR',             20.25)
, ( 119, 'Second Feline PCR',            20.25)
, ( 120, 'Third Feline PCR',             20.25)
, ( 121, 'Flu Rhino Vacc',               26.00)
, ( 122, 'Scaly Mite',                   35.00)
, ( 123, 'Intestinal Parasite Screen',   26.00)
, ( 124, 'Tick Removal',                 15.00)
, ( 125, 'Behaviour Modification',       75.00)
, ( 126, 'Vitamin E- Concentrated',      30.00)
, ( 127, 'Sedative-Feline',              25.00)
, ( 128, 'Flea Treatment- Small Animal', 35.00)
, ( 129, 'Flea Treatment- Large Animal', 50.00)
, ( 143, 'Rabies_V-2010 SFall-Canine',   15.00)
, ( 144, 'Rabies_V-2010 SFall-Feline',   15.00)
, ( 145, 'Rabies_V-2010 Spring-Canine',  25.00)
, ( 146, 'Rabies_V-2010 Spring-Feline',  25.00)
, ( 147, 'Rabies_V-2010 Winter-Canine',  15.00)
;
   

-- Populate the changes tables
-- Version 1 -----------------------------------------------------------

insert into upd_services_changes_1 value
  ( 130, 'Routine Exam- Canine',         55.00)
, ( 131, 'Followup Exam- Canine',        35.00)
, ( 132, 'Dental Cleaning-Canine',       50.00)
, ( 133, 'Dental Cleaning-Feline',       45.00)
, ( 113, 'Amphib skin Ointment',         75.00)
, ( 116, 'Reptile dental procedure',    175.00)
, ( 117, 'Amphib dental procedure',     375.00);
	   
	   
-- Version 2-----------------------------------------------------------
insert into upd_services_changes_2 values
  ( 134, 'Vitamin E series',             55.00) 
, ( 135, 'Feline PCR Series',            75.00) 
, ( 114, 'H1N1 vaccine',                 75.00) 
, ( 115, 'H1N2 vaccine',                 75.00) 
, ( 127, 'Sedative- small mammal',       75.00)
, ( 111, 'Rabies_V-Rodent',              25.00); 


-- Version 3-----------------------------------------------------------
insert into upd_services_changes_3 values
  ( 128, 'Flea Treatment- Small Animal', 45.00)  
, ( 111, '',                             35.25) 
, ( 122, 'Scaly Mite Powder',             null) 
, ( 138, 'Flu Rhino Vaccine enhanced',  125.00) 
, ( 124, null,                           25.95) 
, ( 129, 'Flea Treatment- Large Animal', 65.00)  
, ( 136, 'Hazardous Materials Disposal', 10.50) 
, ( 126, 'Vitamin E- Concentrated',      45.00)
, ( 106, '',                             30.00)
, ( 105, Null,                           35.00); 


-- Version 4-----------------------------------------------------------
insert into upd_services_changes_4 values
  ( 137, 'Antibiotic 500mg',            200.00)
, ( 127, 'Sedative-Feline',              95.50)
, ( 138, 'Antibiotic 100mg',             45.00)
, ( 139, 'Antibiotic 250mg',            145.00)
, ( 140, 'Fish Hook Removal',            20.00)
, ( 141, 'Fox Tail Removal',              0.00)
, ( 112, 'Rabies_V-2008 Winter-Canine', -15.00)
, ( 116, 'Reptile dental procedure',    225.00)
, ( 128, 'Flea Treatment- Small Animal', 37.50); 

