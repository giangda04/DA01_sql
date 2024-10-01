/* ex1: Assume you're given a table containing job postings from various companies on the LinkedIn platform. Write a query to retrieve the count of companies that have posted duplicate job listings.
Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions. */

with cte_job_count AS
(
select company_id, title, description,
count(job_id) as count_job --đếm những job có trùng company_id, title, description
from job_listings 
group by company_id, title, description)

select count(count_job) as count from cte_job_count
where count_job >1 --đếm có tổng bao nhiêu job bị trùng như thế

/*ex 2: Assume you're given a table containing data on Amazon customers and their spending on products in different category, 
write a query to identify the top two highest-grossing products within each category in the year 2022. 
The output should include the category, product, and total spend. */
  
with cte_total_spend AS
(select category, product, sum(spend) as total_spend ,
rank() over (partition by category order by sum(spend) desc) as ranking
from product_spend 
where extract(year from transaction_date) = '2022'
group by category, product) 

select category, product, total_spend
from cte_total_spend
where ranking <3

/* ex3: Write a query to find how many UHG policy holders made three, or more calls, assuming each call is identified by the case_id column. */
with cte_count_case_id as
(SELECT policy_holder_id, count(case_id)	FROM callers
group by policy_holder_id
having count(case_id) >= 3 )

select count(policy_holder_id) from cte_count_case_id
