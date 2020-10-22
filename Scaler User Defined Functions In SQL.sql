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

