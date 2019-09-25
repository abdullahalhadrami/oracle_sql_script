select * from tab;
desc emp;
select * from emp;
drop table emp;
select * from tab;
desc emp;
desc RECYCLEBIN;
select * from RECYCLEBIN;
flashback table emp to before drop;
select * from tab;
desc emp;
select * from emp;

--drop table with purge option
drop table emp purge;
select * from RECYCLEBIN;
flashback table emp to before drop;
select * from tab;
desc emp;
select * from emp;

