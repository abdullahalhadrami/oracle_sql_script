--ADDING UNIQUE CONSTRAINT TO EXISTING TABLE:
--===========================================
create table emp2(
      empno number(4),
      ename varchar2(10),
      sal number(7,2),
      hiredate date,
      deptno number(4)
      );
alter table emp2 add constraint emp2_empno_un  unique(empno);
select * from user_constraints where table_name='EMP2';	

--if table emp2 contains data 
-----------------------------
--first drop the unique constrait and then insert data into table
--               or
--drop the emp2 table and re-create it and then insert data into table
drop table emp2;
create table emp2(
      empno number(4),
      ename varchar2(10),
      sal number(7,2),
      hiredate date,
      deptno number(4)
      );
      
insert into emp2 values(7639,'SMITH',800,'12-jan-17',20);
insert into emp2 values(7639,'ALLEN',1600,'25-may-12',30);
select * from emp2;
alter table emp2 add constraint emp2_empno_un  unique(empno);


--ADDING CHECK CONSTRAINT TO EXISTING TABLE:
--===========================================
truncate table emp2;
alter table emp2 add constraint emp2_sal_chk check(sal>=3000);
insert into emp2 values(7369,'SMITH',800,'17-DEC-80',20);
insert into emp2 values(7839,'KING',5000,'17-NOV-81',30);

select * from emp2;

--if table emp2 contains data 
-----------------------------
--first drop the CHECK constrait and then insert data into table
--               or
--drop the emp2 table and re-create it and then insert data into table
drop table emp2;
create table emp2(
      empno number(4),
      ename varchar2(10),
      sal number(7,2),
      hiredate date,
      deptno number(4)
      );
      
insert into emp2 values(7369,'SMITH',800,'17-DEC-80',20);
select * from emp2;
alter table emp2 add constraint emp2_sal_chk check(sal>=3000)NOVALIDATE;

--ADDING PRIMARY KEY CONSTRAINT TO EXISTING TABLE:
--================================================
create table dept2(
        deptno number(4),
        dname varchar2(15),
        loc varchar2(20)
        );
alter table dept2 add constraint dept2_deptno_pk primary key( deptno );

--if table dept2 contains data:
-------------------------------
--first drop the PRIMARY KEY constrait and then insert data into table
--               or
--drop the dept2 table and re-create it and then insert data into table
drop table dept2;
create table dept2(
        deptno number(4),
        dname varchar2(15),
        loc varchar2(20)
        );
        
insert into dept2 values(10,'accounting','new york');
insert into dept2 values(10,'research','chicago');
insert into dept2 values(null,'research','chicago');
select * from dept2;
alter table dept2 add constraint dept2_deptno_pk primary key( deptno );

select * from dept;

--ADDING FOREIGN KEY CONSTRAINT TO EXISTING TABLE:
--================================================
alter table emp2 add constraint emp2_deptno_fk 
                            foreign key (deptno) references dept2(deptno);
select * from emp2;
select * from dept2;
truncate table emp2;
--ADDING NOT NULL CONSTRAINT TO EXISTING TABLE:
--=============================================
alter table emp2 modify ename constraint emp2_ename_nn not null;

--if table emp2 contains data 
-----------------------------
--first drop the NOT NULL constrait and then insert data into table
--               or
--drop the dept2 table and re-create it and then insert data into table
drop table emp2;
create table emp2(
      empno number(4),
      ename varchar2(10),
      sal number(7,2),
      hiredate date,
      deptno number(4)
      );
      
insert into emp2 values(7369,null,800,'17-DEC-80',20);
insert into emp2 values(7839,null,5000,'17-NOV-81',30);
select * from emp2;
alter table emp2 modify ename constraint emp2_ename_nn not null;

--ADDING DEFAULT CONSTRAINT TO EXISTING TABLE:
--============================================
 alter table emp2 modify hiredate default sysdate;






