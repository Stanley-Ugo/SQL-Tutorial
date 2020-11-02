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
Alter procedure spGetEmployee
@Id int
as
Begin
    Select Id, Name, Gender, DateOfBirth, EmployeeType, AnnualSalary, HourlyPay, HoursWorked
	from tblEmployeeWCF
	where Id = @Id
End

--Executing the Stored Procedure--
Execute spGetEmployee '1'

--This Clears table data incase of Mistakes to be reseeded--
TRUNCATE Table tblEmployeeWCF
--OR--
DELETE from tblEmployeeWCF

--Creating a spSaveEmpmployeeWCF store procedure--
Alter procedure spSaveEmployeeWCF
@Id int,
@Name nvarchar(50),
@Gender nvarchar(50),
@DateOfBirth DateTime,
@EmployeeType int,
@AnnualSalary int = NULL,
@HourlyPay int = NULL,
@HoursWorked int = NULL
as
Begin
    Insert into tblEMployeeWCF
	Values (@Id, @Name, @Gender, @DateOfBirth, @EmployeeType, @AnnualSalary, @HourlyPay, @HoursWorked)
End

-