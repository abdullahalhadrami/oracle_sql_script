desc employees;
insert into employees values(7499,'ALLEN','20-FEB-81','SALESMAN',1600,7698,30,300);
select * from employees;
--inserting null values
--=====================
--1- explicit null(BY USER)
insert into employees values(7369,'SMITH','17-DEC-80','CLERK',800,7902,20,NULL);
select * from employees;
--2- implicit null(BY ORACLE)
insert into employees (emp_no,emp_name,job,basic_sal) values(5720,'WARD','SALESMAN',1250);
select * from employees;

--using substitutional operators
--==============================
--1- single ampersand &
insert into employees(emp_no,emp_name) values(&employee_no,'&employee_name');
select * from employees;
--2- double ampersand &&
insert into employees(emp_no,emp_name,hiredate) values(&employee_no,'&employee_name','&&hiredate');
select * from employees;
COMMIT;


