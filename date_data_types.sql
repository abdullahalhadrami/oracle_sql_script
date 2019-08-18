-- to check the default date format [DD-MON-RR]
SELECT value
FROM V$NLS_PARAMETERS
WHERE parameter = 'NLS_DATE_FORMAT';
-- default displayed date
desc dual;
select sysdate from dual;

-- to change date format use
ALTER SESSION SET NLS_DATE_FORMAT ='RRRR-MM-DD';-- but recomended not to change
-- To check the default displayed date after changing the date format
select sysdate from dual;

ALTER SESSION SET NLS_DATE_FORMAT ='DD-MON-RR';



--Difference between DD-MON-RR and DD-MON-YY
--RR
--if Current year 0-49 AND entered year 0-49---->current century
select to_char(to_date('12-AUG-25','dd-MON-RR'),'dd-MON-YYYY') from dual;
--if Current year 0-49 AND entered year 50-99---->previous century
select to_char(to_date('12-AUG-84','dd-MON-RR'),'dd-MON-YYYY') from dual;
--if Current year 50-99 AND entered year 0-49---->next century
select to_char(to_date('12-AUG-25','dd-MON-RR'),'dd-MON-YYYY') from dual;
--if Current year 50-99 AND entered year 50-99---->current century
select to_char(to_date('12-AUG-84','dd-MON-RR'),'dd-MON-YYYY') from dual;

--YY
--only current century
--if Current year 50-99 AND entered year 0-49---->next century
select to_char(to_date('12-AUG-25','dd-MON-YY'),'dd-MON-YYYY') from dual;
--if Current year 50-99 AND entered year 50-99---->current century
select to_char(to_date('12-AUG-84','dd-MON-YY'),'dd-MON-YYYY') from dual;
--if Current year 0-49 AND entered year 0-49---->current century
select to_char(to_date('12-AUG-25','dd-MON-YY'),'dd-MON-YYYY') from dual;
--if Current year 0-49 AND entered year 50-99---->previous century
select to_char(to_date('12-AUG-84','dd-MON-YY'),'dd-MON-YYYY') from dual;

--DD-MON-RR
--internally stored date
select sysdate, to_char(sysdate,'AD DD-MON-RRRR HH:MI:SS AM')AS FULL_DEFAULT 
from dual;
--drop table date_demo;
--truncate table date_demo;
create table date_demo(col1 number,col2 date);
insert into DATE_DEMO values(1,'14-feb-2012');-- 2012
insert into DATE_DEMO values(2,'20-MAR-45');-- 2045
insert into DATE_DEMO values(3,'11-APR-49');-- 2049
insert into DATE_DEMO values(4,'09-JAN-50');-- 1950
insert into DATE_DEMO values(5,'02-AUG-51');-- 1951
insert into DATE_DEMO values(6,'14-NOV-00');-- 2000
insert into DATE_DEMO values(7,'08-SEP-99');-- 1999
select * from DATE_DEMO;

select col1,COL2 AS DEFAULT_DATE, to_char(col2,'AD DD-MON-RRRR HH:MI:SS AM')AS FULL_DATE
from DATE_DEMO;

-- WE CAN SEE THAT THE TIME IS 12:00 AM ,BUT IF WE WANT TO ENTER OUR OWN TIME THEN HOW TO DO SO??
insert into DATE_DEMO values(8,'12-oct-2011 05:14:22 am');--ERRO
--WE CAN NOT ENTER THE TIME DIRECTLY SO WE SHOULD USE CONVERSION FUNCTION [TO_DATE]
insert into DATE_DEMO values(8,TO_DATE('12-oct-2011 05:14:22 am','DD-MON-RRRR HH:MI:SS AM'));

-- THE LENGTH OF THE DATE IN ORACLE IS 9 characters
-- THE SIZE OF DATE STORAGE IS 7 bytes
select SYSDATE, length(sysdate),VSIZE (sysdate) from dual;


-- TO TEST THE DATE RANGE
-- from oracle 9i the date range is:01-Jan-4712 BC to 31-Dec-9999 AD
show release;
insert into DATE_DEMO values(9,to_date('bc 01-jan-4712','bc dd-mon-RRRR'));
insert into DATE_DEMO values(10,to_date('bc 31-dec-4713','bc dd-mon-RRRR'));--ERROR -OUT OF RANGE
insert into DATE_DEMO values(10,to_date('ad 01-jan-10000','ad dd-mon-RRRR'));--ERRPR
insert into DATE_DEMO values(10,to_date('ad 31-DEC-9999','ad dd-mon-RRRR'));-- 9999

select col1,COL2 AS DEFAULT_DATE, to_char(col2,'AD DD-MON-RRRR HH:MI:SS AM')AS FULL_DATE
from DATE_DEMO;