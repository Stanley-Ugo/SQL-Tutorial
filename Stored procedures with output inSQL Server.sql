--Stored Procedure with output--
Select * from tblEmployees

--Creating stored procedure for getting Employee count by Gender--
Create Procedure spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as
Begin
    Select @EmployeeCount = COUNT(ID) from tblEmployees where Gender = @Gender
End

--Executing the spGetEmployeeCountByGender stored procedure--
--First we create a variable for holding the output--
Declare @TotalCount int
Execute spGetEmployeeCountByGender 'Male', @TotalCount output
Print @TotalCount

