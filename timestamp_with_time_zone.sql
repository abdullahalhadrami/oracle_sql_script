-- to check the default of timestamp with time zone format [DD-MON-RR HH.MI.SSXFF AM TZR]
SELECT value
FROM V$NLS_PARAMETERS
WHERE parameter = 'NLS_TIMESTAMP_TZ_FORMAT';

--TO CHECK THE CURRENT SESSION TIME ZONE
SELECT SESSIONTIMEZONE FROM dual;

--TO KNOW TIMEZONE NAMES
select * from V$TIMEZONE_NAMES;

--TO KNOW THE OFFSET OF TIMEZONE NAME
select tz_offset('Africa/Cairo') from dual;
select tz_offset('Asia/Kuwait') from dual;

--current_timestamp [returns a TIMESTAMP WITH TIME ZONE of current session]
select current_timestamp from dual;

--TO CHANGE THE CURRENT SESSION'S TIME ZONE 
alter session set time_zone = 'Africa/Cairo';
alter session set time_zone = 'Asia/Kuwait';

drop table timezone_tab;
--CREATE TABLE timezone_tab
create table timezone_tab(col1 number,col2 timestamp(2) with time zone);
--INSERT DATA INTO CREATED TABLE 
insert into timezone_tab values(1,'12-aug-2011 02.30.22.56 pm');
insert into timezone_tab values(2,'15-dec-1985 06.40.15.1522 am -03:00');
insert into timezone_tab values(3,'27-jun-16 08.10.45.645 am +05:00');
insert into timezone_tab values(4,'13-may-2018 11.20.36.15 pm Africa/Cairo');
insert into timezone_tab values(5,CURRENT_TIMESTAMP);
insert into timezone_tab values(6,sysdate);

--REPORT DATA FROM timestamp_tz table 
select * from timezone_tab;
