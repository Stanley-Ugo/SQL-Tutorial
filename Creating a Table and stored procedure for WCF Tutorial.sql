--Creating the Sample tblEmployeeWCF Table--
Create Table tblEmployeeWCF
(
Id int,
Name nvarchar(50),
Gender nvarchar(50),
DateOfBirth datetime
)

--Inserting Values into tblEmployeeWCF Table--
Insert into tblEmployeeWCF Values (1, 'Mark', 'Male', '10/10/1980')
Insert into tblEmployeeWCF Values (2, 'Mary', 'Female', '11/10/1981')
Insert into tblEmployeeWCF Values (3, 'John', 'Male', '8/10/1979')

--Creating a GetEmployeeWCF Stored procedure--
Create procedure spGetEmployee
@Id int
as
Begin
    Select Id, Name, Gender, DateOfBirth
	from tblEmployeeWCF
	where Id = @Id
End