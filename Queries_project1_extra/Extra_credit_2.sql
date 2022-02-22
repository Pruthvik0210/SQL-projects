# Extra Credit Task 2
/*
the first view PROJ_EMPS. The view will have the following information:
 PROJ_EMPS (PNAME, LNAME, FNAME, HOURS) and 
 will order the project info by PNAME in ascending order and within each 
 PNAME the employees will be ordered by LNAME, FNAME in ascending order also.
 */
CREATE VIEW PROJ_EMPS as 
select project.Pname, employee.Lname, employee.Fname, works_on.Hours
from employee, project, works_on
where project.pnumber = works_on.Pno
and employee.SSN = works_on.ESSN
ORDER BY project.Pname,employee.Lname, employee.Fname ASC; 
Select * from PROJ_EMPS;


/*The second view PROJ_SUMMARY will have one record for each project 
and will include the information PROJ_SUMMARY (PNAME, NO_OF_EMPS, TOTAL_HOURS), 
where NO_OF_EMPS is the number (COUNT) of employees currently working on the project
 and TOTAL_HOURS is the SUM of the HOURS that the employees work on the project.
 Order the data by PNAME in descending order.
*/
CREATE VIEW PROJ_SUMMARY as 
select project.Pname, count(works_on.ESSN) as Number_of_Employees, 
sum(works_on.Hours) as Total_Hours
from project, works_on
where project.pnumber = works_on.Pno
group by Pname
ORDER BY project.Pname DESC; 
Select * from PROJ_SUMMARY;

