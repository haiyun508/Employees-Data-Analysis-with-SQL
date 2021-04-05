--create table departments
CREATE TABLE public.departments
(
    dept_no character varying(50),
    dept_name character varying(50),
    PRIMARY KEY (dept_no)
);
--create table titles
CREATE TABLE public.titles
(
    title_id character varying(30),
    title character varying(50),
    PRIMARY KEY (title_id)
);

--create table salaries
CREATE TABLE public.salaries
(
    emp_no integer,
    salary integer,
    PRIMARY KEY (emp_no)
);

--create table employees
CREATE TABLE public.employees
(
    emp_no integer NOT NULL,
    emp_title_id character varying(30),
    birth_date date,
    first_name character varying(30),
    last_name character varying(30),
    sex character varying(10),
    hire_date date,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES public.salaries (emp_no), 
    FOREIGN KEY (emp_title_id)REFERENCES public.titles (title_id)
);    

--create table dept_manager
CREATE TABLE public.dept_manager
(
    dept_no character varying(30) NOT NULL,
    emp_no integer NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES public.departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES public.employees (emp_no) 
        
)

--create table dept_emp
CREATE TABLE public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying(30) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES public.departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES public.employees (emp_no) 
)
