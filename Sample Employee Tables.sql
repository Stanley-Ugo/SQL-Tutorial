--Creating Sample Employees table--
Create Table tblSampleEmployee
(
Id int Identity(1,1) NOT NULL,
Name nvarchar NOT NULL,
Gender nvarchar NOT NULL,
)

--Executing the sample table--
Select * from tblSampleEmployee