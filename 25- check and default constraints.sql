/*
CHECK Constraint
================
Example:
--------
create a employee table with empid, ename, sal.

Validations:
------------
Minimum Employee Salary is 800 and maximum 5000.

Table creation:
--------------- */
drop table employee;
 Create table Employee
 ( Empid Number(4),
   Ename Varchar2(10),
   Sal Number(8,2)
    constraint employee_sal_chk Check (( Sal >=800 )and (sal<=5000))
 );

--Testing:
----------
  
  Insert into employee values ( 1001, 'king', 800 );
  Insert into employee values ( 1002, 'scott', 600 ); -- error
  Insert into employee values ( 1003, 'scott', 7000 ); -- error
  Insert into employee values ( 1004, 'jones', null );

  select * from employee;

/*
Other examples :
----------------

validation :
------------

Employ age should be grater than 21 years.

       Age Number(4) CHECK ( age >=21 )

validation:
-----------

Status should be accepts 'Y' OR 'N'  

    Status Varchar2(1) CHECK ( status in ('y','n','Y','N' ))

Validation:
-----------

Transaction amount should be mulitples of Hundereds
  
         Tamount Number(8,2) CHECK ( Mod(tamount,100)=0 )

validation:
-----------

Mobile number should be 10 digits only.

         Mobileno Number(10) CHECK ( Length(mobileno)=10 )

validation:
-----------

  -> mail id should be end with .com   

  -> mail id should be lower case

  -> mail id should contain '@' symbol

   mail_id varchar2(15)
     CHECK ( (mail_id like '%.com') 
				      AND
             ( mail_id = lower( mail_id ) )
                      AND
             ( mail_id like '%@% ')
           );
           
DEFAULT CONSTRAINT:
===================
Example:
--------
   Employee hiredate is system date
Table creation:
--------------- */
  drop table employee;
  Create table Employee
  ( Empid Number(4),
    hiredate Date Default Sysdate
  );
  

--Testing:
----------

 Insert into Employee values ( 1001, default );  
 Insert into employee( Empid ) values ( 1002 );
 Insert into Employee values ( 1003, '16-sep-19' );  
 select * from employee;
