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

