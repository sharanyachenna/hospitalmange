create table employee(
    emp_id  SERIAL PRIMARY KEY NOT NULL,
    emp_name varchar(30) NOT NULL,
    salary INTEGER,
    dept_id varchar(30) NOT NULL,
    manager_id varchar(30) NOT NULL
);

INSERT INTO employee(emp_name,salary,dept_id,manager_id)
VALUES ('Rahul',15000, 'D1', 'M1'),
('Manoj',15000, 'D1', 'M1'),
('James',55000,'D2','M2'),
('Michael',25000,'D2','M2'),
('Ali',20000,'D10','M3'),
('Robin',35000,'D10','M3');

CREATE TABLE department(
    dept_id varchar(30) NOT NULL, 
    dept_name varchar(30) NOT NULL
);

INSERT INTO department(dept_id,dept_name)
VALUES('D1','IT'),
('D2','HR'),
('D3','Finance'),
('D4','Admin');

CREATE TABLE manager(
    manager_id varchar(30) NOT NULL,
    manager_name varchar(30) NOT NULL,
    dept_id VARCHAR(30) NOT NULL
);

INSERT INTO manager(manager_id,manager_name,dept_id)
VALUES('M1','Prem','D3'),
('M2','Shripadh','D4'),
('M3','Nick','D1'),
('M4','Cory','D1');

CREATE TABLE projects(
    project_id VARCHAR(30) NOT NULL,
    project_name VARCHAR(30) NOT NULL,
    team_member_id VARCHAR(30) NOT NULL
);

INSERT INTO projects(project_id,project_name,team_member_id)
VALUES('P1','Data Migration','E1'),
('P1','Data Migration','E2'),
('P1','Data Migration','M3'),
('P2','SAP','E1'),
('P2','SAP','M4');

CREATE TABLE company(
    company_id VARCHAR(30) NOT NULL,
    company_name VARCHAR(30) NOT NULL,
    location VARCHAR(30) NOT NULL
);

INSERT INTO company(company_id,company_name,location)
VALUES ('E001', 'Edubridge', 'kamalapur');

--left join  ==> left outer join
--right join ==> right outer join
--inner join ==> join
-- full join ==> full outer join


--Fetch the employee name and the department name they belong too
--INNER JOIN
select e.emp_name , d.dept_name
from employee AS e
JOIN department AS d ON
e.dept_id = d.dept_id;

--Fetch all the employee name and their department name they belong too
--left join =inner join + any additional records in the left table
select e.emp_name , d.dept_name
from employee AS e
 LEFT JOIN department AS d ON
e.dept_id = d.dept_id;


--right join = inner join + any additional records from the right table
select e.emp_name , d.dept_name
from employee AS e
 RIGHT JOIN department AS d ON
e.dept_id = d.dept_id;
--above and below queries give same output
select e.emp_name , d.dept_name
 from department AS d
 LEFT JOIN employee AS e ON
 d.dept_id = e.dept_id;


--Fetch details of all the employees, their manager , their department and the projects they work on
--query is not working
select e.emp_name, d.dept_name , m.manager_name , p.project_name
from employee as e 
left join department as d on e.dept_id = d.dept_id
inner join manager as m on  m.manager_id = e.manager_id
 left join projects as p on p.team_member_id = e.emp_id;

--FULL Join = Inner join
--           + all remaining records from right table
--            + all remaining records from left table
-- full join or full outer join gives same output
select e.emp_name , d.dept_name 
from employee as e
FULL outer JOIN department as d on
d.dept_id = e.dept_id;

--CROSS JOIN no need to write..  on
--this returns cartesian product
select e.emp_name, d.dept_name
from employee as e
cross join department as d;

--write a query to fetch the employee name and their corresponding department name.
--Also make sure to display the company name and company location corresponding to each employee
select e.emp_name, d.dept_name, c.company_name, c.location
from employee as e
INNER join  department as d on e.dept_id = d.dept_id
cross join company c;

--NATURAL JOIN no need to use on clause same as cross join 
select  e.emp_name, d.dept_name
from employee as e
natural join department as d;

 --NATURAL JOIN	
--1.	The join operation which is used to merge two tables depending on their same column name and data types is known as natural join.
--2.  Here, the final table will accommodate all the attributes of both the tables and doesn’t duplicate the column.

--INNER JOIN 
--1. Inner joins have a specific join condition. Here, the join operation is used to form a new table by joining column values of two tables based upon the join-predicate.
--2. Here, the final table will accommodate all the attributes of both the tables and it also holds the duplicate columns.
 
 --SELF JOIN 
 