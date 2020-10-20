--Stored Procedures In SQL Server--
Select * from tblEmployees

--Creating a stored procedure 'spGetEmployees' for getting Names,Gender from tblEmployees Table--
CREATE PROCEDURE spGetEmployees
AS
BEGIN
     Select Name, Gender from tblEmployees
END

--Executing the Stored Procedure
spGetEmployees

--Creating stored procedured with Gender & Department parameters
Create Proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as
Begin
    Select Name, Gender, DepartmentId from tblEmployees Where Gender = @Gender
	and DepartmentId = @DepartmentId
End
