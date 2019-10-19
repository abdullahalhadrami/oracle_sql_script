/*
PRIMARY KEY Constraint
======================
Example
-------
-> Create a dept_mas table with Deptno, DName & Loc

Validations:
------------

  -> Deptno is Mandatory(not null) 

  -> Deptno should not allow duplicate values(unique)

Table creation:
--------------- */
drop table dept_mas;
 Create table Dept_Mas
 ( Deptno Number(2)
      constraint Dept_mas_Deptno_Pk PRIMARY KEY,
   Dname varchar2(10),
   Loc Varchar2(10)
 );

--Testing:
----------

 Insert into Dept_mas values ( 10, 'ACC','NEW YOURK' );
 Insert into Dept_mas values ( 20, 'RES','DALLAS' );
 Insert into Dept_mas values ( 30, 'FIN','CHICAGO' );
 Insert into Dept_mas values ( 10, 'ADMIN','BOSTON' ); -- ERROR
 Insert into Dept_mas values ( NULL, 'SALES','HYD' ); -- ERROR

 select * from dept_mas;
  
 /*
 FOREIGN KEY Constraint
 ======================
 Example1:
----------
  -> create a employee table with Empno, Ename & Deptno

validations:
-------------
  -> Inserted deptno should be available in dept master table.

Table creation:
--------------- 
dept_mas table creation
----------------------- */
drop table dept_mas;
 Create table Dept_Mas
 ( Deptno Number(2)
      constraint Dept_mas_Deptno_Pk PRIMARY KEY,
   Dname varchar2(10),
   Loc Varchar2(10)
 );
--inserting data into dept_mas table
------------------------------------
 Insert into Dept_mas values ( 10, 'ACC','NEW YOURK' );
 Insert into Dept_mas values ( 20, 'RES','DALLAS' );
 Insert into Dept_mas values ( 30, 'FIN','CHICAGO' );
 
 select * from dept_mas;
--employee table creation
-------------------------
drop table employee;
 Create table Employee
 ( Empno Number(4),
   Ename varchar2(15),
   Deptno Number(2) 
      Constraint employee_deptno_fk REFERENCES dept_mas(Deptno)
 );

--Testing :
-----------
 Insert into employee values ( 1001,'SMITH',10 );
 Insert into employee values ( 1002,'ALLEN',30 );
 Insert into employee values ( 1003,'WARD',10 );
 Insert into employee values ( 1004,'BLKE',20 );
 Insert into employee values ( 1005,'JONSE',50 );   -- error
 Insert into employee values ( 1005,'KING',10 );
 Insert into employee values ( 1006,'FORD', 20 );
 Insert into employee values ( 1007,'JAMES',NULL );
 commit;

 select * from employee;
 
 delete from dept_mas where deptno=10;
 /*
 ON DELETE CASCADE 
 ON DELETE SET NULL
 
ON DELETE CASCADE
=================
Example:
--------  
create employee table
--------------------- */
drop table employee;
 Create table Employee
 ( Empno Number(4),
   Ename varchar2(15),
   Deptno Number(2) 
    Constraint employee_deptno_fk REFERENCES dept_mas(Deptno)ON DELETE CASCADE
 );

--inserting data into employee table:
-------------------------------------
 Insert into employee values ( 1001,'SMITH',10 );
 Insert into employee values ( 1002,'ALLEN',30 );
 Insert into employee values ( 1003,'WARD',10 );
 Insert into employee values ( 1004,'BLKE',20 );

 select * from employee;
 
--TESTING:
-----------
--TO DELETE A PARENT RECORD (record from dept_mas table)
delete from dept_mas where deptno=10;
select * from dept_mas;
select * from employee;

/*
ON DELETE SET NULL
==================
Example:
--------  
create employee table
--------------------- */
drop table employee;
 Create table Employee
 ( Empno Number(4),
   Ename varchar2(15),
   Deptno Number(2) 
    Constraint employee_deptno_fk REFERENCES dept_mas(Deptno)ON DELETE SET NULL
 );

--inserting data into employee table:
-------------------------------------
 Insert into employee values ( 1001,'SMITH',10 );
 Insert into employee values ( 1002,'ALLEN',30 );
 Insert into employee values ( 1003,'WARD',10 );
 Insert into employee values ( 1004,'BLKE',20 );

 select * from employee;
 
--TESTING:
-----------
--TO DELETE A PARENT RECORD (record from dept_mas table)
delete from dept_mas where deptno=10;
select * from dept_mas;
select * from employee;

/*OTHER EXAMPLES FOR FOREIGN KEY
================================
Example 2:
----------
  
Primary table:
--------------

  -> Create a course master table with Course id, course name & duration

Validations;
------------
  -> Course id is mandatory & it should be unique
  -> Course Name accepts only capital letter
  -> Minimum coursr Duration is 45 days.

Secondary table :
-----------------
 -> Create Student table with Tno, Stud Id, stud name, Course id, doj, fee

Validations:
-------------
  -> Trans. no is mandatory & it should be unique
  -> Student joining Course id should be available in Institute.
  -> Date of joining is system date
  -> Minimum registration Fee is 100/-

Table creations:
----------------
course_mas table creation
------------------------- */

 Create table course_mas
  ( Course_id Varchar2(10)
        Constraint course_mas_course_id_pk Primary key,
    Course_Name Varchar2(15)
        Constraint course_mas_course_name_chk 
		CHECK  ( course_name=Upper(course_name) ),
    Duration Number(4)
        Constraint course_mas_duration_chk 
		CHECK ( Duration >=45 )
 );


--Testing:
----------
  Insert into course_mas values('CJ','CORE JAVA',45);
  Insert into course_mas values('AJ','ADV. JAVA',60);
  Insert into course_mas values('ORA','ORACLE',50);
  Insert into course_mas values('AJ','ANGULAR JS',45); --ERROR
  Insert into course_mas values(NULL,'ANGULAR JS',45); --ERROR

select * from course_mas;

--Student table creation :
--------------------------
drop table student;
 Create table student
 ( Tno number(4) 
     constraint student_tno_pk Primary key,
   Std_id varchar2(10),
   std_name varchar2(10),
   course_id varchar2(10)
     constraint student_course_id_fk REFERENCES 
				Course_mas(Course_id),
   Doj date Default sysdate,
   Fee Number(8,2)
     constraint student_fee_chk CHECK ( Fee >=100 )
);

--Testing:
----------

  Insert into student values ( 1, 'S1', 'SMITH','CJ',default, 4000);
  Insert into student values ( 2, 'S2', 'KING','CJ',default, 100);
  Insert into student values ( 3, 'S3', 'ALLEN','ORA',default, 2000);
  Insert into student values ( 4, 'S4', 'BLAKE','C',default, 1000); --ERROR
  Insert into student values ( 5, 'S5', 'WARD',NULL,default, 100);

select * from student;

/*
Example 3:
----------
Library:
--------
book_mas  :  Book_id(pk),   book_name,     author_name

book_issue: tno(pk),   std_id,   Book_id(fk),  doi,  dor

stock     :  book_id(fk),   stock_date,   avail_stock

Example 4:
----------
bank :
-------

Bank_mas   : Accno(pk), cname, odate, mobileno, acc_type, bal

Bank_Trans : Tno(pk),  Accno(fk),  Tdate,   Ttype,   Tamount

 