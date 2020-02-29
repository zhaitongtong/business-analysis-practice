/* Master table query */

Select a.Ukey, b.calendar_year, b.calendar_month, c.Product_Name, d.Province, e.Name as Employee_Name, a.Balance
from dbo.MORTGAGE a 
left join dbo.TIME b on a.Time_Key=b.Time_Key
left join dbo.PRODUCT c on a.Product_Key=c.Product_Key
left join dbo.CUSTOMER d on a.Customer_Key=d.Customer_Key
left join dbo.EMPLOYEE e on a.Employee_Key=e.Employee_Key;

/* Create master table */

select * into dbo.MASTER from 
(Select a.Ukey, b.calendar_year, b.calendar_month, c.Product_Name, d.Province, e.Name as Employee_Name, a.Balance
from dbo.MORTGAGE a 
left join dbo.TIME b on a.Time_Key=b.Time_Key
left join dbo.PRODUCT c on a.Product_Key=c.Product_Key
left join dbo.CUSTOMER d on a.Customer_Key=d.Customer_Key
left join dbo.EMPLOYEE e on a.Employee_Key=e.Employee_Key) abc;


/* Balance vs. Time */

Select calendar_year, calendar_month, count(Ukey) as Num_of_MRG, sum(Balance) as TTL_BAL, sum(Balance)/count(Ukey) as BAL_per_MRG
from dbo.MASTER
group by calendar_year,  calendar_month
order by BAL_per_MRG desc

/* Balance vs. Time using nested query*/

Select calendar_year, calendar_month, count(Ukey) as Num_of_MRG, sum(Balance) as TTL_BAL, sum(Balance)/count(Ukey) as BAL_per_MRG
from
(Select a.Ukey, b.calendar_year, b.calendar_month, c.Product_Name, d.Province, e.Name as Employee_Name, a.Balance
from dbo.MORTGAGE a 
left join dbo.TIME b on a.Time_Key=b.Time_Key
left join dbo.PRODUCT c on a.Product_Key=c.Product_Key
left join dbo.CUSTOMER d on a.Customer_Key=d.Customer_Key
left join dbo.EMPLOYEE e on a.Employee_Key=e.Employee_Key) m
group by calendar_year,  calendar_month
order by BAL_per_MRG desc

/* Balance vs. Geography */

Select Province, count(Ukey) as Num_of_MRG, sum(Balance) as TTL_BAL, sum(Balance)/count(Ukey) as BAL_per_MRG
from dbo.MASTER
group by Province
order by BAL_per_MRG desc

/* Balance vs. Employee */

Select e.name as Employee_Name, e.level, count(a.Ukey) as Num_of_MRG, sum(a.Balance) as TTL_BAL, sum(a.Balance)/count(a.Ukey) as BAL_per_MRG
from dbo.MORTGAGE a 
left join dbo.EMPLOYEE e on a.Employee_Key=e.Employee_Key
group by e.name, e.level
order by level desc;

/* Balance vs. Product */

Select Product_Name, count(Ukey) as Num_of_MRG, sum(Balance) as TTL_BAL, sum(Balance)/count(Ukey) as BAL_per_MRG
from dbo.MASTER
group by Product_Name
order by BAL_per_MRG desc;

/* Profit/Margin table query */

Select c.Product_Name, a.Balance, c.Mortgage_Rate, c.Funding_Rate, c.Mortgage_Rate-c.Funding_Rate as Margin, (c.Mortgage_Rate-c.Funding_Rate)*a.balance as Profit
from dbo.MORTGAGE a 
left join dbo.PRODUCT c on a.Product_Key=c.Product_Key

Select c.Product_Name, avg(c.Mortgage_Rate-c.Funding_Rate) as Avg_margin, sum((c.Mortgage_Rate-c.Funding_Rate)*a.balance) as TTL_Profit
from dbo.MORTGAGE a 
left join dbo.PRODUCT c on a.Product_Key=c.Product_Key
group by c.Product_Name
order by Avg_margin desc

/* Profit/Margin table query in time segment */
Select b.calendar_year, b.calendar_month, c.Product_Name, count(a.UKey) as Num_of_MRG, avg(c.Mortgage_Rate-c.Funding_Rate) as Avg_margin, sum((c.Mortgage_Rate-c.Funding_Rate)*a.balance) as TTL_Profit, sum((c.Mortgage_Rate-c.Funding_Rate)*a.balance)/count(a.Ukey) as Profit_per_MRG
from dbo.MORTGAGE a 
left join dbo.PRODUCT c on a.Product_Key=c.Product_Key
left join dbo.TIME b on a.Time_Key=b.Time_Key
group by b.calendar_year, b.calendar_month, c.Product_Name
order by Profit_per_MRG desc

/* Gender analysis */
Select d.gender, count(a.UKey) as Num_of_MRG, sum(a.balance) as TTL_Bal, sum(a.balance)/count(a.Ukey) as Avg_Bal,
avg(c.Mortgage_Rate-c.Funding_Rate) as Avg_margin, sum((c.Mortgage_Rate-c.Funding_Rate)*a.balance) as TTL_Profit, 
sum((c.Mortgage_Rate-c.Funding_Rate)*a.balance)/count(a.Ukey) as Profit_per_MRG
from dbo.MORTGAGE a 
left join dbo.PRODUCT c on a.Product_Key=c.Product_Key
left join dbo.CUSTOMER d on a.Customer_Key=d.Customer_Key
group by d.gender

/* Time series */
Select b.Calendar_Year, b.Calendar_Month, b.Fiscal_Year, b.Fiscal_Month, count(a.UKey) as Num_of_MRG, sum(a.balance) as TTL_Bal, sum(a.balance)/count(a.Ukey) as Avg_Bal,
avg(c.Mortgage_Rate-c.Funding_Rate) as Avg_margin, sum((c.Mortgage_Rate-c.Funding_Rate)*a.balance) as TTL_Profit, 
sum((c.Mortgage_Rate-c.Funding_Rate)*a.balance)/count(a.Ukey) as Profit_per_MRG
from dbo.MORTGAGE a 
left join dbo.TIME b on a.Time_Key=b.Time_Key
left join dbo.PRODUCT c on a.Product_Key=c.Product_Key
group by b.Calendar_Year, b.Calendar_Month, b.Fiscal_Year, b.Fiscal_Month
order by Calendar_Year, Calendar_Month