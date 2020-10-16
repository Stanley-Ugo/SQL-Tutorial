--Joins In SQL SERVER--
--Creating the Department table--
Create Table tblDepartment
(
Id int Identity(1,1) NOT NULL Primary Key,
DepartmentName nvarchar(20) NOT NULL,
Location nvarchar(20) NOT NULL,
DepartmentHead nvarchar(20) NOT NULL
)

--Seeding the Department data--
Insert Into tblDepartment Values ('Other Departments','Sydney','Cindarella')

Create Table tblEmployees
(
ID int Identity(1,1) NOT NULL Primary Key,
Name nvarchar(20) NOT NULL,
Gender nvarchar(20) NOT NULL,
Salary int NOT NULL,
DepartmentId int NUll
)

--Adding a Fk to reference tblDepartment table--
Alter table tblEmployees add constraint tblEmployees_DepartmentId_FK
Foreign Key (DepartmentId) references tblDepartment (ID)

--Seeding tblEmployees--
Insert Into tblEmployees Values ('Russell', 'Male',8800, Null)

Select * from tblEmployees
Select * from tblDepartment

--Inner Join for DepartmentName--
Select Name, Gender, Salary, DepartmentName
from tblEmployees
INNER JOIN tblDepartment
ON tblEmployees.DepartmentId = tblDepartment.Id

--Left Join for DepartmentName--
Select Name, Gender, Salary, DepartmentName
from tblEmployees
LEFT OUTER JOIN tblDepartment
ON tblEmployees.DepartmentId = tblDepartment.Id

--Right Join for DepartmentName--
Select Name, Gender, Salary, DepartmentName
from tblEmployees
RIGHT OUTER JOIN tblDepartment
ON tblEmployees.DepartmentId = tblDepartment.Id

--Full Join for DepartmentName--
Select Name, Gender, Salary, DepartmentName
from tblEmployees
FULL OUTER JOIN tblDepartment
ON tblEmployees.DepartmentId = tblDepartment.Id

--Cross Join for DepartmentName--
Select Name, Gender, Salary, DepartmentName
from tblEmployees
CROSS JOIN tblDepartment