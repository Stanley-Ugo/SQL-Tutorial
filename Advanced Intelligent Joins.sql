--Advanced Intelligent Joins--
Select * from tblEmployees
Select * from tblDepartment

--Getting only the None Matching Rows from the Left--
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