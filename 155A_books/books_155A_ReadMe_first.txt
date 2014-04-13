 Before running these scripts you need to have created the a_bkorders and a_bkinfo databases.


The order for running the scripts is
1.  Create the databases- use the sql in the file book_schemas_155A
You may need to do this as root and then give your other account permission to use these databases ( see unit 1 if you forgot about this)

2.  run the create script - it will remove any previous copy of the tables you might have.

3.  run the inserts script - it will delete any data from the tables and then do the inserts.

If later in the semester you want to get back to the original set of data and you have not dropped any of the tables, you can just run the inserts script.

These scripts are easier to run as scripts rather than as copy and paste. 

Then you need to study the two pdf documents included.
One is Books_155A.pdf. This includes the graphic for the tables and a discussion of how the tables are related. It also includes a section that starts: Some general rules regarding this database and the assignments. This includes some definition of terms and rules that is *not* repeated on each assignment but that are required for the assignments. 
The second document is the first of the notes document for this unit (155A_09-01_notes_Tables_datatypes_constraints.pdf) . It focuses on the structure of the tables and the data type and constraint rules. This also is required reading for the rest of the assignments.
