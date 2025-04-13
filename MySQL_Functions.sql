-- String Functions
select upper(concat("Hello ","Adi")) as 'full name of employee';

select lower(concat("NEW YORK",",CALAFORNIA")) as 'USA POWER HOUSES';

use company;

select substr(ename,1,3) as enames
from  emp
where substr(ename,1,3) like "A%";	

select * 
from emp;

select datediff('2025-04-07',hiredate) as DateDifference
from emp;


select distinct(ename) as VOWEL_EMP
from emp
where lower(ename) regexp '^[aeiou].*[aeiou]$';

insert into emp(ename) values("AEIOU");

use company;
desc emp;

select deptno,count(empno) as Total_Employees
from emp
group by deptno;

select ename,sal
from emp
order by sal desc;

select deptno,count(empno)
from emp
group by deptno
having sum(sal) > 4000;

select * from emp;
