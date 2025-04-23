-- 🧠 INTERVIEW PRACTICE QUESTIONS
-- 📌 A. GROUP BY & HAVING Questions
-- Find the total salary paid to each department.
use company;
select * from emp;
select deptno,sum(sal)
from emp
group by deptno;

-- List departments with more than 3 employees.
select deptno,count(*)
from emp
group by deptno
having count(*) > 3;

select * from emp where deptno = 10;

-- Find the average salary of employees in each job role.
select job,avg(sal)
from emp 
group by job;

-- Get the departments where average salary is greater than ₹50,000.
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) > 50000;

-- List the number of employees hired each year.

-- Show the top 1 departments with the highest total salaries.
select * from emp;
	select deptno,sum(sal)
    from emp
    group by detpno
    order by sum(sal) desc
    limit 1,1;
