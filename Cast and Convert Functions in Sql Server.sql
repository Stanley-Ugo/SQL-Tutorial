--CAST & CONVERT Functions in SQL SERVER
Select * from tblEmployeesDate

--Casting DateOfBirth to nvarchar--
Select Id, Name, DateOfBirth, CAST(DateOfBirth as nvarchar) as ConvertedDOB from tblEmployeesDate

--Converting DateOfBirth to nvarchar--
Select Id, Name, DateOfBirth, CONVERT(nvarchar, DateOfBirth) as ConvertedDOB from tblEmployeesDate

--Concatenate ID(int)  and Name(nvarchar) with the CAST function--
Select Id, Name, Name + ' - ' + CAST(Id as nvarchar) as [Name - Id] from tblEmployeesDate


--MATHEMATICAL FUNCTION IN SQLServer--
--ABSOLUTE Value--
Select ABS(-105.1) -- returns the Absolute value 105.1 without the -negative sign
--CEILING Function--
Select CEILING(15.2) -- returns 16
Select CEILING(-15.2) --returns -15
--FLOOR--
Select FLOOR(15.2) -- returns 15
select FLOOR(-15.2) -- returns -16
--POWER--
Select POWER(2,3) -- returns 8
--SQUARE--
Select SQUARE(9) -- returns 81
--SQRT--
Select SQRT(9) -- returns the square root of 3
--RAND--
Select RAND() -- returns random numbers between 1 and 0
Select RAND(1) -- returns the same number between 1 and 0
Select FLOOR(RAND() * 100) -- returns random whole number from 1 to 100
--Ten random Numbers between 1 - 100--
Declare @Counter int
Set @Counter = 1
While (@Counter <= 10)
Begin
    Print FLOOR(RAND() * 100)
	Set @Counter = @Counter + 1
End
