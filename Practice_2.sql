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
ORDER BY candidate_id 
