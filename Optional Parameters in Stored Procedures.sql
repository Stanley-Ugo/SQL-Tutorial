--Optional Parameters in SQL Server Stored Procedures--
--Create an Optional parameter Stored Procedure--
Create Proc spSearchEmployee
@Name nvarchar(50) = NULL,
@Email nvarchar(50) = NULL,
@Gender nvarchar(10) = NULL,
@Age int = NULL
as
BEGIN
    Select * from tblEmployee
	Where (Name = @Name OR @Name = NULL) And
	      (Gender = @Gender OR @Gender = NULL) And
		  (Email = @Email OR @Email = Null) And
		  (Age = @Age OR @Age = Null)
End

--EXecuting the Stored Procedure--
Execute spSearchEmployee