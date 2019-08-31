--LONG DATA TYPE
----------------
-- only one column per table is allowed to be defined as long
create table long_demo(col1 long, col2 long);--NOT ALLOWED
-- we can not use both long and long raw in the same table
create table long_demo(col1 long, col2 long raw);--NOT ALLOWED
--only one column per table is allowed to be defined as long raw
create table long_demo(col1 long raw, col2 long raw);--NOT ALLOWED
--drop table long_demo;
create table long_demo(col1 number,col2 long);--TABLE CREATED
--insert records into created table
insert into long_demo values(1,'AAABBBCCCDDDEEEFFFGGGHHH');
insert into long_demo values(2,'abcde');
insert into long_demo values(3,'#@^d');
insert into long_demo values(4,'12345');
insert into long_demo values(5,12345);
insert into long_demo values(6,'');
insert into long_demo values(7,NULL);
insert into long_demo values(8,EMPTY_BLOB()); --ACCEPTED 
insert into long_demo values(9,EMPTY_CLOB()); --ACCEPTED 

--Report data from the created table
SELECT * FROM long_demo;

--USE LONG COLUMN WITH WHERE CONDITION
SELECT * FROM long_demo where col2='abcde';-- illegal use of LONG datatype

--default long width is 80 characters 
show long;
set long 80;

--RAW DATA TYPE
---------------
--DROP TABLE RAW_DEMO;
create table raw_demo(col1 number, col2 raw(100));
insert into raw_demo values(1,123);--expected BINARY got NUMBER
insert into raw_demo values(1,10101);--expected BINARY got NUMBER
insert into raw_demo values(2,'123');--accepted because it's hex number
insert into raw_demo values(3,'abf101');--accepted because it's hex number
insert into raw_demo values(4,'gagsdj');--invalid hex number
insert into raw_demo values(5,'1234517');--accepted because it's hex number
insert into raw_demo values(6,'1234517g');--invalid hex number
insert into raw_demo values(7,EMPTY_BLOB()); --ACCEPTED 
insert into raw_demo values(8,EMPTY_CLOB()); --NOT ACCEPTED "expected BINARY got CLOB"

--Report data from the created table
SELECT * FROM raw_demo;

--LONG RAW DATA TYPE
--------------------
drop table longraw_demo;
create table longraw_demo(col1 number,col2 long raw);
insert into longraw_demo values(1,'111');--binary data
insert into longraw_demo values(2,'10111');--binary data
insert into longraw_demo values(3,'33');--hex number 
insert into longraw_demo values(4,'AABB');--hex number 
insert into longraw_demo values(5,'ABCDEF');--hex number
insert into longraw_demo values(5,''); --ACCEPTED
insert into longraw_demo values(6,NULL); --ACCEPTED
insert into longraw_demo values(7,EMPTY_BLOB()); --ACCEPTED
insert into longraw_demo values(8,EMPTY_CLOB()); --NOT ACCEPTED "expected BINARY got CLOB"

--Report data from the created table
SELECT * FROM longraw_demo;

--USE LONG RAW COLUMN WITH WHERE CONDITION
SELECT * FROM longraw_demo where col2='111';-- illegal use of LONG datatype










