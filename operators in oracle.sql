--ARITHMETIC OPERATORS
--====================
--clculate the total sal(sal+comm)
select empno,ename,job,sal,comm, sal+comm as Total_Sal from emp;
--find the annual salary(sal*12)
select empno,ename,job,sal,comm, sal*12 as Annual_Sal from emp;
--find salary per day(sal/30)
select empno,ename,job,sal,comm, sal/30 as Sal_Per_Day from emp;

--RELATIONAL OPERATORS
--====================
--display employees whoes salary is greater than 2000
select * from emp where sal>2000;
--display employees whoes salary is greater than 3000
select * from emp where sal>=3000;
--display employees those who were hired before the year 1981
select * from emp where hiredate<'01-JAN-81';
--dispaly employee whoes empno is 7369
select * from emp where empno=7369;
--display all employees except SMITH
select * from emp where ename<>'SMITH';

--SPECIAL OPERATORS
--=================
--display employees whoes empno is one of these(7369,7521,1001)
select * from emp where empno in(7369,7521,1001);
--display employees who are not working as a CLERK or SALESMAN
select * from emp where job not in('CLERK','SALESMAN');
--display employees who are not working in the department 10 or 20
select * from emp where deptno not in(10,20);
--display employees thoes who were hired in the year 1981
select * from emp where hiredate between '01-JAN-81' and '31-DEC-81';
--display all employees except employees who were hired in the year 1981
select * from emp where hiredate not between '01-JAN-81' and '31-DEC-81';
--dispaly employees thoes whoes name starts with letter S
select * from emp where ename like 'S%';
--dispaly employees thoes whoes name ends with letter S
select * from emp where ename like '%S';
--dispaly employees thoes whoes name has exactly 4 letters
select * from emp where ename like '____';
--dispaly employees thoes whoes name has letter A as the second letter
select * from emp where ename like '_A%';
--dispaly employees thoes whoes name does not start with letter S
select * from emp where ename not like 'S%';
--display employees who are not having any commission
select * from emp where comm is null;
--display employees who are getting commission
select * from emp where comm is not null;

