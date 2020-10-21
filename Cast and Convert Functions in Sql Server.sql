--CAST & CONVERT Functions in SQL SERVER
Select * from tblEmployeesDate

--Casting DateOfBirth to nvarchar--
Select Id, Name, DateOfBirth, CAST(DateOfBirth as nvarchar) as ConvertedDOB from tblEmployeesDate

--Converting DateOfBirth to nvarchar--
Select Id, Name, DateOfBirth, CONVERT(nvarchar, DateOfBirth) as ConvertedDOB from tblEmployeesDate

--Concatenate ID(int)  and Name(nvarchar) with the CAST function--
Select Id, Name, Name + ' - ' + CAST(Id as nvarchar) as [Name - Id] from tblEmployeesDate
