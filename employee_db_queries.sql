--Employee details
SELECT e.emp_no, last_name, first_name, gender, salary
FROM employees  AS e
JOIN salaries AS s 
ON e.emp_no = s.emp_no;
	
--One way to count rows using inner join (above)
CREATE VIEW test AS
	(SELECT e.emp_no, last_name, first_name, gender, salary
	FROM employees  AS e
	JOIN salaries AS s 
	ON e.emp_no = s.emp_no);
	SELECT COUNT(*) FROM test;

--Count rows of results using inner join
SELECT COUNT(*)
FROM
	(SELECT e.emp_no, last_name, first_name, gender, salary
	FROM employees  AS e
	JOIN salaries AS s 
	ON e.emp_no = s.emp_no) AS a;
	
--Count rows of results using left join
SELECT COUNT(*)
FROM
	(SELECT e.emp_no, last_name, first_name, gender, salary
	FROM employees  AS e
	LEFT JOIN salaries AS s 
	ON e.emp_no = s.emp_no) AS a;

--Employees who were hired in 1986
SELECT emp_no, last_name, first_name, date_part('year', hire_date) AS hire_year
FROM employees
WHERE hire_date = to_date('1986', 'YYYY');

--Dept. managers info.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, MAX(s.to_date) AS end_employment
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS e ON dm.emp_no = e.emp_no
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN salaries AS s ON e.emp_no = s.emp_no
GROUP BY last_name, first_name, dm.emp_no, d.dept_name, d.dept_no, e.hire_date;

--Dept. employees info
SELECT e.emp_no, last_name, first_name, dept_name
FROM departments AS d
JOIN dept_emp AS de ON de.dept_no = d.dept_no
JOIN employees AS e ON e.emp_no = de.emp_no;

--Employees named Hercules
SELECT first_name, last_name
FROM employees
WHERE first_name ='Hercules'
AND last_name LIKE('B%');

--Employees in the Sales Department
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS de ON de.dept_no = d.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
WHERE dept_name  = 'Sales';

--Employees in the Sales and in the Development departments
SELECT e.emp_no, last_name, first_name, dept_name
FROM departments AS d
JOIN dept_emp AS de ON de.dept_no = d.dept_no
JOIN employees AS e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--Export query results to CSV
COPY (SELECT e.emp_no, last_name, first_name, dept_name
	FROM departments AS d
	JOIN dept_emp AS de ON de.dept_no = d.dept_no
	JOIN employees AS e ON e.emp_no = de.emp_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development')
TO 'C:\~Linn\Computer\Data Analysis\Boot Camp at KU\09-SQL\Homework\Instructions\Employee db\results.csv'
DELIMITER ',' CSV HEADER;

--Number of employees with the same last names
SELECT e.last_name, COUNT(*) AS name_count
FROM employees AS e
GROUP BY e.last_name
ORDER BY name_count DESC;

--Average salary by title
SELECT title, AVG(salary) AS avg_salary
FROM titles AS t
JOIN salaries AS s ON s.emp_no = t.emp_no
GROUP BY title
ORDER BY avg_salary;

