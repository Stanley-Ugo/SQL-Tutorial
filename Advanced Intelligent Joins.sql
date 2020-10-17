--Advanced Intelligent Joins--
Select * from tblEmployees
Select * from tblDepartment

--Getting only the None Matching Rows from the Left Table--
Select Name, Gender, Salary, DepartmentName
from tblEmployees
Left Join tblDepartment
On tblEmployees.DepartmentId = tblDepartment.Id
Where tblEmployees.DepartmentId Is NULL
--OR--
Select Name, Gender, Salary, DepartmentName
from tblEmployees
Left Join tblDepartment
On tblEmployees.DepartmentId = tblDepartment.Id
Where tblDepartment.Id Is NULL

--Getting only the None matching rows from the right Table-
Select Name, Gender, Salary, DepartmentName
from tblEmployees
Right Join tblDepartment
On tblEmployees.DepartmentId = tblDepartment.Id
Where tblEmployees.DepartmentId Is NULL

--Getting only the None matching rows from the right & Left Table-
Select Name, Gender, Salary, DepartmentName
from tblEmployees
Full Join tblDepartment
On tblEmployees.DepartmentId = tblDepartment.Id
Where tblEmployees.DepartmentId Is NULL
Or tblDepartment.Id is NULL


--Self JOINS in SQL SERVER--
--Creating Sample Table--
Create Table tblEmployees1
(
EmployeeId int identity(1,1) NOT NULL Primary Key,
Name nvarchar(20) NOT NULL,
ManagerId int NULL
)

--Seeding Data Into tblEmployees1--
Insert into tblEmployees1 Values ('Sam', 1)

Select * from tblEmployees1

--Self Join--
--Left Self JOIN
Select   E.Name as Employee, M.Name as Manager
From tblEmployees1 E
Left join tblEmployees1 M
On         E.ManagerId = M.EmployeeId