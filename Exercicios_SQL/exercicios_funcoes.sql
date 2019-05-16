--String Functions
--Display the customer number, first name in lowercase and last name in uppercase for all customers whose customer number is in the range of 80 and 150.

select customer_id, lower(first_name), upper(last_name)
from acdb_customers
where customer_id between 80 and 150;

--Generating Email Addresses
--For all customers – display the last name, first name and email address. The email address will be composed from the first letter of first name concatenated with three first letters of last name concatenated with the string “@mymail.com” (For example : Ram Kedem → RKED@mymail.com).

select first_name
	,last_name
	,(substr(first_name, 1, 1) || substr(last_name, 1, 3) || '@mymail.com') as email_address
from acdb_customers;

--For all customers – display the last name, first name and email address. The email address will be composed from the first letter of first name concatenated with three last letters of last name concatenated with the string “@mymail.com” (For example : Ram Kedem → RDEM@mymail.com).

select first_name
	,last_name
	,(substr(first_name, -3, 1) || substr(last_name, 1, 3) || '@mymail.com') as email_address
from acdb_customers;

--Display the last name and the length of the last name for all customers where last name’s length is greater than 9 characters.

select last_name, length(last_name) as "last name length"
from acdb_customers
where length(last_name) > 9;

--Phone Numbers :
--Display the first name, last name, main phone number and a new phone number using the REPLACE function. In the new phone number replace all occurrences of “515” with “$$$”.

select	first_name
		,last_name
		,main_phone_num
		,replace(main_phone_num, '515', '$$$') as "new phone"
from acdb_customers;

--Display the first name, last name, main phone number and new phone number using the REPLACE function. In the new phone number replace all prefixes of “515” with “$$$” (only if the first 3 digits of the phone number contains the digits “515” replace those digits with “$$$”).

select	first_name
		,last_name
		,main_phone_num
		,regexp_replace(main_phone_num, '^515', '$$$') as "new phone"
from acdb_customers;

-- 
--
--Numeric Functions
--From customers table, for all customers, display :
--first name.
--monthly discount.
--monthly discount after addition of 19.7%.
--monthly discount after addition of 19.7%, expressed as a whole number (ROUND).
--monthly discount after addition of 19.7%, round down to the nearest whole number (FLOOR).
--monthly discount after addition of 19.7%, round up to the nearest whole number (CEILING).

select	first_name
		,monthly_discount
		,monthly_discount * 1.197
		,round(monthly_discount * 1.197)
		,floor(monthly_discount * 1.197)
		,ceiling(monthly_discount * 1.197)
from acdb_customers;

--Date Functions
--From Customers table, for all customers, display the first name, join date, join date minus 10 days, join date plus one month and the date difference between join date and current date.

select	first_name
		,join_date
		,join_date - 10 								as "menos 10 dias"
		,add_months(join_date, 1) 						as "mais 1 mes"
		,floor(sysdate - join_date) || ' dias' 			as "diferença"
from acdb_customers;

--Display the first name, birthdate and age for all customers whose older than 50.

select	first_name
		,birth_date
		,extract(year from sysdate) - extract(year from birth_date) as "Age"
from acdb_customers
where extract(year from sysdate) - extract(year from birth_date) > 50;

--Display all the data from Customers table, for all customers whose birthdate is today.

select	*
from acdb_customers
where birth_date = sysdate;

--Display the first name, join date and the difference in years between join date and current date for all customers where today have passed exactly 5 years since they joined the company.

select	first_name
		,join_date
		,extract(year from sysdate) - extract(year from join_date) as "diferenca"
where	extract(year from sysdate) - extract(year from join_date) = 5
		and extract(month from sysdate) - extract(month from join_date)
		extract(day from sysdate) - extract(day from join_date);

--Conversion functions
--Display the first name concatenated with the join date, and last name concatenated with the monthly discount, for all customers. Solve this exercise using CAST.

select	cast(first_name || ' ' || join_date as varchar2(50))
		cast(last_name || ' ' || monthly_discount as varchar2(50))
from acdb_customers;

--From Customers table, for all customers whose last name starts with a d or k, display:
--last name
--state in uppercase concatenated with customer number
--join date concatenated with birthdate
--Solve this exercise using CONVERT, and in the WHERE clause instead of using LIKE, try to define the filtering condition using SUBSTRING.

select	last_name
		,upper(state)
		,join_date || ' ' || birth_date
where	substr(last_name, 1, 1) = 'd'
		or substr(last_name, 1, 1) = 'k';

--Null-Related Functions
--Phone numbers report:
--Display the first name, last name, birth date, main phone number and secondary phone number for all customers whose package number equals 27. Replace every null value in main phone number or in secondary phone number with ‘N/A’.

select	first_name
		,last_name
		,birth_date
		,coalesce(main_phone_num, 'N/A')
		,coalesce(secondary_phone_num, 'N/A')
where	pack_id = 27;

--Display the first name, last name, birth date, main phone number, secondary phone number for all customers who was born on 1972. Replace every null value in main phone number or in secondary phone number with ‘N/A’.

select	first_name
		,last_name
		,birth_date
		,coalesce(main_phone_num, 'N/A')
		,coalesce(secondary_phone_num, 'N/A')
from	acdb_customers
where	extract(year from birth_date) - 1000 = 1971;

--CASE Function
--From Customers table, for all customers, display the first name, last name, monthly discount and a discount grade based on these conditions :
--If the discount is between 0 and 10 – discount grade level is A.
--If the discount is between 11 and 20 – discount grade level is B.
--If the discount is between 21 and 30 – discount grade level is C.
--for any other value – discount grade level is D.

select	first_name
		,last_name
		,monthly_discount
		,case
			when monthly_discount between 0 and 10 then 'A'
			when monthly_discount between 11 and 20 then 'B'
			when monthly_discount between 21 and 30 then 'C'
			else 'D'
		end as "grade"
from acdb_customers;