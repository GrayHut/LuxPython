create schema dw;
drop schema dw;

--products, customers, stores, employees, time
--sales_transactions, inventory_movement, customer_interaction

create table DIM_products(
product_id serial primary key,
product_name varchar(100),
brand varchar(100),
category varchar(100),
price float
);

create table DIM_stores(
store_id serial primary key,
store_name varchar(100),
city varchar(100),
region varchar(200),
store_type varchar(100)
);

create table DIM_employees(
employee_id serial primary key,
emp_name varchar(100),
hire_date date,
emp_store serial,
foreign key(emp_store) references DIM_stores(store_id)
);

create table DIM_customers(
customer_id serial primary key,
customer_name varchar(100),
age int,
gender varchar(10),
location varchar(500),
email varchar(500)
);

create table DIM_time(
date_id date primary key,
date date,
month int,
quarter int,
year int,
day_of_week varchar
);

create table sales_trans(
sales_trans_id serial primary key,
quantity_sold int,
price float,
prod_id serial,
customer_id serial,
emp_id serial,
store_id serial,
date_id date,
foreign key(prod_id) references DIM_products(product_id),
foreign key(customer_id) references DIM_customers(customer_id),
foreign key(store_id) references DIM_stores(store_id),
foreign key(date_id) references DIM_time(date_id)
);

create table inventory_mvt(
inv_mvt_id serial primary key,
date_id date,
prod_id serial,
store_id serial,
movement_type varchar,
quantity_change varchar,
foreign key(date_id) references DIM_time(date_id),
foreign key(prod_id) references DIM_products(product_id),
foreign key(store_id) references DIM_stores(store_id)
);

create table customer_inter(
interaction_id serial primary key,
date_id date,
prod_id serial,
store_id serial,
customer_id serial,
emp_id serial,
interaction_type varchar,
feedback_store float,
foreign key(date_id) references DIM_time(date_id),
foreign key(prod_id) references DIM_products(product_id),
foreign key(store_id) references DIM_stores(store_id)
);

drop table DIM_customers;
drop table DIM_time;
drop table DIM_products;
drop table DIM_employees;
drop table DIM_stores;
drop table customer_inter;
drop table inventory_mvt;
drop table sales_trans;

--*******************************************************************************************************************************

create table DIM_PRODUCTS(
Product_id int primary key,
product_name varchar(100),
Category varchar(100),
Brand varchar(100),
price float
);
 
create table DIM_CUSTOMERS(
Customer_id int primary key,
Full_name varchar (100),
Gender varchar(100),
age int,
location varchar(100),
Email varchar(100)
);
 
create table DIM_STORES(
Store_id int primary key,
Store_name varchar(100),
City varchar(100),
region varchar(100),
Store_type varchar(100)
);
 
create table DIM_EMPLOYEES(
Employee_id int primary key,
Ful_name varchar(100),
position varchar(100),
Hire_date date,
Employee_store_id int,
foreign key (Employee_store_id) references DIM_STORES(Store_id)
);
 
create table DIM_TIME(
Date_id int primary key,
Date date,
Month int,
Quarter int,
year int,
Day_of_the_week varchar
);
 
create table Fact_sales(
Transactional_id int primary key,
Date_id int,
Product_id int,
Store_id int,
Customer_id int,
Quantity_sold int,
Price float,
foreign key (Date_id) references DIM_TIME(Date_id),
foreign key(Product_id) references DIM_PRODUCTS(Product_id),
foreign key(Customer_id) references DIM_CUSTOMERS(Customer_id),
foreign key(Store_id) references DIM_STORES(Store_id)
);
 
 
create table fact_inventory(
Movement_id int primary key,
date_id int,
product_id int,
Store_id int,
Movement_type varchar,
Quantity_change varchar,
foreign key (date_id) references DIM_TIME(Date_id),
foreign key(Product_id) references DIM_PRODUCTS(Product_id),
foreign key(Store_id) references DIM_STORES(Store_id)
);
 
create table fact_customer_interaction(
Interaction_id int,
Date_id int,
Product_id int,
Store_id int,
Customer_id int,
Employee_id int,
Interaction_type varchar,
Feedback_score int,
foreign key (date_id) references DIM_TIME(Date_id),
foreign key(Product_id) references DIM_PRODUCTS(Product_id),
foreign key(Store_id) references DIM_STORES(Store_id)
);

--*******************************************************************************************************************************
































