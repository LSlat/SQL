--Create employee table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(1),
	hire_date DATE
);

SELECT * FROM employees;

--Create departments table with primary key
CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(50)
);

SELECT * FROM departments;

DROP TABLE IF EXISTS dept_emp;

--Create dept_employees table
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(10),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no)REFERENCES departments (dept_no)
);

--Add a primary key to dept_emp table 
ALTER TABLE dept_emp ADD COLUMN de_id SERIAL PRIMARY KEY;

SELECT * FROM dept_emp;

--Create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(10),
	emp_no INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);

--Add a primary key to dept_manager table
ALTER TABLE dept_manager ADD COLUMN dm_id SERIAL PRIMARY KEY;
	
SELECT * FROM dept_manager;

--Create salaries table
CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

--Add a primary key to salaries table
ALTER TABLE salaries ADD COLUMN s_id SERIAL PRIMARY KEY;

SELECT * FROM salaries;

--Create titles table
CREATE TABLE titles (
	emp_no INT,
	title VARCHAR(50),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

--Add a primary key to titles table
ALTER TABLE titles ADD COLUMN t_id SERIAL PRIMARY KEY;

SELECT * FROM titles;
