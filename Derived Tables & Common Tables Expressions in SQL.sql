--Derived Tables And common Tables Expresssions in SQL Server--
--Using Derived Tables--
Select DeptName, TotalEmployee
from
    (
	    Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
		from tblEmployee
		Join tblDepartment
		On tblEmployee.DepartmentId = tblDepartment.DepartmentId
		group by DepartmentName, DepartmentId
	)
as EmployeeCount
Where TotalEmployees >= 2

--Using CTE--
With EmployeeCount(DeptName, DepartmentId, TotalEmployees)
as
    (
        Select DeptName, DepartmentId, COUNT(*) as TotalEmployees
		from tblEmployee
		Join tblDepartment
		On tblEmployee.DepartmentId = tblDepartment.DepartmentId
		group by DepartmentName, DepartmentId
	)
Select DeptName, TotalEmployees
from EmployeeCount
Where TotalEmployees >= 2