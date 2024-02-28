--Table Setup
DROP TABLE departments;
DROP TABLE titles;
DROP TABLE employee;
DROP TABLE dept_emp;
DROP TABLE salaries;
DROP TABLE dept_manager;


CREATE TABLE departments(
	dept_no varchar(5) NOT NULL,
	dept_name varchar(30),
	PRIMARY KEY (dept_no)
);

SELECT * from departments;

CREATE TABLE titles(
	title_id varchar(20) NOT NULL,
	title varchar(30) NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * from titles;

CREATE TABLE employee(
	emp_no int NOT NULL,
    emp_title_id varchar(10) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(20) NOT NULL,
    last_name varchar(20) NOT NULL,
    sex varchar(2) NOT NULL,
    hire_date date NOT NULL,
	PRIMARY KEY ("emp_no"),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

SELECT * from employee;

CREATE TABLE dept_emp(
	emp_no int NOT NULL,
	dept_no varchar(20) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * from dept_emp;

CREATE TABLE salaries(
	emp_no int NOT NULL,
	salary int NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

SELECT * from salaries;

CREATE TABLE dept_manager(
	dept_no varchar(20) NOT NULL,
	emp_no int NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_manager;

