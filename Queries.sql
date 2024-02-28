-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
employee.emp_no,
employee.first_name,
employee.last_name,
employee.sex,
salaries.salary
FROM employee
JOIN salaries
ON employee.emp_no = salaries.emp_no
ORDER BY emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
first_name,
last_name,
hire_date
FROM
employee
WHERE DATE_PART('year', hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select
dept_manager.dept_no,
dept_manager.emp_no,
departments.dept_name,
employee.first_name,
employee.last_name
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employee
ON dept_manager.emp_no = employee.emp_no
ORDER BY emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select 
dept_emp.dept_no,
departments.dept_name,
employee.emp_no,
employee.first_name,
employee.last_name
FROM Employee
Join dept_emp on employee.emp_no = dept_emp.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
ORDER BY employee.emp_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
first_name,
last_name,
sex
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
employee.emp_no,
employee.first_name,
employee.last_name,
departments.dept_name
FROM employee
JOIN dept_emp
ON employee.emp_no = dept_emp.emp_no
Join departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
employee.emp_no,
employee.first_name,
employee.last_name,
departments.dept_name
FROM employee
JOIN dept_emp
ON employee.emp_no = dept_emp.emp_no
Join departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
last_name,
COUNT (*) as last_name_count
FROM employee
GROUP BY last_name
ORDER BY last_name_count DESC;
