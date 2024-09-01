---ex1
select name from City
where population > 120000 and countrycode = 'USA'
  
--ex2
select * from city where countrycode ='JPN'

  --ex3
select city, state from station

  --ex4: Query the list of CITY names starting with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
select distinct city from station
where city like 'a%' 
or city like 'e%'
or city like'i%'
or city like'o%'
or city like'u%'

  --ex5: Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
select distinct city from station
where city like '%a' 
or city like '%e'
or city like'%i'
or city like'%o'
or city like'%u'
  
--ex6: Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates. 
select distinct city from station
where not (city like 'a%' 
or city like 'e%'
or city like'i%'
or city like'o%'
or city like'u%')

--ex7: Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
select name as 'employee names' from Employee 
order by name

/* ex8: Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee 
having a salary greater than 2000  per month who have been employees for less than 10 months. Sort your result by ascending employee_id. */
select name as 'employee names' from Employee
where salary > 2000 and months < 10
order by employee_id


--ex9:  find the ids of products that are both low fat and recyclable.
select product_id from Products
where low_fats ='Y' and recyclable ='Y'

--ex10: Find the names of the customer that are not referred by the customer with id = 2.
select name from Customer
where referee_id != 2 or referee_id is null

--ex11: Write a solution to find the name, population, and area of the big countries.
select name, population, area from World
where area >= 3000000 or population >= 25000000

/*ex12: Write a solution to find all the authors that viewed at least one of their own articles.
Return the result table sorted by id in ascending order. */
select distinct author_id as 'id' from Views
where author_id = viewer_id 
order by author_id 

--ex13
--ex14
--ex15
