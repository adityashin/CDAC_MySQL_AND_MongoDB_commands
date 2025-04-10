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
