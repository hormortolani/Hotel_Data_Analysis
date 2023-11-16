with hotel as (
--To join the 3 excels shit together--
select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])

select * from hotel left join dbo.market_segment$ on
hotel.market_segment = market_segment$.market_segment
left join
dbo.meal_cost$
on meal_cost$.meal = hotel.meal


--To check if the hotel revenue is growing per-year

select 
arrival_date_year,  --group and sum per year--
hotel,
round(sum(
(stays_in_week_nights+stays_in_weekend_nights)*adr),1) 
as revenue from hotel
group by arrival_date_year,hotel