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

