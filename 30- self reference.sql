/*
SELF FOREIGN KEY ( self reference ) :
=====================================
Example:
---------  */
drop table employee;
Create table Employee
( empno number(4) constraint employee_empid_pk Primary key,
  ename varchar2(20),
  mgr Number(4)
     constraint employee_mgr_self_fk REFERENCES Employee(Empno) on delete cascade,
  deptno number(2)
);

--Testing:
----------
--inserting data into employee table
-------------------------------------
 Insert into employee values ( 1001, 'king', null,10 );
 Insert into employee values ( 1002, 'scott', 1001 ,20);
 Insert into employee values ( 1003, 'jones', 1002 ,10);
 Insert into employee values ( 1004,'james',1006,30);  --error
 
 select * from employee;
--deleting empno 1001 from employee table
-----------------------------------------
delete from employee where empno=1001;
select * from employee;