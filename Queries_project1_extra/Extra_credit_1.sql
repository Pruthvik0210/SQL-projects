# query to check newly added two records in department table.
select * 
from project_1.department
where Dname = "Fun"
or Dname = "Food";

# query to check newly added two records in project table.
select * 
from project_1.project
where Pname = "Gaming"
or Pname = "Burger";