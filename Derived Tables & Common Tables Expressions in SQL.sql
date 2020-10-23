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

--*************************************************--
--Common Table Expressions(CTE)--
With EmployeeCount (DepartmentId, TotalEmployees)
as
(
     Select DeptName, COUNT(*) as TotalEmployees
	 from tblEmployee
	 group by DepartmentId
)

Select DepartmentName, TotalEmployees
from tblDepartment
Join EmployeeCount
on tblDepartment.Id = EmployeeCount.DepartmentId
order by TotalEmployees

--Creating Multiple CTE Using single with clause--
With EmployeesCountBy_Payroll_IT_Dept(DepartmentName, Total)
as
(
      Select DeptName, COUNT(Id) as TotalEmloyees
	  from tblEmployees
	  JOIN tblDepartment
	  On tblEmployees.DepartmentId = tblDepartment.Id
	  Where DeptName IN ('Payroll','IT')
	  group by DeptName
),
EmployeeCountBy_HR_Admin_Dept(DepartmentName, Total)
as
(
      Select DeptName, COUNT(Id) as TotalEmloyees
	  from tblEmployees
	  JOIN tblDepartment
	  On tblEmployees.DepartmentId = tblDepartment.Id
	  Where DeptName IN ('HR','Admin')
	  group by DeptName
)
Select * from EmployeeCountBy_HR_Admin_Dept
UNION
Select * from EmployeesCountBy_Payroll_IT_Dept


--**********************************************--
--Updateable CTE on one base table--
With Employees_Name_gender
as
(
     Select Id, Name, Gender from tblEmployee
)
Update Employees_Name_Gender set Gender = 'Female' where Id = 1

Select * from tblEmployees

--Updateable CTEs On two based table--
With EmployeesByDepartment
as
(
     Select Id, Name, Gender, DepartmentName
	 from tblEmployees
	 Join tblDepartment
	 On tblDepartment.Id = tblEmployees.DepartmentId
)
Update EmployeesByDepartment set Gender = 'Male' where Id = 1

Select * from EmployeesByDepartment



--*********************************************--
--Recursive CTEs--
With
EmployeeCTE (EmployeeId, Name, ManagerId, [Level])
as
(
     Select EmployeeId, Name, ManagerId, 1
	 from tblEmployee
	 where ManagerId is NULL

	 Union all

	 Select tblEmployee.EmployeeId, tblEmployee.Name,
	 tblEmployee.ManagerId, EmployeeCTE.[Level] + 1
	 from tblEmployee
	 JOIN EmployeeCTE
	 on tblEmployee.ManagerId = EmployeeCTE.EmployeeId
)
Select EmpCTE.Name as Employee, ISNULL(MgrCTE.Name, 'Super boss') as Manager,
EmpCTE.[Level]
from EmployeeCTE EmpCTE
Left Join EmployeeCTE MgrCTE
On EmpCTE.ManagerId = MgrCTE.EmployeeId

