use customer_behaviour;

select * from customer_table;


--total revenue by male and female

select gender,sum(purchase_amount) as total_purchase_amount from customer_table group by gender;


--customers who applied discounts but spent more than avg of purchase amount

select customer_id,purchase_amount from customer_table where discount_applied = 'yes' and 
purchase_amount >= (select avg(purchase_amount)from customer_table);


--top 5  products with high average review rating

select top 5 item_purchased,round(avg(review_rating),2) as average_rating
from customer_table group by item_purchased order by avg(review_rating) desc;


-- average purchase amount between standard and express shipping comparison

select shipping_type,round(avg(purchase_amount),2) as avg_purchase_amount from customer_table
where shipping_type in ('standard','express') group by shipping_type; 

--do subscribed customers spend more?
--comparison of average spend and total revenue between subscribers and non-subscribers

select subscription_status,count(customer_id) as total_customer,
round(avg(purchase_amount),2) as avg_spend,
round(sum(purchase_amount),2) as total_revenue from customer_table group by subscription_status
order by avg_spend , total_revenue desc;

--which top 5 products have the  highest percentage  of purchases with discounts applies

select top 5 item_purchased,round(100*sum(case when discount_applied = 'yes' then 1 else 0 end)/count(*),2) as discount_rate 
from customer_table group by item_purchased order by discount_rate desc;


--segment customers into new,returning,loyal based on their total number of previous purchases and show the count of eaach segment

with customer_type as ( select customer_id,previous_purchases,case when previous_purchases = 1 then 'new' WHEN previous_purchases between 2 and 10 then 'returning' 
else 'loyal'
end as customer_segment from customer_table)

select customer_segment,count(*) as 'number of customers' from customer_type group by customer_segment;

-- top 3 most purchased products within each category

with item_counts as (select category,item_purchased,count (customer_id) as total_orders , row_number () 
over (partition by category order by count (customer_id) desc) as item_rank from customer_table group by category,item_purchased)

select item_rank,category,item_purchased,total_orders from item_counts where item_rank <=3; 

-- are customers who are repeat buyers (more  than 5 previous purchases) also likely to subscribe?

SELECT subscription_status, count(customer_id) as repeat_buyers from customer_table where previous_purchases > 5 group by subscription_status


--revenue contribution of each age group

select age_group,sum(purchase_amount) as total_revenue from customer_table group by age_group order by 
total_revenue desc;







