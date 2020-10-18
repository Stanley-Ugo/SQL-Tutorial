--Replace Null In SQL SERVER--
Select * from tblEmployees1

--Replacing Null with the ISNULL() Function--
Select     E.Name as Employee, ISNULL(M.Name, 'No  Manager') as Manager
from       tblEmployees1 E
Left Join  tblEmployees1 M
On         E.ManagerId = M.EmployeeId

--Replacing Null with the COALESCE() Function--
Select     E.Name as Employee, COALESCE(M.Name, 'No  Manager') as Manager
from       tblEmployees1 E
Left Join  tblEmployees1 M
On         E.ManagerId = M.EmployeeId

--Replacing Null with the CASE EXPRESSION Function--
Select     E.Name as Employee, CASE WHEN M.Name IS NULL THEN 'No Manager' ELSE M.Name END as Manager
from       tblEmployees1 E
Left Join  tblEmployees1 M
On         E.ManagerId = M.EmployeeId