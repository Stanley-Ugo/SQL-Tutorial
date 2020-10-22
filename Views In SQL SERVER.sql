--Views in SQL SERVER--
Select * from tblEmployees
Select * from tblDepartment

--Creating a View--
Create View vWEmployeesByDepartment
as
Select Name, Gender, Salary, DepartmentName
from tblEmployees
Join tblDepartment
On tblEmployees.DepartmentId = tblDepartment.Id

--Executing the View--
Select * from vWEmployeesByDepartment