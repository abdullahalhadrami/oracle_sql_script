--DML- UPDATE 
--===========
select * from employees;
--write SQL statement to hike all employees salary by 500
update employees set basic_sal=basic_sal+500;
select * from employees;
rollback;
select * from employees;
--write SQL statement to hike salary of SMITH by 500
update employees set basic_sal=basic_sal+500 where emp_name='SMITH';
select * from employees;
rollback;
select * from employees;

--rollback after commit or ddl commands
update employees set basic_sal=basic_sal+500 where emp_name='SMITH';
select * from employees;
commit;-- OR any DDL command 
rollback;
select * from employees;


--DML- DELETE
--===========
--Write SQL statement to delete smith details from employees table
delete from employees where emp_name='SMITH';
select * from employees;
--write SQL statement to delete all employees from employees table 
delete from employees;
select * from employees;
rollback;
select * from employees;
--rollback after commit or ddl commands
delete from employees;
select * from employees;
create table tab1(col1 number(4));
rollback;
select * from employees;
/*
COMMIT;
DDL commands;
COMMIT;
*/

--DELETE VS TRUNCATE ??