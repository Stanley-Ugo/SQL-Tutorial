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