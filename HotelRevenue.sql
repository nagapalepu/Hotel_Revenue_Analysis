

With Hotels as ( -- Creating a view to contain datasets 
Select * from dbo.['2018$'] 
union 
Select * from dbo.['2019$']
union 
select * from dbo.['2020$'])

--Exploring data analysis: Calculating revenue
Select arrival_date_year,hotel,  
round(sum((stays_in_week_night + stays_in_weekend_nights)*adr),2) as revenue
from Hotels
group by arrival_date_year,hotel

--Developing data for Power BI 
Select * from Hotels
left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$ 
on meal_cost$.meal = hotels.meal;
