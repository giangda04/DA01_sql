/* ex1: Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership.
Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views. */
SELECT 
count(CASE
    when device_type ='laptop' then 'laptop_reviews'
    else null ---hàm count() không đếm giá trị null
      END) as laptop_reviews,
count(CASE
    when device_type in ('tablet', 'phone') then 'mobile_views'
    else null
      END) as mobile_views
from viewership 

--ex2: Report for every three line segments whether they can form a triangle.
/* Điều kiện để ba đoạn thẳng có thể tạo thành một tam giác là tổng độ dài của hai đoạn bất kỳ phải lớn hơn độ dài của đoạn còn lại.
  Phải thỏa mãn cả 3 điều kiện */
select x,y,z,
case
    when (x+y>z) and (x+z>y) and (z+y> x)  then 'Yes'
    else 'No'
end as triangle
from Triangle


--ex3: 
SELECT round(sum(
CASE
    when call_category = 'n/a' or call_category is null then 1
    else 0
END)*100/count(*),1) as uncategorised_call_pct
FROM callers;

--ex4: Find the names of the customer that are not referred by the customer with id = 2.
select name from Customer
where referee_id != 2 or referee_id is null

/* ex5: Make a report showing the number of survivors and non-survivors by passenger class.
Classes are categorized based on the pclass value as:
pclass = 1: first_class
pclass = 2: second_classs
pclass = 3: third_class
Output the number of survivors and non-survivors by each class. */

select survived,
sum(case when pclass=3 then 1 else 0 end ) as third_class,
sum(case when pclass=2 then 1 else 0 end ) as second_classs,
sum(case when pclass=1 then 1 else 0 end ) as first_class
from titanic
group by survived
