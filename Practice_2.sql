---ex1: Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
select distinct city from station
where ID%2 = 0 

---ex2: Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
select count(city) - count(distinct city) from station

--ex3: để lại

--ex4:
SELECT CAST(sum(item_count*order_occurrences)/sum(order_occurrences) as decimal(10,1)) 
FROM items_per_order;

/* ex5:You want to find candidates who are proficient in Python, Tableau, and PostgreSQL. 
Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order. */
SELECT candidate_id FROM candidates
where skill in ('Python','Tableau','PostgreSQL')
group by candidate_id
having count(skill) = 3 

--ex6: write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021
SELECT user_id, 
date(max(post_date))-date(min(post_date)) as days_between
FROM posts
where EXTRACT(YEAR FROM post_date) = 2021
group by user_id
having count(post_id) >= 2

--ex7: Write a query that outputs the name of each credit card and the difference in the number of issued cards between the month with the highest issuance cards and the lowest issuance.
SELECT card_name,
max(issued_amount) - min(issued_amount) as difference
FROM monthly_cards_issued
group by card_name
order by difference desc

--ex8: 
SELECT manufacturer,
COUNT(product_id) as drug_count,
abs(sum(cogs) - sum(total_sales)) as total_losses
FROM pharmacy_sales
where total_sales < cogs
GROUP BY manufacturer
order by  total_losses DESC

---cogs là cost of goods sold

--ex9:
select * from cinema
where ID%2 =1 and not (description like "%boring%")
order by rating desc

---ex10: 
select teacher_id,
count(distinct(subject_id)) as cnt
from teacher
group by teacher_id

--ex11: Write a solution that will, for each user, return the number of follower
select  user_id,
count(follower_id) as followers_count
from Followers
group by user_id
order by user_id;

--ex12: Write a solution to find all the classes that have at least five students.
select class
from Courses
group by class
having  count(student) >= 5
