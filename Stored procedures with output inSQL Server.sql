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

--Checking for variable NUlls--
Declare @TotalCount int
Execute spGetEmployeeCountByGender 'Male', @TotalCount out
if(@TotalCount is null)
   Print '@TotalCount is Null'
else
   Print '@TotalCount is not Null'

Print @TotalCount

--Specifying the parameters--
Declare @TotalCount int
Execute spGetEmployeeCountByGender @EmployeeCount = @TotalCount output,@Gender = 'Male'
Print @TotalCount

--Getting information from any object
--checking details text--
sp_help spGetEmployeeCountByGender
--OR--
sp_help tblEmployees
--Checking stored procedures table dependencies--
sp_depends tblEmployees

--Return Values Stored Procedures--
--Creating the return stored procedure
Create Proc spGetTotalCount2
as
Begin
   return (Select COUNT(ID) from tblEmployees)
End

--Executing the returned stored procedure--
Declare @TotalEmp int
Execute @TotalEmp = spGetTotalCount2
Print @TotalEmp