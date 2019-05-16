--Part 1 – Basic Usage
--Display the lowest last name alphabetically (Customers table).

select	min(last_name)
from	acdb_customers;

--Display the average monthly payment (Packages table).

select avg(monthly_payment)
from	acdb_packages;

--Display the highest last name alphabetically (Customers table).

select	max(last_name)
from	acdb_customers;

--Display the number of internet packages (Packages table).

select	count(1)
from	acdb_customers;

--Display the number of records in Customers table.

select	count(1)
from	acdb_customers;

--Display the number of distinct states  (Customers table).

select count(distinct state)
from	acdb_customers;

--Display the number of distinct internet speeds (Packages table).

select	count(distinct speed)
from	acdb_packages;

--Display the number of values (exclude Nulls) in Fax column (Customers table).

select	count(fax)
from	acdb_customers
where	fax is not null;

--Display the number of Null values in Fax column (Customers table).

select	count(fax)
from	acdb_customers
where	fax is null;

--Display the highest, lowest and average monthly discount (Customers table).

select	max(monthly_discount)
		,min(monthly_discount)
		,avg(monthly_discount)
from acdb_customers;

--Part 2 – GROUP BY and HAVING clauses
--Display the state and the number of customers for each state (Customers table).

select	state
		,count(customer_id)
from acdb_customers
group by	state;

--Display the internet speed and the average monthly payment for each speed (Packages table).

select	speed
		,avg(monthly_payment)
from	acdb_customers
group by	speed;

--Display the state and the number of distinct cities for each state (Customers table).

select	state
		,count(city)
from acdb_customers
group by	state;

--Display the sector number and the highest monthly payment for each sector (Packages table).

select	sector_id
		,max(monthly_payment)
from acdb_packages
group by	sector_id;

--Package number and average monthly discount (Customers table) –

select	pack_id
		,avg(monthly_discount)
from	acdb_customers
group by	pack_id;

--Display the package number and the average monthly discount for each package.

select	pack_id
		,avg(monthly_discount)
from	acdb_packages
group by	pack_id;

--Display the package number and the average monthly discount for each package, only for packages whose number equals 22 or 13.

select	pack_id
		,avg(monthly_discount)
from	acdb_customers
group by	pack_id
where	pack_id in(22, 13);

--Display the highest, lowest and average monthly payment for each internet speed (Packages table).

select	speed
		,max(monthly_payment)
		,min(monthly_payment)
		,avg(monthly_payment)
from	acdb_packages
group by speed;

--The number of customer in each internet package (Customers table) –
--Display the package number and the number of customers for each package number.

select	pack_id
		,count(customer_id)
from	acdb_customers
group by	pack_id;

--Modify the query to display the package number and number of customers for each package number, only for the customers whose monthly discount is greater than 20.

select			pack_id
				,count(customer_id)
from			acdb_customers
group by		pack_id
where			monthly_discount > 20;

--Modify the query to display the package number and number of customers for each package number, only for the packages with more than 100 customers.

select			pack_id
				,count(customer_id)
from			acdb_customers
group by		pack_id
having			count(customer_id) > 100;

--Display the state, city and number of customers for each state and city.

select			state
				,city
				,count(customer_id)
from			acdb_customers
group by		state, city;			

--Cities and the average monthly discount (Customers table) –
--Display the city and the average monthly discount for each city

select			city
				,avg(monthly_discount)
from			acdb_customers
group by		city;

--Display the city and the average monthly discount for each city, only for the customers whose monthly discount is greater than 20

select			city
				,avg(monthly_discount)
from			acdb_customers
where			monthly_discount > 20
group by		city;

--States and the lowest monthly discount (Customers table) –
--Display the state and the lowest monthly discount for each state.

select			state
				,min(monthly_discount)
from			acdb_customers
group by		state;

--Display the state and lowest monthly discount for each state, only for states where the lowest monthly discount is greater than 10

select			state
				,min(monthly_discount)
from			acdb_customers
having			min(monthly_discount) > 10
group by		state;

--Display the internet speed and number of package for each internet speed, only for the internet speeds with more than 8 packages.

select			speed
				,count(pack_id)
from			acdb_packages
having			count(pack_id) > 8
group by		speed;
