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

--***************************************************--
--UPDATEABLE VIEWS IN SQL Server--
--Updates a table row
Update vWEmployeesByDepartment
Set Name = 'Mikey' Where Id = 2

--Deletes a Table row--
Delete from vWEmployeesByDepartment Where Id = 2

--Inserts a table row with a view--
Insert into vWEmployeesByDepartment values (2, 'Mikey','Male',2)

--Creating a View which returns the result of the JOIN of two tables--
Create view vwEmployeeDetailsByDepartment
as
Select Name, Salary, Gender, DepartmentName
from tblEmployees
JOIN tblDepartment
ON tblEmployees.DepartmentId = tblDepartment.Id

--Executing the View--
Select * from vwEmployeeDetailsByDepartment