--Inner JOIN
--Customers and internet packages (Customers & Packages tables) –
--Write a query to display first name, last name, package number and internet speed for all customers.

select			a.first_name
				,a.last_name
				,a.pack_id
				,b.speed
from			acdb_customers a
				inner join acdb_packages b
				on a.pack_id = b.pack_id;

--Write a query to display first name, last name, package number and internet speed for all customers whose package number equals 22 or 27. Order the query in ascending order by last name.

select			a.first_name
				,a.last_name
				,a.pack_id
				,b.speed
from			acdb_customers a
				inner join acdb_packages b
				on a.pack_id = b.pack_id
where			a.pack_id in(22, 27);
				

--Internet packages and sectors –
--Display the package number, internet speed, monthly payment and sector name for all packages (Packages and Sectors tables).

select			a.pack_id
				,a.speed
				,a.monthly_payment
				,b.sector_name
from			acdb_packages a
				inner join acdb_sectors b
				on a.sector_id = b.sector_id;
				
--Display the customer name, package number, internet speed, monthly payment and sector name for all customers (Customers, Packages and Sectors tables).

select			a.first_name || ' ' || a.last_name as fullname
				,b.pack_id
				,b.speed
				,b.monthly_payment
				,c.sector_name
from			acdb_customers a
				inner join acdb_packages b
				on a.pack_id = b.pack_id
				inner join acdb_sectors c
				on b.sector_id = c.sector_id;

--Display the customer name, package number, internet speed, monthly payment and sector name for all customers in the business sector (Customers, Packages and Sectors tables).

select			a.first_name || ' ' || a.last_name as fullname
				,b.pack_id
				,b.speed
				,b.monthly_payment
				,c.sector_name
from			acdb_customers a
				inner join acdb_packages b
				on a.pack_id = b.pack_id
				inner join acdb_sectors c
				on b.sector_id = c.sector_id
where			lower(c.sector_name) = 'business';				

--Display the last name, first name, join date, package number, internet speed and sector name for all customers in the private sector who joined the company in the year 2006.

select			a.first_name
				,a.join_date
				,b.pack_id
				,b.speed
				,c.sector_name
from			acdb_customers a
				inner join acdb_packages b
				on a.pack_id = a.pack_id
				inner join acdb_sectors c
				on b.sector_id = c.sector_id
where			lower(c.sector_name) = 'private'
				and extract(year from join_date) = 2006;
				
--Outer Join
--Customers and internet packages (Customers and Packages tables)



--Display the first name, last name, internet speed and monthly payment for all customers. Use INNER JOIN to solve this exercise.

select			a.first_name
				,a.last_name
				,b.speed
				,b.monthly_payment
from			acdb_customers a
				inner join acdb_packages b
				on a.pack_id = b.pack_id;

--Modify last query to display all customers, including those without any internet package.

select			a.first_name
				,a.last_name
				,b.speed
				,b.monthly_payment
from			acdb_customers a
				left join acdb_packages b
				on a.pack_id = b.pack_id;

--Modify last query to display all packages, including those without any customers.

select			a.first_name
				,a.last_name
				,b.speed
				,b.monthly_payment
from			acdb_customers a
				right join acdb_packages b
				on a.pack_id = b.pack_id;

--Modify last query to display all packages and all customers.

select			a.first_name
				,a.last_name
				,b.speed
				,b.monthly_payment
from			acdb_customers a
				full join acdb_packages b
				on a.pack_id = b.pack_id;

--Self Join
--Display the last name, first name and package number for all customers who have the same package number as customer named ‘Amado Taylor’ (Customers table).

select			a.last_name
				,a.first_name
				,a.pack_id
from			acdb_customers a
				inner join acdb_customers b
				on b.first_name = 'Amado'
				and b.last_name = 'Taylor'
				and a.pack_id = b.pack_id;

--Display the last name, first name and monthly discount for all customers whose monthly discount is lower than the monthly discount of employee number 103 (Customers table).

select			a.last_name
				,a.first_name
				,a.monthly_discount
from			acdb_customers a
				inner join acdb_customers b
				on b.customer_id = 103
				and a.monthly_discount < b.monthly_discount;

--Display the package number and internet speed for all packages whose internet speed is equal to the internet speed of package number 10 (Packages table).

select			a.pack_id
				,a.speed
from			acdb_packages a
				inner join acdb_packages b
				on b.pack_id = 10
				and a.speed = b.speed\\
