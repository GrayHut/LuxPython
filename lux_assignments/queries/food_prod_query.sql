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

--Identify and display the top 3 crops with the highest market price per kilogram

select distinct crop_type, market_price_per_kg, export_destination   from food_prod
order by market_price_per_kg desc
limit 3;


select count(*) 
from food_prod fp;

select distinct crop_type
from food_prod fp;





































