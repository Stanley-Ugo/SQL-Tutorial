--Creating Sample Employees table--
Create Table tblSampleEmployee
(
Id int Identity(1,1) NOT NULL,
Name nvarchar NOT NULL,
Gender nvarchar NOT NULL,
)

--Executing the sample table--
Select * from tblSampleEmployee

--Creating a stored procedure--
Create Procedure spGetSampleEmployee
as
Begin
    Select * from tblSampleEmployee
End

--Ececuting the stored procedure--
Execute spGetSampleEmployee