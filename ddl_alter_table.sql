drop table employees;
--create employees table
create table employees (
                    emp_no    number(4),
                    emp_name  varchar2(10),
                    hiredate  date,
                    job       varchar2(10),
                    sal       number(7,2),
                    manager   number(4),
                    dept_no   number(2)
                );
--ALTER ADD
--Add commission, emp_photo to employees table
desc employees;
alter table employees add(commission number(4,2),emp_photo blob);
desc employees;
--===============================================================
--ALTER MODIFY
--change the emp_no data type from number to varchar2
desc employees;
alter table employees modify(emp_no varchar2(5));--here column is empty 
desc employees;
--Now let's insert data to column and then try to modify its data type
insert into employees(emp_no, emp_name,hiredate,job,sal,manager,dept_no)
               values('E101','SMITH','17-DEC-80','CLERK',800,7902,20);
insert into employees(emp_no, emp_name,hiredate,job,sal,manager,dept_no)
               values('E102','ALLEN','20-FEB-81','SALESMAN',1600,7698,30);
--Now if we try to change the data type of column emp_number from varchar2 to number then
select * from employees;
alter table employees modify(emp_no number(5));--"column to be modified must be empty to change datatype"
--Decrease the size of job column to 4
alter table employees modify(job varchar2(4));--cannot decrease column length because some value is too big
alter table employees modify(job varchar2(8));--Table EMPLOYEES altered.
--=========================================================================================================
--ALTER RENAME
desc employees;
alter table employees rename column sal to basic_sal;
desc employees;
--==========================================================
--ALTER DROP
desc employees;
alter table employees drop column commission;
desc employees;
