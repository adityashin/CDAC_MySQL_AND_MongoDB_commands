use company;

show tables;

-- when you have matching rows in tables use inner join

desc emp;
desc dept;

-- 1️.Show customers who have placed at least one order.
-- 🟢 Use: INNER JOIN

-- 🔍 Why: You only want customers who have matching orders.

select e.ename,d.dname,e.deptno
from emp e
inner join dept d
on e.deptno = d.id
order by e.ename;

-- self join
-- show empolyees and their managers
select e.ename,b.ename 
from emp e
inner join emp b
on e.empno = b.mgr;


-- left join
select ename,deptno,dname
from emp 
left join dept 
on emp.deptno = dept.id;

-- cross join
select ename,deptno,dname
from emp
cross join dept;

-- show customers who atleast palce one order
show tables;
desc tblproducts;
desc tblproductsales;

select p.id,p.name,s.quantitysold
from tblproducts as p
inner join tblproductsales as s
on p.id = s.productid
where quantitysold >= 999;

show tables;
