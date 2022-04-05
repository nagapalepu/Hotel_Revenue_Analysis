

With Hotels as ( -- creating a view to contain datasets 
Select * from dbo.['2018$'] 
union 
Select * from dbo.['2019$']
union 
select * from dbo.['2020$'])

select arrival_date_year,hotel, --Exploring data & calculating revenue 
round(sum((stays_in_week_night + stays_in_weekend_nights)*adr),2) as revenue
from Hotels
group by arrival_date_year,hotel
--developing SQL for Power BI 
Select * from Hotels
left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$ 
on meal_cost$.meal = hotels.meal;