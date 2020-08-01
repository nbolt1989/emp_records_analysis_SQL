--drop tables section
drop table salaries;
drop table department_emp;
drop table department_manager;
drop table departments;
drop table employees;
drop table title;

--show tables section
select * from title;
select * from employees;
select * from salaries;
select * from departments;
select * from department_emp;
select * from department_manager;

--create all of my tables--
create table title (
    title_id VARCHAR Primary Key,
    title VARCHAR NOT NULL
);

create table employees (
	emp_no INT primary key NOT NULL,
	emp_title_id VARCHAR not null,
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date VARCHAR NOT NULL
);

create table salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
	);
	
create table departments (
	dept_no VARCHAR primary key NOT NULL,
	dept_name VARCHAR NOT NULL
);

create table department_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

create table department_manager (
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--import the CSVs into my tables-- DONE

--DATA ANALYSIS
--Once you have a complete database, do the following:

-- Task 1) List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
--I will need to do a join here with salaries and employees on emp_no since that is shared. 

SELECT e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as " First Name",
e.sex as "Sex",
s.salary as "Salary"
from employees e
inner join salaries s on e.emp_no= s.emp_no limit 10;


--Task 2) List first name, last name, and hire date for employees who were hired in 1986.
--Here I will only need to query the employees table but I will need search all of the 1986 hire 
--dates, I am thinking I can do a wildcard with 1986.

select first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date" from employees e
where hire_date like '%1986' order by hire_date ASC;

--Task 3) List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
--MY NOTES: Here I will list manager of each department from dept_manager, dept # is in dept_manager table
--then I will need to connect dept # to departments with employees since they share emp. #. 
select dm.dept_no as "Dept. Number",
d.dept_name as "Dept. Name",
dm.emp_no as "Emp. Number",
last_name as "Last Name",
first_name as "First Name"
from department_manager dm
inner join departments d on dm.dept_no = d.dept_no 
inner join employees e on dm.emp_no = e.emp_no;

--Task 4) List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
--MY NOTES: Connect Depts with dept_emp with employees
select d.dept_name as "Dept. Name",
e.emp_no as "Emp. Number",
first_name as "First Name",
last_name as "Last Name"
from departments d
inner join department_emp de on de.dept_no = d.dept_no
inner join employees e on e.emp_no = de.emp_no order by e.emp_no ASC;

--Task 5) List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
--MY NOTES: this will be all from employees table.
select first_name, last_name, sex 
from employees 
where first_name = 'Hercules' and last_name like 'B%';

--Task 6) List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.



