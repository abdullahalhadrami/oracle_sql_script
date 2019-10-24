create table emp5(
    id_no number(7) unique,
    empno number(4) primary key,
    ename varchar2(15) constraint emp5_ename_nn not null,
    sal number(7) constraint emp5_sal_chk check(sal>=2000),
    mgr number(4) constraint emp5_mgr_fk references emp5(empno) -- selef foreign key
    );

--VIEW CREATED CONSTRAINTS
--========================
select * from user_constraints where table_name='EMP5';
select * from user_cons_columns where table_name='EMP5';

--RENAME A CONSTRAINT
--===================
alter table emp5 rename constraint SYS_C009979 to emp5_empno_pk;
select * from user_constraints where table_name='EMP5';

--DISABLE CONSTRAINT
--==================
insert into emp5 values(501984,7839,'KING',5000,null);
insert into emp5 values(521989,7369,'SMITH',800,null);

alter table emp5 disable constraint emp5_sal_chk;
select * from user_constraints where table_name='EMP5';

insert into emp5 values(521989,7369,'SMITH',800,null);
select * from emp5;
--ENABLE CONSTRAINT
--==================
alter table emp5 enable constraint emp5_sal_chk;  --error
delete from emp5 where empno=7369;
alter table emp5 enable constraint emp5_sal_chk;
select * from user_constraints where table_name='EMP5';

--DROP CONSTRAINT
--===============
alter table emp5 drop constraint emp5_ename_nn;
select * from user_constraints where table_name='EMP5';

