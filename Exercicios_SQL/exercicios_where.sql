--Exercises
--Display the first name, last name, and package number for all customers whose last name is “King” (Customers table).

select first_name, last_name, pack_id
from acdb_customers
where lower(last_name) = 'king';

--Display all the data from Packages table for packages whose speed is “5Mbps”.

select *
from acdb_packages
where speed = '5Mbps';

--Display the first name, last name, package number and monthly discount for all customers with monthly discount less than 30 (Customers table).

select first_name, last_name, pack_id, monthly_discount
from acdb_customers
where monthly_discount < 30;

--Display all the data from Customers table for all customers who joined the company before January 1st, 2007.

select *
from acdb_customers
where join_date < to_date('01.01.07', 'DD.MM.YY');

--Display the customer number, first name ,state, city and package number for all customers whose package number equals 21, 28, or 14 (Customers table).

select customer_id
	,first_name
	,last_name
	,state
	,city
	,pack_id
from acdb_customers
where pack_id in(21, 28, 14);

--Display the customer number, first name ,state, city and package number for all customers whose package number is not equal to 27, 10, or 3 (Customers table).

select customer_id
	,first_name
	,last_name
	,state
	,city
	,pack_id
from acdb_customers
where pack_id not in(21, 28, 14);


--Display the last name, main phone number, monthly discount and package number for all customers whose customer number equals 703, 314 or 560 (Customers table).

select last_name
	,main_phone_num
	,monthly_discount
	,pack_id
from acdb_customers
where customer_id in(703, 314, 560);

--Display the first name and monthly discount for all customers whose first name ends with an e (Customers table).

select first_name, monthly_discount
from acdb_customers
where lower(first_name) like '%e';

--Display the last name and package number for all customers where the second letter of their last name is d (Customers table).

select last_name, pack_id
from acdb_customers
where lower(last_name) like '_d%';

--Display all the data from Customers table for all customers who have the letters:  l, j or h in their last name. Order the query in descending order by monthly discount (Customers table).

select *
from acdb_customers
where last_name like '%l%'
	or last_name like '%j%'
	or last_name like '%h%'
order by monthly_discount desc;

--Display the first name, join date, monthly discount and package number for all customers who don’t have the letter a in their last name. Order the query in ascending order by package number (Customers table).

select first_name
	,join_date
	,monthly_discount
	,pack_id
from acdb_customers
where last_name no like '%a%'
order by pack_id;

--Display all data from Customers table for all customers without a package (package number is null)

select *
from acdb_customers
where pack_id is null;

--Display the first name concatenated with the last name (separated by space), and monthly discount for all customers whose monthly discount is not in the range between 20 and 30. Order the query in ascending order by the full name (Customers table).

select (first_name || '-' || last_name) as fullname, monthly_discount
from acdb_customers
where monthly_discount not between 20 and 30
order by fullname;

--Display the first name concatenated with the last name (separated by space), the main phone number concatenated with street (separated by space), and monthly discount for all customers whose monthly discount is in the range between 11 and 27. Name the column headings FULL_NAME, CONTACTS, and DC respectively (Customers table).

select (first_name || ' ' || last_name) as full_name
	,(main_phone_num || ' ' || street) as contacts
	,monthly_discount as dc
from acdb_customers
where monthly_discount between 11 and 27;
	
--Display all data from Customers table for :
--All customers who live in New York and whose monthly discount is in the range between 30 and 40 or

select *
from acdb_customers
where monthly_discount between 30 and 40;

--All customers whose package number is not 8,19, or 30 and whose join date is before January 1st, 2007

select *
from acdb_customers
where pack_id not in(8,19,30)
	and join_date < to_date('01.01.07', 'DD.MM.YY');

--Display the last name, package number, and birthdate for all customers whose join date is in the range between December 12th, 2007 and April 17th, 2010 (Customers table).

select last_name, pack_id, birth_date
from acdb_customers
where join_date between to_date('12.12.07', 'DD.MM.YY') and to_date('17.04.10', 'DD.MM.YY');

--Display the package number, start date, and speed for all packages whose start date is before January 1st, 2007 (Packages table)

select pack_id, strt_date, speed 
from acdb_packages
where strt_date < to_date('01.01.07', 'DD.MM.YY');

--Display the package number, speed, and sector number for all packages whose sector number equals 1 (Packages table).

select pack_id, speed, sector_id
from acdb_packages
where sector_id = 1;

--Display the package number, speed and sector number for all packages with internet speed of “5Mbps” or “10Mbps” (Packages table).

select pack_id, speed, sector_id
from acdb_packages
where speed in('5Mbps', '10Mbps');

--Display the last name and monthly discount for all customers live in Orlando (Customers table).

select last_name, monthly_discount
from acdb_customers
where city = 'Orlando';

--Display the last name and package number for all customers whose package number equals 9 or 18. Preform the exercise once using IN operator, once using OR (Customers table).

select last_name, pack_id
from acdb_customers
where pack_id in (9, 18);

select last_name, pack_id
from acdb_customers
where pack_id = 9 or pack_id = 18;

--Display the first name, main phone number and secondary phone number for all customers without a secondary phone number (secondary phone number is null).

select first_name, main_phone_num, secondary_phone_num
from acdb_customers
where second_phone_num is null;

--Display the first name, monthly discount and package id for all customers without any monthly discount (monthly discount is null).

select first_name, main_phone_num, monthly_discount, pack_id
from acdb_customers
where monthly_discount is null;