-- NAMING RESTRICTIONS:
CREATE TABLE 1EMP(COL NUMBER(4));


--EXAMPLE1: CREATE EMP TABLE WITH FOLLOWING COLUMNS 
--             (EMP_NO, EMP_NAME, HIREDATE, JOB, SAL, MANAGER, DEPT_NO)
create table emp (
                    emp_no    number(4),
                    emp_name  varchar2(15),
                    hiredate  date,
                    job       varchar2(10),
                    sal       number(7,2),
                    manager   number(4),
                    dept_no   number(2)
                );
--SEE TABLE DESCRIPTION
desc emp;


--EXAMPLE2: CREATE STUDENTS TABLE WITH FOLLOWING COLUMNS
--             (STD_ID, STD_NAME, ADDRESS, MOBILE, STD_PHOTO)
create table students(
                        std_id    varchar2(10),
                        ste_name  varchar2(20),
                        address   varchar2(30),
                        mobile    number(10),
                        std_photo blob
                    );
--SEE TABLE DESCRIPTION
desc students;


--EXAMPLE3: CREATE BANK_MASTER TABLE WITH THE FOLLOWING COLUMNS
--              (ACCNO, CNAME, ADRESS, OPENING_DATE, ACC_TYPE, BALANCE)
create table bank_master(
                            accno varchar2(14),
                            cname varchar2(15),
                            address varchar2(30),
                            opening_date date,
                            acc_type char(1),
                            balance number(8,2)
                        );
--SEE TABLE DESCRIPTION
desc bank_master;

--TO SEE THE LIST OF ALL CREATED TABLE 
select * from tab;

