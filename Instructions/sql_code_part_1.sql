CREATE TABLE department (
   dept_no VARCHAR(50) PRIMARY KEY,
   dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
   emp_no VARCHAR(50) PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE dept_emp (
	emp_no VARCHAR(50) not null,
 	  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(50) not null,
	  FOREIGN KEY (dept_no) REFERENCES department(dept_no), 
  	from_date date not null,
	to_date date not null
);

CREATE TABLE managers(
	dept_no VARCHAR(50) not null,
		FOREIGN KEY (dept_no) REFERENCES department (dept_no),
	emp_no VARCHAR(50) not null,
		FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	from_date date not null,
	to_date date not null
);

CREATE TABLE salaries(
	emp_no VARCHAR(50) not null,
		FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	salaries integer not null,
	from_date date not null,
	to_date date not null
);

CREATE TABLE titles(
	emp_no VARCHAR(50) not null,
		FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	titles VARCHAR(50) not null,
	from_date date not null,
	to_date date not null
);


	
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
CREATE VIEW Employee_Salary AS 
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salaries
FROM salaries AS s
JOIN employees AS e ON
e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
CREATE VIEW Hired_in_1986 AS
SELECT * FROM employees
where hire_date >= '1986-01-01' and
      hire_date < '1987-01-01'

-- 3. List the manager of each department with the following information: department number, department name, 
--    the manager's employee number, last name, first name, and start and end employment dates.
CREATE VIEW manager_details AS
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM department AS d
INNER JOIN managers AS m ON
m.dept_no = d.dept_no
JOIN employees AS e ON
e.emp_no = m.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW employee_departments AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS dp ON
e.emp_no = dp.emp_no
INNER JOIN department AS d ON
dp.dept_no = d.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B
CREATE VIEW Hercules_B_names AS
SELECT * FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW Sales_department_emp AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS dp ON
e.emp_no = dp.emp_no
INNER JOIN department AS d ON
d.dept_no = dp.dept_no
WHERE d.dept_name LIKE 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW Sales_dept_and_Development_dept AS
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN department AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name LIKE 'Development'
OR dp.dept_name LIKE 'Sales';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW frequency_lastnames_descending AS
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;