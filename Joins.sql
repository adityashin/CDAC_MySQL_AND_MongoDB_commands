use company;

show tables;

-- when you have matching rows in tables use inner join

desc emp;
desc dept;

select e.ename,d.dname,e.deptno
from emp e
inner join dept d
on e.deptno = d.id
order by e.ename;