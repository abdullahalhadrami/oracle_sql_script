--upper
--syntax: UPPER(column/string)
select upper('oracle')from dual;

--lower
--syntax: LOWER(column/string)
select lower('ORACLE') from dual;

--initcap
--syntax: INITCAP(column/string)
select initcap('computer science')from dual;

--length
--syntax: LENGTH(column/string)
select length('oracle')from dual;
select length('hi friends')from dual;

--substr
--syntax: SUBSTR(string, start_position [, length ])
select substr('hi friends',3)from dual;
select substr('hi friends',1,2)from dual;

--instr
--syntax: INSTR(string, substring [,start, occurrence])
select instr('oracle database','a')from dual;
select instr('oracle database','a',3)from dual;
select instr('oracle database','a',4)from dual;
select instr('oracle database','a',4,2)from dual;
select instr('oracle database','a',-1,1)from dual;

--ltrim
--syntax: LTRIM(string [,trim_srting])
select ltrim('   oracle')from dual;
select ltrim('aaa oracle','a')from dual;

--rtrim
--syntax: RTRIM(string [,trim_srting])
select rtrim('oracle    ')from dual;
select rtrim('oracle   aaa','a')from dual;

--trim
--syntax: TRIM([ LEADING | TRAILING | BOTH ] trim_character FROM ] string)
select trim('    oracle    ')from dual;
select trim(leading 'a' from 'aaa oracle aaa')from dual;
select trim(trailing 'a' from 'aaa oracle aaa')from dual;
select trim(both 'a' from 'aaa oracle aaa')from dual;
select trim( 'a' from 'aaa oracle aaa')from dual;

--lpad
--syntax: LPAD(string ,length[, pad_srting])
select lpad('hello',10)from dual;
select lpad('hello',10,'*')from dual;

--rpad
--syntax: RPAD(string ,length[, pad_srting])
select rpad('hello',10)from dual;
select rpad('hello',10,'*')from dual;

--replace
--syntax: REPLACE(string, string_to_replace[, replacement_string])
select replace('database table','database')from dual;
select replace('database table','database', 'db')from dual;

--translate
--syntax: TRANSLATE(string, string_to_replace , replacement_string)
select translate('oracle 12','12','db')from dual;
select translate('oracle 12','12','d')from dual;

--concat
--syntax: CONCAT(string1, string2)
select concat('hello ' ,'friends')from dual;

--reverse
--syntax: REVERSE(column/string)
select reverse('olleh')from dual;

--ascii
--syntax: ASCII(column/string)
select ascii('a')from dual;
select ascii('oracle')from dual;
select ascii('o')from dual;

--chr
--syntax: CHR(ascii value)
select chr(111)from dual;
select chr(97)from dual; 
