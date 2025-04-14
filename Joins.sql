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

create table projects(
	project_id int primary key,
    project_name varchar(250) not null,
    empno int,
    start_date date,
    end_date date,
    status varchar(250),
    foreign key (empno) references emp(empno)
);

alter table emp
modify empno int primary key;

select * from emp;

INSERT INTO projects (project_id, project_name, empno, start_date, end_date, status) VALUES
(101, 'Inventory System', 7369, '2024-01-15', '2024-06-30', 'Completed'),
(102, 'HR Portal', 7499, '2024-03-01', NULL, 'Active'),
(103, 'Payroll System', 7521, '2024-02-01', NULL, 'On Hold'),
(104, 'CRM Upgrade', NULL, '2024-04-10', NULL, 'Planned'),
(105, 'Data Migration', 7654, '2024-01-10', '2024-03-10', 'Completed');

-- Retrieve employee names and department names 
desc dept;
select ename,dname 
from emp 
inner join dept
on emp.deptno = dept.id;

-- Retrive all Depts even though no employees
select dname,empno
from dept
left join emp
on emp.deptno = dept.id;

select * 
from emp;

insert into emp values(7963,"DONALD","CASHIER",7788,'1981-11-17',15000,0.0,null);

-- generate combinations using cross join
select ename,dname
from emp
cross join dept;

-- Use SELF JOIN to show managers and their subordinates
select a.ename,a.empno,b.ename as Their_managers
from emp a
inner join emp b
on a.empno = b.mgr;
 
-- List all emps with no depts
select empno,ename,dname
from emp
right join dept
on emp.deptno = dept.id;

SELECT e.ename AS employee, m.ename AS manager
FROM emp e
JOIN emp m ON e.mgr = m.empno;

show tables;

create table customer(
id int primary key,
cname varchar(250),
city varchar(250),
state varchar(250)
);

create table orders(
	order_id int primary key,
    customer_id int,
    order_date date,
    total_amouont decimal(10,2),
    foreign key (customer_id) references customer(id)
);

create table payments(
	payment_id int primary key,
    order_id int,
    payment_date date,
    payment_mode date,
    amount_paid decimal(10,2),
    foreign key (order_id) references orders(order_id)
);

alter table payments
modify payment_mode varchar(250);

INSERT INTO customer VALUES
(1, 'Alice', 'Pune', 'MH'),
(2, 'Bob', 'Mumbai', 'MH'),
(3, 'Charlie', 'Delhi', 'DL'),
(4, 'Diana', 'Bangalore', 'KA'),
(5, 'Eve', 'Hyderabad', 'TG');

INSERT INTO orders VALUES
(101, 1, '2024-03-01', 5000.00),
(102, 1, '2024-03-05', 1500.00),
(103, 2, '2024-03-10', 3000.00),
(104, 3, '2024-03-12', 7000.00),
(105, 5, '2024-03-15', 1200.00);

INSERT INTO payments VALUES
(201, 101, '2024-03-02', 'Credit Card', 5000.00),
(202, 102, '2024-03-06', 'UPI', 1500.00),
(203, 104, '2024-03-13', 'Net Banking', 7000.00),
(204, 105, '2024-03-16', 'Cash', 1200.00);

show tables;

-- 🔥 Practice Questions (Joins-Focused)
-- 🔹 Level 1 – Basic Joins
-- List all customers and their orders (if any).
	desc customer;
    desc orders;
    
	select id,cname,order_id
    from customer
    inner join orders
    on customer.id = orders.customer_id;
    
    
-- Retrieve customers who haven't placed any orders.
	select id,cname,city,state,order_id,customer_id
    from customer
    left join orders
	on customer.id = orders.customer_id
    where orders.order_id is null;
    
    alter table orders
    rename column total_amouont to total_amount;
    
-- Show orders with customer name and total amount.\
	select cname,order_id,total_amount
    from customer
    right join orders
    on customer.id = orders.customer_id;

-- 🔹 Level 2 – Join Chains
-- Show customer name, order_id, and payment mode.
	desc orders;
    desc payments;
    
    select cname,orders.order_id,payment_mode
    from customer
    inner join orders
    on customer.id = orders.customer_id
    inner join payments
    on orders.order_id = payments.order_id;

-- List all payments with customer names and cities.

	desc payments;

	select payment_id,payment_date,payment_mode,amount_paid,cname,city,payments.order_id
    from payments 
    left join orders on orders.order_id = payments.order_id
    left join customer on orders.customer_id = customer.id; 
	

-- Show all orders that have not been paid yet.
	select * from orders;
    select * from payments;
	select Orders.order_id,customer_id,order_date,total_amount,Customer.id,Payments.payment_id
    from orders
    left join payments on payments.order_id = orders.order_id
    left join customer on customer.id = orders.customer_id
    where payments.payment_id is null;
    
-- 🔹 Level 3 – Outer Joins & Filters
-- Show customers and total order amount (even if they didn’t order anything).

-- Find customers who placed orders but have no matching payment (left join).

-- List orders and payments even if either is missing (full outer join logic).

-- 🔹 Level 4 – Group + Join
-- Show total amount spent by each customer (combine orders and payments).

-- List customers with the number of orders they placed.

-- Which city has the highest number of paying customers?



