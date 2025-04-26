use company;

create table tblproducts(
	id int primary key auto_increment,
  name varchar(250),
  description varchar(250)
);
create table tblproductsales(
	id int primary key auto_increment,
  productid int, 
  unitprice int,
  quantitysold int,
  Foreign key (productid) references tblproducts(id)
);
insert into tblproducts(name,description) values('48 inch LED TV','made by sony'),('56 inch LCD TC','made by samsung'),('58 inch rollable TV','Made by LG');
insert into tblproducts(name,description) values('BOaT Speaker','My by BOAT');

select * from tblproducts;		

insert into tblproductsales(productid,unitprice,quantitysold) values(1,999,78),
(1,788,9),
(2,456,77),
(3,369,23);


select *
from tblproducts;

select * 
from tblproductsales;


-- select products who haven't sold yet
--   👇👇👇👇👇👇👇👇👇👇👇👇👇👇Outer Query👇👇👇👇👇👇👇👇👇👇
select TP.id , TP.name, TP.description
from tblproducts TP
where TP.id not in (select distinct(productid) from tblproductsales); 
--                   👆👆👆👆👆👆👆👆👆👆👆👆👆👆 inner query 👆👆👆👆👆
--							OR
select tp.id,tp.name,tp.description,tps.productid
from tblproducts tp
left join tblproductsales tps on tp.id = tps.productid
where tps.id is null;

-- write a query to find how many products totally sold
select name,(select sum(quantitysold) from tblproductsales where productid = tblproducts.id) as totalsold
from tblproducts;

select name,sum(quantitysold)
from tblproducts
left join tblproductsales on tblproducts.id = tblproductsales.productid
group by name;

select * from tblproductsales;

-- start
-- show unsold products
select id,name,description
from tblproducts
where id not in (select productid from tblproductsales);

-- show total products sold with quantity
select id,name,description,
(select sum(quantitysold) from tblproductsales where productid = tblproducts.id) as QuantitySold
from tblproducts;

-- 3rd highest salary
use company;
select sal as Third_highest_Salary
from emp
order by sal desc
limit 3,1;

-- Second highest salary
select max(sal) as Second_Highest_Salary
from emp
where sal < (select max(sal) from emp);


-- 26/04/2025
-- 3 types of subqueries
-- 🤩scalar subquery
-- it always returns 1 row and 1 column
-- here below query return only one value with one row and one column so its a scalar subquery
-- Find the average salary of emp
select * 
from emp 
where sal > (select avg(sal) from emp);



-- 🤩Multi Row Subquery in which we have 2 types
-- subquery which returns 1 row and 1 column
-- subquery which return multiple rows and multiple columns
 
-- find employees from each dept with the maximum salary
-- first we will find the max salary from every dept
-- then we will compare the employees from those deptno and with same salary so...
select *
from emp
where (deptno,sal) in (select deptno,max(sal)
						from emp 
						group by deptno);
                        
                        
-- find employees who dont have any dept;
 select * 
from emp
where deptno not in (select id from dept);

