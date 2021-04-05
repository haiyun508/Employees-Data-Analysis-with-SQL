--1. List the following details of each employee: employee number, last name, first name, 
--sex, and salary.
select ep.emp_no,ep.last_name,ep.first_name,ep.sex,sl.salary
from employees as ep
join salaries as sl
on sl.emp_no=ep.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
select ep.first_name, ep.last_name, ep.hire_date 
from employees as ep
WHERE extract(year from hire_date) = 1986

--3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
create view all_info as
select d.dept_no,d.dept_name,ep.emp_no,ep.last_name,ep.first_name
from employees as ep
join dept_emp as d_e
on ep.emp_no=d_e.emp_no
join departments as d
on d.dept_no=d_e.dept_no;

select dept_no,dept_name,emp_no,last_name,first_name
from all_info
where emp_no in
	(
	select emp_no 
	from dept_manager
	)
order by dept_no ASC;

--4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select emp_no,last_name,first_name,dept_name
from all_info

/*5.List first name, last name, and sex for employees 
whose first name is "Hercules" and last names begin with "B."*/
select first_name, last_name,sex
from employees
where first_name='Hercules'
and last_name like'B%'

/*6. List all employees in the Sales department, including their employee number, 
last name, first name, and department name.*/
select emp_no, last_name, first_name, dept_name 
from all_info
where dept_name='Sales'

/*7. List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
select emp_no,last_name,first_name,dept_name
from all_info
where dept_name in ('Sales','Development')

/*8. In descending order, list the frequency count of employee last names, 
i.e., how many employees share each last name.*/
select count(last_name) as frequency,last_name
from employees
group by last_name
order by frequency DESC


