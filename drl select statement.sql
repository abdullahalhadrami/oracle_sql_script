--display employee datails of all employees from emp table
select * from emp;
--display emplyee number, name and salary from emp table
select empno, ename, sal from emp;
--display emplyee number, name and annual salary of all employees from emp table
select empno, ename, sal*12 from emp;
--display emplyee number, name and annual salary as annual_sal from emp table
select empno, ename, sal*12 as "annual sal" from emp;
--display ename,sal,comm and in the output display sal as basic sal and comm as bonus
select ename,sal as "basic sal",comm bonus from emp;

select empno, ename, sal from emp where empno;

-- SELECT WITH WHERE CLAUSE
--display employee datails of all employees whoes salary is greater than 2000
select * from emp where sal>2000;

--display employee details of all employees working as CLERK
select * from emp where job='CLERK';

-- SELECT WITH ORDER BY CLAUSE
--display all employee details ordered by sal in ascending order
select * from emp order by sal asc;
            --OR--
select * from emp order by sal;

--display all employee details ordered by sal in descending order
select * from emp order by sal desc;
--display all employee details ordered by sal and ename in descending order
select * from emp order by sal,ename desc;

--display employee details for employees whose salary is greater than 2000
                                   --ordered by sal in ascending 
select * from emp where sal>2000 order by sal;




 



