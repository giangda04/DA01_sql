/* ex1: Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
and their respective average city populations (CITY.Population) rounded down to the nearest integer. */

Note: CITY.CountryCode and COUNTRY.Code are matching key column
select b.Continent, floor(avg(a.population))  as avg_city_populations
from  CITY as a
inner join COUNTRY as b
on a.CountryCode = b.code
group by b.Continent
order by avg_city_populations

--ex2: A senior analyst is interested to know the activation rate of specified users in the emails table. Write a query to find the activation rate. Round the percentage to 2 decimal plac
SELECT 
ROUND(1.00* SUM(   --nhân với 1.00 để đổi về số thực
CASE
    WHEN b.signup_action = 'Confirmed' THEN 1
    ELSE 0
END)/COUNT(b.*), 2) AS confirm_rate
FROM emails AS a
LEFT JOIN texts AS b 
ON a.email_id = b.email_id;

--ex3: 
--ex4:
--ex5: 
select mng.employee_id, mng.name as name, 
count(*) as reports_count, 
round(avg(emp.age),0) as avg_age
from Employees as mng
inner join employees as emp
on mng.employee_id = emp.reports_to
group by mng.employee_id
ORDER BY mng.employee_id

  --ex6: Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
select a.product_name, sum(b.unit) as unit
from products as a
inner join orders as b
on a.product_id = b.product_id
where extract(year from order_date) ='2020'
and extract(month from order_date) = '02'
group by b.product_id
having sum(b.unit) >=100

--ex7: Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.
SELECT a.page_id FROM pages as a
left join page_likes as b
on a.page_id = b.page_id
where b.liked_date is null
order by a.page_id asc


-- MID-COURSE TEST
/* Question 1: Tạo danh sách tất cả chi phí thay thế (replacement costs )  khác nhau của các film.
Chi phí thay thế thấp nhất là bao nhiêu? */
select distinct(title),replacement_cost from public.film
order by replacement_cost asc

/* Question 2: Viết một truy vấn cung cấp cái nhìn tổng quan về số lượng phim có chi phí thay thế trong các phạm vi chi phí sau
1.	low: 9.99 - 19.99
2.	medium: 20.00 - 24.99
3.	high: 25.00 - 29.99
Có bao nhiêu phim có chi phí thay thế thuộc nhóm “low”? */
select 
case
	when replacement_cost between 9.99 and 19.99 then 'low'
	when replacement_cost between 20.00 and 24.99 then 'medium'
	else 'high'
end as chi_phi,
count(*)
from public.film
group by chi_phi


/* Question 3: Tạo danh sách các film_title  bao gồm tiêu đề (title), độ dài (length) và 
tên danh mục (category_name) được sắp xếp theo độ dài giảm dần. 
Lọc kết quả để chỉ các phim trong danh mục 'Drama' hoặc 'Sports'.
Phim dài nhất thuộc thể loại nào và dài bao nhiêu? */

select a.title, a.length, c.name 
from film as a
inner join public.film_category as b on a.film_id = b.film_id
inner join public.category as c on c.category_id = b.category_id
where c.name in ('Drama','Sports') 
order by c.name desc 

select a.length, c.name 
from film as a
inner join public.film_category as b on a.film_id = b.film_id
inner join public.category as c on c.category_id = b.category_id
where c.name in ('Drama','Sports') 
order by a.length desc 


/* Question 4: Đưa ra cái nhìn tổng quan về số lượng phim (tilte) trong mỗi danh mục (category).
Thể loại danh mục nào là phổ biến nhất trong số các bộ phim? */
select b.name, count(a.*) as so_luong
from public.film_category as a 
join public.category as b
on a.category_id = b.category_id
group by b.name
order by so_luong desc

/* Question 5:Đưa ra cái nhìn tổng quan về họ và tên của các diễn viên cũng như số lượng phim họ tham gia.
Diễn viên nào đóng nhiều phim nhất? 
output: họ và tên diễn viên, số lượng phim tham gia
input: table actor, table film_actor */

select a.first_name, a.last_name, count(b.film_id) as so_luong
from actor as a
join public.film_actor as b on a.actor_id =b.actor_id
group by a.actor_id
order by so_luong desc
--câu 5 ra khác đáp án

/* Question 6: Tìm các địa chỉ không liên quan đến bất kỳ khách hàng nào.
Có bao nhiêu địa chỉ như vậy? */
select count(a.address)
from address as a
left join customer as b 
on a.address_id = b.address_id
where b.address_id is null

/* Question 7: Danh sách các thành phố và doanh thu tương ứng trên từng thành phố.
Thành phố nào đạt doanh thu cao nhất? */
select a.city, sum(e.amount) as doanh_thu 
from city as a join address as b on a.city_id=b.city_id
join customer as c on b.address_id = c.address_id
join rental as d on c.customer_id= d.customer_id
join payment as e on d.rental_id = e.rental_id
group by a.city 
order by doanh_thu  desc
/*Question 8: : Tạo danh sách trả ra 2 cột dữ liệu: 
-	cột 1: thông tin thành phố và đất nước ( format: “city, country")
-	cột 2: doanh thu tương ứng với cột 1
Thành phố của đất nước nào đat doanh thu thấp nhất? */
select concat(a.city,',',' ',f.country), sum(e.amount) as doanh_thu 
from city as a join address as b on a.city_id=b.city_id
join customer as c on b.address_id = c.address_id
join rental as d on c.customer_id= d.customer_id
join payment as e on d.rental_id = e.rental_id
join country as f on a.country_id =f.country_id
group by a.city,f.country 
order by doanh_thu  asc
