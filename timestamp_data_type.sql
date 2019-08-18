-- to check the default date format [DD-MON-RR HH.MI.SSXFF AM]
SELECT value
FROM V$NLS_PARAMETERS
WHERE parameter = 'NLS_TIMESTAMP_FORMAT';

-- CREATE TABLE TIMESTAMP_DEMO
create table timestamp_demo(col1 number,col2 timestamp(2));
-- INSERT DATA INTO THE CREATED TABLE 
insert into timestamp_demo values(1,'12-aug-14 02.30.22.178');
insert into timestamp_demo values(2,'23-jun-2017 07.20.24.17 am');
insert into timestamp_demo values(3,'12-jan-84 08.40.52 pm');

-- Report the above table 
select * from timestamp_demo;

select COL1,
    EXTRACT(YEAR FROM col2) year,
    EXTRACT(MONTH FROM col2) month,
    EXTRACT(DAY FROM col2) day,
    EXTRACT(HOUR FROM col2) hour,
    EXTRACT(MINUTE FROM col2) minute,
    EXTRACT(SECOND FROM col2) second
from TIMESTAMP_DEMO ;

