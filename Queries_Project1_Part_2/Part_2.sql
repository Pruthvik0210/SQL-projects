# 2:For the “Research” department, retrieve all the names, salaries and employees ID of all employees who work in that department and earn salary less than 60000. 
select Fname, Lname, Salary, SSN as Employee_Id
from employee, department 
where Dname = "Research" 
and Dnumber = Dno 
and Salary < 60000;


# 3:Enter a department name, and retrieve all the names and salaries of all employees who work in that department.
#   change value of var_department_name varible to reterive output for desired department name.
set @var_department_name = "Administration";
select Fname, Lname, Salary 
from employee, department 
where Dname = @var_department_name 
and Dnumber = Dno ;


# 4:For the employee, whose last name is “Henderson” and first name is “Mike”, retrieve a list of projects names/hours per week that the employee works on.
select Pname as Project_names, Hours as Hours_per_week 
from employee, works_on, project 
where Lname = " Henderson" 
and Fname = "Mike" 
and ESSN = SSN 
and Pnumber = Pno ;


# 5:Enter an employee last name and first name and retrieve a list of projects names/hours per week that the employee works on.
#   change value of variables var_last_name & var_first_name to get output for a pertivular employee
set @var_last_name = " Borg";
set @var_first_name = "James";
select Pname as Project_names, Hours as Hours_per_week 
from employee, works_on, project 
where Lname = @var_last_name 
and Fname = @var_first_name 
and ESSN = SSN 
and Pnumber = Pno ;


# 6:Enter a department name and retrieve the total (sum) of all employee salaries who work in the department.
#   change value of var_dept_name varible to reterive output for desired department name.
set @var_dept_name = "Sales";
select sum(Salary) as Total_Salary 
from employee,department 
where Dname = @var_dept_name 
and Dnumber = Dno;


# 7:For each department Located in Texas, retrieve the department name and the number (count) employees who work in that department. Order the result by number of employees in descending order.
select Dname, count(SSN) as Number_of_Employees
from employee, department, dept_locations
where employee.Dno = department.Dnumber
and department.Dnumber = 
(select dept_locations.Dnumber 
where dept_locations.Dlocation in (' Houston', ' Dallas',' Arlington',' Austin')) 
group by Dname
order by count(SSN) desc;


# 8:For each department, retrieve the department name and the number (count) of employees who work in that department. and have a salary greater or equal to 50000. Order the result by number of employees in descending order.
select Dname, count(SSN) as Number_of_Employees
from employee, department
where employee.Dno = department.Dnumber
and Salary >= 50000 
group by Dname
order by count(SSN) desc;


# 9:For each department, retrieve the following information: the department name; the first and last name of the employee who manages the department; the number (count) of employees who work in the department; the total (sum of) salaries of the employees who work in that department; and the highest and lowest salary of the employees who work in that department. Order the result alphabetically by department name.
select Dname,E.Fname,E.Lname,
count(employee.SSN) as Number_of_Employees, 
sum(employee.Salary) as Total_Salary, 
max(employee.Salary) as Highest_Salary, 
min(employee.Salary) as Lowest_Salary 
from department,employee as E,employee
where E.SSN = department.Mgr_SSN
and employee.Dno = department.Dnumber
group by Dname
order by Dname asc;
 

# 10:For each project, retrieve the project name and the number (count) of employees who are working on that project. Order the result in descending order by number of employees.
select Pname, count(works_on.ESSN) as Number_of_Employees
from project, works_on
where project.Pnumber = works_on.Pno
group by Pname
order by count(works_on.ESSN) desc;


# 11: For each employee who is a supervisor, retrieve the employee first and last name and the number (count) of employees that are supervised. Order the result in descending order.
select E.Fname,E.Lname,count(employee.SSN) as Number_of_Employees
from department,employee as E,employee
where E.SSN = department.Mgr_SSN
and employee.Super_ssn = E.SSN
and employee.Super_ssn != employee.SSN
and employee.Super_ssn != 'null'
group by E.Fname, E.Lname
order by count(employee.SSN) desc;
