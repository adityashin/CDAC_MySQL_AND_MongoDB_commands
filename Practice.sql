show databases;
use bookshelf;
show tables;

create table Books(
	book_id int primary key auto_increment,
    title varchar(255) not null,
    author varchar(255) not null,
    genre varchar(255) not null,
    price decimal(10,2) not null,
    publication_year int not null,
    stock int not null
);

desc Books;

create table Customer(
	customer_id int primary key auto_increment,
    firstname varchar(255) not null,
    lastname varchar(255) not null,
    email varchar(255) unique,
    city varchar(255)
);

desc Customer;

create table Orders(
	order_id int primary key auto_increment,
    order_date date,
    total_amount decimal(10,2),
    customer_id int,
    foreign key (customer_id) references Customer(customer_id)
);

desc orders;

select title,quantity
from Books
full join order_Items
on Books.book_id = order_Items.book_id;

create table order_Items(
	order_item_id int primary key auto_increment,
    order_id int,
    book_id int,
    quantity int,
    Foreign key (order_id) references Orders(order_id),
    Foreign key (book_id) references Books(book_id)
);

desc order_Items;

insert into Books (title,author,genre,price,publication_year,stock)
Values("The Silent Killer","Alex Michael","Thriller",15.99,2019,50);

select * from Books;

insert into Customer(firstname,lastname,email,city)
values("John","DOE","johndoe@gamil.com","New York");

select * from Books;

select * 
from Books 
where publication_year > 2020;

select firstname,email 
from customer;

update Books 
set price = 17.99
where book_id = 1;	

INSERT INTO Books (title, author, genre, price, publication_year, stock) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 12.99, 1925, 10),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 14.99, 1960, 15),
('1984', 'George Orwell', 'Dystopian', 10.99, 1949, 20),
('The Catcher in the Rye', 'J.D. Salinger', 'Classic', 13.50, 1951, 18),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 15.99, 1937, 25),
('Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy', 19.99, 1997, 30),
('The Da Vinci Code', 'Dan Brown', 'Thriller', 9.99, 2003, 22),
('The Alchemist', 'Paulo Coelho', 'Fiction', 11.99, 1988, 17),
('The Shining', 'Stephen King', 'Horror', 14.50, 1977, 12),
('The Road', 'Cormac McCarthy', 'Post-Apocalyptic', 13.99, 2006, 10);

select * from Books;

INSERT INTO Customer (firstname, lastname, email, city) VALUES
('John', 'Doe', 'john.doe@example.com', 'New York'),
('Jane', 'Smith', 'jane.smith@example.com', 'Los Angeles'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'Chicago'),
('Emily', 'Davis', 'emily.davis@example.com', 'Houston'),
('Daniel', 'Brown', 'daniel.brown@example.com', 'Phoenix'),
('Sarah', 'Wilson', 'sarah.wilson@example.com', 'Philadelphia'),
('David', 'Martinez', 'david.martinez@example.com', 'San Antonio'),
('Jessica', 'Anderson', 'jessica.anderson@example.com', 'San Diego'),
('James', 'Taylor', 'james.taylor@example.com', 'Dallas'),
('Laura', 'Thomas', 'laura.thomas@example.com', 'San Francisco');

select * from Customer;

delete from customer
where email="laura.thomas@example.com";

set SQL_SAFE_UPDATES = 0;

delete from Books 
where stock = 0;

select *
from books 
where genre = "Fiction" and price <=20;

select *
from Customer
where city = "London";

select * 
from Books
where publication_year between 2010 and 2020;

select * 
from Books
where genre = "Romance";

select Round(avg(price)) as AveragePriceOfBooks
from Books;

select * 
from orders;

-- order_id int primary key auto_increment,
--     order_date date,
--     total_amount decimal(10,2),
--     customer_id int,
--     foreign key (customer_id) references Customer(customer_id)

insert into orders(order_date,total_amount,customer_id) 
Values('2025-01-01',99.00,1),
('2025-9-9',98.89,2),
('2025-2-2',76.90,3),
('2025-3-3',55.55,4);

select * from orders;

select count(order_id),customer_id
from orders
group by customer_id;

select * from orders;

select sum(total_amount) as Total_Amount_of_Orders
from Orders;

alter table Books
add constraint NO_Negative_Price check (price > 0);

desc Books;

insert into Books(title,author,genre,price,publication_year,stock)
values("The Art of Seduction","Robort Greene","Fiction",24.00,2018,99);

select * from Books;

select firstname,lastname,total_amount
from customer
inner join orders
on customer.customer_id = orders.customer_id;

	-- Second max salary 
select Max(sal)
from emp 
where sal < (select Max(Sal) from emp);

select sal 
from emp
order by sal desc 
limit 1,1;

select ename as even_Employees
from emp
where empno % 2 = 0;

select * from emp;



