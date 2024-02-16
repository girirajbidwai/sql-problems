create table sku 
(
sku_id int,
price_date date ,
price int
);
delete from sku;
insert into sku values 
(1,'2023-01-01',10)
,(1,'2023-02-15',15)
,(1,'2023-03-03',18)
,(1,'2023-03-27',15)
,(1,'2023-04-06',20)

with cte as (
select *,dense_rank()over(partition by sku_id, extract(month from price_date), extract(year from price_date) order by price_date desc) as dk
from sku
), cte2 as (
select sku_id, price_date as new_price_date, price   from sku where date_part('day', price_date) = 1
union
select sku_id, date(date_trunc('month',price_date+INTERVAL '1 month')) as new_price_date , price
from cte where dk =1 
)
select *, lag(price,1,10)over(order by extract(month from new_price_date)),
price-lag(price,1,10)over(order by extract(month from new_price_date)) as difference
from cte2
