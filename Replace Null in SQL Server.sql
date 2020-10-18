--Replace Null In SQL SERVER--
Select * from tblEmployees1

--Replacing Null with thw ISNULL() Function--
Select     E.Name as Employee, ISNULL(M.Name, 'No  Manager') as Manager
from       tblEmployees1 E
Left Join  tblEmployees1 M
On         E.ManagerId = M.EmployeeId