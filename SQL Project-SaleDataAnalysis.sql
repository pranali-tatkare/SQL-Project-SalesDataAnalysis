use newschema;
select * from salesdata;
-- select count of all
select count(*) from salesdata;
-- select all where transaction id is not null
select * from salesdata where ï»¿transactions_id is not null;
-- unique customer_id
select count(distinct customer_id) as total_sales from salesdata;
-- retrieve all column sales date on '2022-11-05'
select * from salesdata where sale_date='2022-11-05';
-- SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 
select * from salesdata where category='Clothing' and  quantity >= 4
-- SQL query to calculate the total sales (total_sale) for each category.:
select category,SUM(total_sale) as net_sale,
COUNT(*) as total_orders
FROM salesdata
GROUP BY 1;
-- SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select avg(age) from salesdata where category='Beauty';
-- SQL query to find all transactions where the total_sale is greater than 1000.:
select * from salesdata where total_sale>1000;
-- SQL query to find the total number of transactions (transaction_id) made by each gender in each category
select category,gender,count(*) from salesdata 
group by gender,category order by 1;
-- SQL query to find the top 5 customers based on the highest total sales
select customer_id,SUM(total_sale) as total_sales
from salesdata
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
-- SQL query to find the number of unique customers who purchased items from each category.:
select category,COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM salesdata
GROUP BY category

-- SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
select  sale_time,
       CASE 
           WHEN sale_time <12 THEN 'Moring'
           WHEN sale_time between 12 and 17 THEN 'Afternoon'
           ELSE 'Evening'
       END AS shift
from salesdata;

