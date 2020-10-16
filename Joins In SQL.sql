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