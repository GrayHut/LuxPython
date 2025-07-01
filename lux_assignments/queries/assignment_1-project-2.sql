--selecting all columns from the "international_debt_with_missing_values" table
select * from staging.international_debt_with_missing_values idwmv 
limit 200;

--replacing NULL values in "debt" using COALESCE
select 
country_name, 
country_code, 
indicator_name, 
indicator_code, 
coalesce(debt, 0) as real_debt
from staging.international_debt_with_missing_values idwmv;

--total amount of debt owed by all countries in the dataset
--answer = 2,823,894,597,632
select 
sum(debt) 
from staging.international_debt_with_missing_values idwmv;

-- how many distinct countries are recorded
--answer = 125
select 
count (distinct country_name) 
from staging.international_debt_with_missing_values idwmv;

--distinct types of debt indicators, and what do they represent
select 
distinct indicator_code
from staging.international_debt_with_missing_values idwmv;

--country has the highest total debt
--answer = Indonesia: 92,510,010,000
select 
country_name,
country_code,
sum(debt) as total_debt
from staging.international_debt_with_missing_values idwmv
group by country_name, country_code
order by total_debt desc;

--average debt across different debt indicators
select 
indicator_name,
avg(debt) as avg_debt_per_ind
from staging.international_debt_with_missing_values idwmv 
group by indicator_name;

--country has made the highest amount of principal repayments
--most common debt indicator across all countries
select
	indicator_name,
	count(*)
from staging.international_debt_with_missing_values idwmv
group by indicator_name
order by count(*) desc;
--Identify any other key debt trends and summarize your findings




select coalesce(debt, 0) as real_debt
from staging.international_debt_with_missing_values idwmv;