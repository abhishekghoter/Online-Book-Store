---Advanced SQL 

select * from Books;
select * from Orders;
select * from Customers;

--Q1 Find the second-highest priced book.
with highest_priced as(
select book_id,title,price,
 dense_rank()over(order by price desc) as price_rank
from Books
)
select title,book_id,price
from highest_priced
where price_rank=2;

--Q2 Rank books by price within each genre.
with highest_price as(
select *,
dense_rank() over(partition by genre order by price desc) as price_rank from Books
)
select * from highest_price
where price_rank=1;

--Q3 Rank customers based on their total spending.
with customer_spending as(
select c.name,
sum(o.total_amount) as total_spending
from Orders o
join Customers c
on o.customer_id=c.customer_id
group by c.name
)
select *,
dense_rank() over(order by total_spending desc) as spending_rank
from customer_spending;

--Q4  Find the top 3 customers from each country by spending.
select *
from (
select c.country,c.name,c.customer_id,
sum(o.total_amount) as total_spending,
dense_rank() over (partition by c.country 
            order by sum(o.total_amount) desc
        ) as spending_rank
from orders o
join customers c on c.customer_id = o.customer_id
group by c.country, c.name, c.customer_id
) 
where spending_rank <= 3
order by country, spending_rank;

--Q5 Find the best-selling book in each genre
with genre_book_sales as(
select b.genre,b.book_id,b.title,
sum(o.qunatity) as total_quantitysold,
row_number() over(partition by b.genre order by sum(o.qunatity) desc)
 as sales_rank
from Orders o
join Books b on b.book_id=o.book_id
group by b.genre,b.book_id,b.title
)
select genre,title,total_quantitysold
from genre_book_sales
where sales_rank=1;

--Q6 Find customers who spent more than the average customer spending.
with customer_spending as(
select c.customer_id,c.name,
sum(total_amount) as total_spending
from Orders o
join Customers c on c.customer_id=o.customer_id
group by c.customer_id,c.name
)
select customer_id,name,total_spending
from customer_spending 
where total_spending>(select avg(total_spending) from customer_spending)
order by total_spending desc;

--Q7 Find each customer's first order date.
select customer_id,
min(order_date) as first_order_date
from Orders 
group by customer_id
order by customer_id;

--Q8 Calculate running/cumulative revenue by order date.
select order_date,total_amount,
sum(total_amount) over(order by order_date) as cumulative_revenue
from Orders
order by order_date;

--Q9 Calculate the number of days between a customer's first and latest order
select customer_id,
min(order_date) as first_order_date,
max(order_date) as latest_order_date,
max(order_date)-min(order_date) as days_between
from Orders
group by customer_id;

--Q10 Calculate each genre's percentage contribution to total revenue
select b.genre,
sum(b.price * o.qunatity) as genre_revnue,
round(sum(o.qunatity * b.price) * 100.0 /
sum(sum(o.qunatity * b.price))over(),2) as total_percentage_revenue
from Orders o
join Books  b on o.book_id=b.book_id
group by b.genre 
order by total_percentage_revenue desc;

--Q11 Find customers who placed orders in more than one month
select customer_id,
count(distinct date_trunc('month', order_date)) as number_of_months
from Orders
group by customer_id
having count(distinct date_trunc('month', order_date)) > 1
order by customer_id;

--Q12 Find the month-over-month revenue growth.
with monthly as (
select date_trunc('month', order_date) as month,
sum(total_amount) as revenue
from Orders
group by 1
)
select month,revenue,
lag(revenue) over (order by month) as previous_revenue,
revenue - lag(revenue) over (order by month) as growth
from monthly
order by month;

--Q13 Find books that have high sales but low remaining stock.
select b.book_id,b.title,
sum(o.qunatity) as total_sold,
b.stock
from Books b
join Orders o on b.book_id = o.book_id
group by b.book_id, b.title, b.stock
having sum(o.qunatity) > 10
and b.stock < 5;