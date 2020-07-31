--drop tables section
drop table title
drop table employees
drop table salaries
drop table departments
drop table department_emp
drop table department_manager

--show tables section
select * from title
select * from employees
select * from salaries
select * from departments
select * from department_emp
select * from department_manager

--create my tables--
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
    hire_date DATE NOT NULL
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

