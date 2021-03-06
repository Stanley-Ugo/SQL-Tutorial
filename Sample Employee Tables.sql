--Creating Sample Employees table--
Create Table tblSampleEmployee
(
Id int Identity(1,1) NOT NULL,
Name nvarchar NOT NULL,
Gender nvarchar NOT NULL,
)

--Executing the sample table--
Select * from tblSampleEmployee

--Inserting Data into tblSampleEmployee--
Insert into tblSampleEmployee Values ('Mark','Male')

--Creating a stored procedure--
Create Procedure spGetSampleEmployee
as
Begin
    Select * from tblSampleEmployee
End

--Ececuting the stored procedure--
Execute spGetSampleEmployee

--*******************************************************--
--Creating Sample Department table--
Create Table tblSampleDepartment
(
DepartmentId int Identity(1,1) NOT NULL,
Name nvarchar NOT NULL,
)

--Executing the sample table tblSampleDepatment--
Select * from tblSampleDepartment

--Inserting Data into tblSampleDepartment--
Insert into tblSampleDepartment Values ('1','HR')

--Creating a stored procedure--
Create Procedure spGetSampleDepartment
as
Begin
    Select * from tblSampleDepartment
End

--Ececuting the stored procedure--
Execute spGetSampleEmployee