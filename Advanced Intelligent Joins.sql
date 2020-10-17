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
