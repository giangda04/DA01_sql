/*ex1: Query the Name of any student in STUDENTS who scored higher than  Marks.
Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID. */

select Name from Students
where marks > 75
order by right(Name,3), ID asc

  
--ex2: Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
select user_id,
concat(upper(left(name,1)), lower(SUBSTRING(name, 2))) as name
from users
order by user_id

/* ex3: Write a query to calculate the total drug sales for each manufacturer. Round the answer to the nearest million and report your results in descending order of total sales. 
In case of any duplicates, sort them alphabetically by the manufacturer name.
Since this data will be displayed on a dashboard viewed by business stakeholders, please format your results as follows: "$36 million". */
  
SELECT manufacturer,
concat('$',ROUND(sum(total_sales)/1000000,0),' ', 'million') as total
FROM pharmacy_sales
group by manufacturer
order by sum(total_sales) desc, manufacturer

/* ex4: write a query to retrieve the average star rating for each product, grouped by month. 
The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. 
Sort the output first by month and then by product ID. */

SELECT 
extract(month from submit_date) as month,
product_id, ROUND(avg(stars),2)
FROM reviews
group by month, product_id
order by month, product_id

/* ex5: Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. 
Display the IDs of these 2 users along with the total number of messages they sent. 
Output the results in descending order based on the count of the messages. */

SELECT sender_id,
count(sender_id) as message_count
FROM messages
where sent_date BETWEEN '08/01/2022' and '09/01/2022'
group by sender_id
order by count(sender_id) DESC
limit 2

--ex6:Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15. 
select tweet_id
from Tweets
where length(content) >15

--ex8: You have been asked to find the number of employees hired between the months of January and July in the year 2022 inclusive.
select count(id),
extract(month,joining_date) as month,
extract(year,joining_date) =2022
from employees
where extract(month,joining_date) between 1 and 7
and extract(year,joining_date) =2022

--ex9: Find the position of the lower case letter 'a' in the first name of the worker 'Amitah'.
select position('a'in first_name) from worker
where first_name= 'Amitah' ;

/* ex10: Find the vintage years of all wines from the country of Macedonia. The year can be found in the 'title' column. Output the wine (i.e., the 'title') along with the year.
The year should be a numeric or int data type. */
select substring(title,length(winery)+2,4) as year
from winemag_p2
where country = 'Macedonia' ;

