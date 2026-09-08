--Q1 Display all records from Books table.
select * from Books;

--Q2 Display all records from customers table.
select * from Customers;

--Q3 Display all records from orders table.
select * from Orders;

--Q4 Display book title, genre and author.
select title,genre,author from books;

--Q5 Display name ,city,country from customers.
select name,city,country from customers;

--Q6 Retrieve all books in the "Fiction" genre
select * from Books where genre='Fiction';

--Q7 Find books published after the year 1950.
select * from Books where published_year>=1950;

--Q8 List all customers from the Canada
select * from Customers where Country='Canada';

--Q9 Display all unique book genres.
select distinct genre from books ;

--Q10 Show orders placed in November 2023
select * from Orders where Order_Date 
between '2023-11-01' and '2023-11-30';

--Q11 Find the 10 most expensive books.
select * from Books order by price desc limit 10;

--Q12 Find all customers from india,japan,singapore.
select * from Customers where country in ('India','Japan','Singapore');

-- Q13 -- Find the average price of books in the "Fantasy" genre
select avg(price) from Books
where Genre='Fantasy';

--Q14 Find authors whose name contains John.
select * from Books where author like '%John%';
