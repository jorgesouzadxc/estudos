--Display the first name, last name, city and state for all customers who live in the same state as customer number 170 (Customers table).

select		first_name
			,last_name
			,city
			,state
from		acdb_customers
where		state = (select state from acdb_customers where customer_id = 170);

select		first_name
			,last_name
			,city
			,state
from		acdb_customers a
			inner join acdb_customers b
			on b.customer_id = 170
			and a.state = b.state;
			


--Display the package number, internet speed and sector number for all packages whose sector number equals to the sector number of package number 10 (Packages table).

select		pack_id
			,speed
			,sector_id
from		acdb_customers
where		sector_id = (select sector_id from acdb_customers where pack_id = 10);

--Display the first name, last name and join date for all customers who joined the company after customer number 540 (Customers table).

select		first_name
			,last_name
			,join_date
from		acdb_customers
where		join_date > (select join_date from acdb_customers where customer_id = 540);

--Display the first name, last name and join date for all customers who joined the company on the same month and on the same year as customer number 372 (Customers table).

select		first_name
			,last_name
			,join_date
from		acdb_customers
where		month(join_date) = (select month(join_date) from acdb_customers where customer_id = 372)
			and year(join_date) =  (select year(join_date) from acdb_customers where customer_id = 372);
			
select		first_name
			,last_name
			,join_date
from		acdb_customers
where		extract(month from join_date) = (select extract(month from join_date) from acdb_customers where customer_id = 372)
			and extract(year from join_date) =  (select extract(year from join_date) from acdb_customers where customer_id = 372)\\

--Display the first name, last name, city, state and package number for all customers whose internet speed is “5Mbps” (Customers and Packages table).

select		first_name
			,last_name
			,city
			,pack_id
from		acdb_customers
where		pack_id in (select pack_id from acdb_packages where speed = '5Mbps');

select		a.first_name
			,a.last_name
			,a.city
			,a.pack_id
from		acdb_customers a
			inner join acdb_packages b
			on a.pack_id = b.pack_id
			and	b.speed = '5Mbps'
order by	first_name;

--Display the package number, internet speed and strt_date (the date it became available) for all packages who became available on the same year as package number 7 (Packages table).

select		pack_id
			,speed
			,strt_date
from		acdb_packages
where		extract(year from strt_date) = (select extract(year from strt_date) from acdb_packages where pack_id = 7);

--Display the first name, monthly discount, package number, main phone number and secondary phone number for all customers whose sector name is Business (Customers, Packages and Sectors tables).

select		first_name
			,monthly_discount
			,pack_id
			,main_phone_num
			,secondary_phone_num
from		acdb_customers
where		pack_id = (select pack_id from acdb_packages)
			and (select sector_id from acdb_packages) = (select sector_id from acdb_sectors where sector_name = lower('business'));
			
select		first_name
			,monthly_discount
			,pack_id
			,main_phone_num
			,secondary_phone_num
from		acdb_customers
where		pack_id in (
				select		pack_id
				from		acdb_packages
				where		sector_id in (
					select		sector_id
					from		acdb_sectors
					where		sector_name = lower('business')
				)
			);

--Display the first name, monthly discount and package number for all customers whose monthly payment is greater than the average monthly payment (Customers and Packages table).

select		first_name
			,monthly_discount
			,pack_id
from		acdb_customers
where		pack_id in 
				(select		pack_id
				from		acdb_packages
				where		monthly_payment > 
								(select		avg(monthly_payment)
								from		acdb_packages));							

--Display the first name, city, state, birthdate and monthly discount for all customers who was born on the same date as customer number 179, and whose monthly discount is greater than the monthly discount of customer number 107 (Customers table)

select		first_name
			,city
			,state
			,birth_date
			,monthly_discount
from		acdb_customers
where		birth_date =
				(select		birth_date
				from		acdb_customers
				where		customer_id = 179)
			and monthly_discount > 
				(select		monthly_discount
				from		acdb_customers
				where		customer_id = 107)

--Display all the data from Packages table for packages whose internet speed equals to the internet speed of package number 30, and whose monthly payment is greater than the monthly payment of package number 7 (Packages table).

select		*
from		acdb_packages
where		speed = 
				(select speed from acdb_packages where pack_id = 30)
			and monthly_payment  >
				(select monthly_payment from acdb_packages where pack_id = 7)

--Display the package number, internet speed, and monthly payment for all packages whose monthly payment is greater than the maximum monthly payment of packages with internet speed equals to “5Mbps” (Packages table).

select		pack_id
			,speed
			,monthly_payment
from		pack_id
where		monthly_payment >
				(select max(monthly_payment) from acdb_packages where speed = '5Mbps')

--Display  the package number, internet speed and monthly payment for all packages whose monthly payment is greater than the minimum monthly payment of packages with internet speed equals to “5Mbps” (Packages table).

select		pack_id
			,speed
			,monthly_payment
from		acdb_packages
where		monthly_payment >
				(select min(monthly_payment) from acdb_packages where speed = '5Mbps')

--Display the package number, internet speed and monthly payment for all packages whose monthly payment is lower than the minimum monthly payment of packages with internet speed equals to “5Mbps” (Packages table).

select		pack_id
			,speed
			,monthly_payment
from		acdb_packages
where		monthly_payment <
				(select min(monthly_payment) from acdb_packages where speed = '5Mbps')

--Display the first name, monthly discount and package number for all customers whose monthly discount is lower than the average monthly discount, and whose package number is the same as customer named “Kevin”

select		first_name
			,monthly_discount
			,pack_id
from		acdb_packages
			where monthly_discount <
				(select		avg(monthly_discount)
				from		acdb_packages
				where		pack_id =
					(select		pack_id
					from		acdb_customers
					where		first_name = 'Kevin'))