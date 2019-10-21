/*
Composit Primary Key:
=====================
Example:
-------
product table

Validations:
------------

  -> Company id and product's are mandatory (not null)

  -> Company id and product's paires should not be repeat (unique).
Table creation:
----------------  */
drop table product;
Create table product
( cid varchar2(10),
  pid varchar2(10),
  pname varchar2(15),
   constraint product_cid_pid_pk Primary Key(cid,pid)
);

--Testing:
----------

  insert into product values( 'c1','p1','tea');
  insert into product values( 'c1','p2','coffee');
  insert into product values( 'c1','p1','soaps');   --error
  insert into product values( NULL,'p2','coffee');  -- error

  select * from product;
  
/*
Composite Foreign key constraint :
==================================
Example:
--------
product and sales table
Validation:
-----------

   -> Company id and product id in sales table are mandatory(not null)
   
   -> Company id and product id pair in sales table should be matched with 
                           Company id and product id pair in product table


Table creation:
--------------- */

Create table sales
( sno varchar2(10),
  sdate date,
  cid varchar2(10) not null,
  pid varchar2(10) not null,
  qty number(6),
  price number(8,2),
    Constraint sales_cid_pid_comp_fk FOREIGN KEY(cid,pid)
           REFERENCES Product( Cid, Pid)
);

--Testing :
-----------

  Insert into sales Values( 's1',sysdate,'c1','p1',2,1000);
  Insert into sales Values( 's2',sysdate,'c1','p2',1,500);
  Insert into sales Values( 's2',sysdate,'c2','p1',1,1000);  -- error  
  Insert into sales Values( 's2',sysdate,null,'p1',1,1000);  -- error
				
  select * from sales;
