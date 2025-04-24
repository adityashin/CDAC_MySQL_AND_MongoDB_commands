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
select TP.id , TP.name, TP.description
from tblproducts TP
where TP.id not in (select distinct(productid) from tblproductsales); 
--                   👆👆👆👆👆👆👆👆👆👆👆👆👆👆 inner query 👆👆👆👆👆
--							OR
select tp.id,tp.name,tp.description,tps.productid
from tblproducts tp
left join tblproductsales tps on tp.id = tps.productid
where tps.id is null;

-- write a query to 

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
