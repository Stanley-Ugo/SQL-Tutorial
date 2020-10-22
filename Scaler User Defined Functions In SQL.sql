--Scalar User Defined Functions--
--Creating a function that calculates Age--
CREATE FUNCTION CalculateAge(@DOB Date)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT
	SET @Age = DATEDIFF(Year, @DOB, GETDATE()) - 
	              CASE
				    WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR
					     (MONTH(@DOB) = MONTH(GETDATE()) AND  DAY(@DOB) > DAY(GETDATE()))
				    THEN 1
					ELSE 0
				  END
	RETURN @Age
END

--Executing the CalculateAge() function--
Select dbo.CalculateAge('11/10/1992')

Select * from tblEmployeesDate

--Calculate the age with CalculateAge function for tblEmployeesDate table--
Select Id, Name, dbo.CalculateAge(DateOfBirth) as Age from tblEmployeesDate

--Calculate the age with CalculateAge function where Age > 30 for tblEmployeesDate table--
Select Id, Name, dbo.CalculateAge(DateOfBirth) as Age from tblEmployeesDate
Where dbo.CalculateAge(DateOfBirth) > 30


--*************************************************--
--INLINE TABLE VALUED FUNCTIONs--
--Creating the table  valued function fn_EmployeesByGender--
CREATE FUNCTION fn_EmployeesByGender(@Gender nvarchar(10))
RETURNS TABLE
AS
RETURN (Select Id, Name, DateOfBirth, Gender, DepartmentId
        from tblEmployeesGenderAndDate
		Where Gender = @Gender)

--To Call the function--
Select * from fn_EmployeesByGender('Male')

--To Call the function with a where clause--
Select * from fn_EmployeesByGender('Male') where Name = 'Sam'

--Table returned can be used in JOINS--
Select Name, Gender, DepartmentName
from   fn_EmployeesByGender('Male') E
JOIN   tblDepartment D ON D.Id = E.DepartmentId

--Sample table--
Create Table tblEmployeesGenderAndDate
(Id Int Identity(1,1) Primary Key,
Name nvarchar(20) NOT NULL,
DateOfBirth Date NOT NULL,
Gender nvarchar(20),
DepartmentId int
)

--Seeding the table--
Insert into tblEmployeesGenderAndDate Values ('Todd','1980-12-30 00:00:00.000','Male',1)

Select * from tblEmployeesGenderAndDate


--***************************************************--
--Multi-Statement Valued functions--
Create Function fn_MSTVF_GetEmployees()
Returns @Table Table (Id int, Name nvarchar(20), DOB Date)
as
Begin
    Insert Into @Table
	Select Id, Name, CAST(DateOfBirth as Date) from tblEmployeesDate

	Return
End

--Calling the function--
Select * from fn_MSTVF_GetEmployees()