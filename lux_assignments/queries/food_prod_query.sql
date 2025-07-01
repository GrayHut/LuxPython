create schema food_test_data;

drop schema food_test_data;

create table food_prod (
	crop_type VARCHAR(8),
	harvest_date DATE,
	quantity_harvested INT,
	average_temperature DECIMAL(3,1),
	rainfall_amount DECIMAL(4,1),
	soil_ph_level DECIMAL(2,1),
	pesticide_used VARCHAR(50),
	organic_certified VARCHAR(50),
	market_price_per_kg DECIMAL(5,2),
	export_destination VARCHAR(13)
);

select * from food_prod fp 
limit 200;

select count(*) 
from food_prod fp;

select distinct fp.export_destination 
from food_prod fp;

--*********************************************************************************************************************************************************
--Assigment start

--1)Insert a new record for Maize harvested on 2025-05-10. Include all required fields such as quantity harvested, average temperature, rainfall amount, 
--soil pH level, pesticide used, organic certification, market price per kg, and export destination with appropriate sample values.

insert into food_prod 
(crop_type, harvest_date, quantity_harvested, average_temperature, rainfall_amount, soil_ph_level, pesticide_used, organic_certified, market_price_per_kg, export_destination)
values (
	'maize',
	'2025-05-10',
	5000,
	19,
	100,
	6.3,
	true,
	false,
	50.8,
	'Africa'
);
--2)Insert two separate records for Wheat and Tea crops with different export destinations and organic certification statuses. 
--Ensure each record has complete information including harvest dates, environmental conditions, and market details.

insert into food_prod 
(crop_type, harvest_date, quantity_harvested, average_temperature, rainfall_amount, soil_ph_level, pesticide_used, organic_certified, market_price_per_kg, export_destination)
values (
	'wheat',
	'2024-08-03',
	4300,
	27.5,
	114,
	3.7,
	'false',
	'true',
	70,
	'Asia'
);
insert into food_prod 
(crop_type, harvest_date, quantity_harvested, average_temperature, rainfall_amount, soil_ph_level, pesticide_used, organic_certified, market_price_per_kg, export_destination)
values (
	'tea',
	'2023-07-12',
	3201,
	16.0,
	200,
	7.0,
	'true',
	'false',
	77,
	'South America'
);

--3)Display the complete contents of the food_prod table showing all columns and rows.

select * from food_prod fp;

--4)List all crops that are organic-certified and destined for export to European countries.

select *
from food_prod fp 
where fp.organic_certified = 'true' and fp.export_destination = 'Europe';

--5)Show only the crop type and quantity harvested for all entries that were harvested after January 1, 2025.

select 
	crop_type,
	quantity_harvested
from food_prod fp 
where fp.harvest_date > '2025-01-01';


--6)Identify and display the top 3 crops with the highest market price per kilogram.

select 
	distinct crop_type,
	market_price_per_kg,
	fp.export_destination 
from food_prod fp
order by fp.market_price_per_kg desc
limit 3;

--7)Find and display all crop records where no pesticide was used during cultivation.

select *
from food_prod fp 
where fp.pesticide_used = 'false';

--8)Calculate and display the total number of records currently stored in the food_prod table.

select count(*) from food_prod fp;

--9)Calculate the average market price for crops grouped by their export destination.

select 
	export_destination,
	round(avg(market_price_per_kg), 2) as avg_market_price
from food_prod fp 
group by export_destination;

--10)Retrieve all records where the soil pH level is below 5.5 and the crop is not organically certified.

select *
from food_prod fp
where fp.soil_ph_level < 5.5 and fp.organic_certified = 'false';

--11)Identify crops with quantity harvested greater than 1000 kg that are exported to countries whose names start with the letter 'G'.

select 
	crop_type,
	quantity_harvested
from food_prod fp 
where fp.quantity_harvested > 1000 and fp.export_destination like 'G%';

--12)Update the market price per kg to 50.00 for all Maize crops that were harvested before January 1, 2025.

update food_prod fp 
set market_price_per_kg = 50.00
where fp.crop_type = 'maize' and fp.harvest_date < '2025-01-01';

--13)Change the organic certification status to "No" for all records where pesticide was used during cultivation.

update food_prod fp 
set pesticide_used = 'No'
where fp.pesticide_used = 'true';

--14)Update the export destination to "Local" for all records where the market price per kg is below 20.00.

update food_prod fp 
set export_destination = 'Local'
where fp.market_price_per_kg < 20.00;

--15)Delete all records where the harvest date is before the year 2023.

delete
from food_prod 
where harvest_date < '2023-01-01';

--16)Remove all records where the quantity harvested is either null or equal to zero.

delete 
from food_prod 
where quantity_harvested is null or quantity_harvested = 0;

--*********************************************************************************************************************************************************






































