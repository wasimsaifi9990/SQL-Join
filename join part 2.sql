create database join_2;
use  join_2;
drop table if exists employee;
create table employee
(
	emp_id			varchar(20),
	emp_name		varchar(50),
	salary			int,
	dept_id			varchar(20),
	manager_id		varchar(20)
);
insert into employee values
('E1', 'Rahul', 15000, 'D1', 'M1'),
('E2', 'Manoj', 15000, 'D1', 'M1'),
('E3', 'James', 55000, 'D2', 'M2'),
('E4', 'Michael', 25000, 'D2', 'M2'),
('E5', 'Ali', 20000, 'D10', 'M3'),
('E6', 'Robin', 35000, 'D10', 'M3');

insert into employee values
('M1', 'Prem', 115000, 'D3', 'M4'),
('M2', 'Shripadh', 125000, 'D4', 'M4'),
('M3', 'Nick', 150000, 'D1', 'M4'),
('M4', 'Cory', 220000, 'D1', '');

drop table if exists department;
create table department
(
	dept_id			varchar(20),
	dept_name		varchar(50)
);
insert into department values
('D1', 'IT'),
('D2', 'HR'),
('D3', 'Finance'),
('D4', 'Admin');

drop table if exists company;
create table company
(
	company_id		varchar(10),
	company_name	varchar(50),
	location		varchar(20)
);
insert into company values
('C001', 'techTFQ Solutions', 'Kuala Lumpur');

insert into company values
('C002', 'techTFQ Media Group', 'Singapore');


DROP TABLE if exists family;
CREATE TABLE family
(
    member_id     VARCHAR(10),
    name          VARCHAR(50),
    age           INT,
    parent_id     VARCHAR(10)
);
insert into family values
  ('F1', 'David', 4, 'F5'),
  ('F2', 'Carol', 10, 'F5'),
  ('F3', 'Michael', 12, 'F5'),
  ('F4', 'Johnson', 36, ''),
  ('F5', 'Maryam', 40, 'F6'),
  ('F6', 'Stewart', 70, ''),
  ('F7', 'Rohan', 6, 'F4'),
  ('F8', 'Asha', 8, 'F4');
  
  
select * from employee; -- D1, D2, D10
select * from department; -- D1, D2, D3, D4
select * from company;

-- FULL Join = INNER Join
--         + all remaining records from Left Table (returns null value for any columns fetched from right table)
--         + all remaining records from Right Table (returns null value for any columns fetched from left table)


-- Write a query to fetch the employee name and their corresponding department name.
-- Make sure to include all the employees and the departments.
select e.emp_name,d.dept_name
from employee e full outer join department d
on e.dept_id = d.dept_id;

-- CROSS JOIN
-- CROSS JOIN returns cartesian product.
-- Meaning it will match every record from the left table with every record from the right table hence it will return records from both table.
-- No join condition is required to be specified.
select e.emp_name, d.dept_name
from employee e
cross join department d ;
select * from company;
select * from department;
select * from employee;
select * from family;

-- Write a query to fetch the employee name and their corresponding department name.
-- Also make sure to display the company name and the company location correspodning to each employee.
select e.emp_name, d.dept_name,c.company_name,c.location
from employee e 
inner join department d on e.dept_id = d.dept_id
cross join company c;


-- NATURAL JOIN - SQL will naturally choose the column on which join should happen based on the column name.
-- Natural join will perform inner join operation if there are columns with same name in both table. If there are more than 1 column with same name then join will happen based on all these columns.
-- If there are no columns with same name in both table then it performs cross join
-- If you specify * in select list then it displays the join columns in the beginning and does not repeat it.
-- No join condition is required to be specified.
select e.emp_name,d.dept_name
from employee e 
natural join department d;

-- SELF JOIN 
-- When you join a table to itself, this is called as SELF Join.
-- There is no keyword like SELF JOIN but we just use the regular JOIN keyword to make the self join.

-- Write a query to fetch the child name and their age correspodning to their parent name and parent age.
select * from family;
select f1.name as child_name, f1.age as child_age ,f2.name as parent_name, f2.age as par_age
from family f1 
join family f2 
where f1.member_id <> f2.member_id and f1.parent_id = f2.member_id;

