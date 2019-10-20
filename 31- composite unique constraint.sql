/*
Composite Unique Constraint:
============================
Example:
--------
Company Id & Product Id pair should not be repeated.

Table creation:
--------------- */
 drop table prod;
 Create table Product
 ( cid varchar2(10),
   pid varchar2(10),
   pname varchar2(15),
     constraint prod_cid_pid_un Unique(cid,pid)-- table level
 );

--Testing:
----------
  Insert into Product values( 'c1','p1','tea');
  Insert into Product values( 'c1','p2','coffee');
  Insert into Product values( 'c2','p1','tea');
  Insert into Product values( 'c2','p1','shampoo');   -- error
  insert into Product values('c2',null,'shampoo');
  insert into Product values('c2',null,'shampoo');
  insert into Product values(null,null,'shampoo');
  insert into Product values(null,null,'shampoo');
  insert into Product values(null,null,'shampoo');
  insert into Product values(null,'p1','shampoo');
  insert into Product values(null,'p1','shampoo');


  select * from Product;