/*
NOT NULL CONSTRAINT
===================
Example:
--------
Create student table with stdno, stdname.
validations:
------------
student id is mandatory (should not be null).

Table creation:
--------------- */
Create Table student
 ( stdno Number(4) 
	Constraint student_stdid_nn NOT NULL,
   stdname varchar2(20)
 );
 
 desc student;

--Testing :
-----------

 Insert into student values( 1001, 'king' );
 Insert into student values( NULL, 'scott' );  -- error
 Insert into student Values( 1001, 'smith');  -- accepted

select * from student;


/*
UNIQUE CONSTRAINT
=================
Example1:
---------
Create a student table with stdid, stdname

validations :
-------------
 Stdid should not allow Duplicate Values.

Table creation:
---------------   */
drop table student;
  Create table student
  ( stdid Number(4) 
      constraint student_stdid_un UNIQUE,
    stdname varchar2(20)
  );
  
desc student;
--USER_CONSTRAINTS and USER_CONS_COLUMNS
--======================================
desc USER_CONSTRAINTS;
select * from user_constraints where table_name='STUDENT';

desc USER_CONS_COLUMNS;
select * from user_cons_columns where table_name='STUDENT';

--Testing :
-----------
 Insert into student values ( 1001, 'smith' );
 Insert into student values ( 1002, 'jons' );
 Insert into student values ( 1001, 'allen' );   -- error
 Insert into student values ( NULL, 'king' );
 Insert into student values ( NULL, 'blake' );
 select * from student;

 
/*
EXAMPLE 2 : How to add two constraints to a single column :
-----------------------------------------------------------
create a student table with stdid, stdname .

Validations:
------------
- stdid is mandatory
-stdid should not accept duplicate values

Table creation:
--------------- */
drop table  student;
 Create table student
 ( stdid number(10)
     constraint student_stdid_nn NOT NULL 
     constraint student_stdid_un UNIQUE,
   stdname varchar2(20)
 );
 desc student;

--Testing:
----------

 Insert into student values ( 1001, 'smith' );
 Insert into student values ( 1002, 'jons' );
 Insert into student values ( 1001, 'allen' );   -- error
 Insert into student values ( NULL, 'king' );    -- error
 
 select * from student;
 