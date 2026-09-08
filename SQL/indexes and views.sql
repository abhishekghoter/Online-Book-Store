--INDEXES AND VIEWS IN SQL

select * from Books;
select * from Orders;
select * from Customers;

--Q1 Create a view containing customer details and their total spending.
create view customer_spendig as
select c.customer_id,c.name,c.email,c.country,
coalesce(sum(o.total_amount),0) as total_spending
from Customers c
left join Orders o on o.customer_id=c.customer_id
group by  c.customer_id,c.name,c.email,c.country;

--Q2 Create a view containing order ID, customer name, book title, quantity and amount.
create view order_details as
select o.order_id,c.name as customer_name
,b.title as book_title,
o.qunatity as quantity,
o.total_amount as amount
from Orders o
join Customers c
on o.customer_id=c.customer_id
join Books b
on b.book_id=o.book_id;
--view 
select * from order_details;

--Q3 Create a view showing book sales performance.
create view sales_performance as
select b.book_id,b.title,
sum(o.qunatity) as total_sold,
sum(o.total_amount) as total_revenue
from Books b
join Orders o on o.book_id=b.book_id
group by b.book_id,b.title;

--Q4 Create a view showing monthly revenue.
create view monthly_revnue as
select 
date_trunc('month',order_date) as mobth,
sum(total_amount) as revenue
from Orders
group by 1
order by 1;

--Q5 Query the customer spending view and find the top 10 customers.
select customer_id,name,total_spending
from customer_spendig
order by total_spending desc
limit 10;

--Q6 Create an index on customer_id in the Orders table.
create index idx_orders_customer_id
on Orders(customer_id);

--Q7 Create a composite index using customer_id and order_date.
create index idx_orders_customer_date
on Orders(customer_id,order_date);

--Q8 Check whether PostgreSQL uses the customer ID index for a search.
explain 
select * from Orders
where customer_id=5;

--Q9 Analyze the execution plan of a query filtering orders by customer ID.
explain analyze
select * from Orders 
where customer_id=5;
