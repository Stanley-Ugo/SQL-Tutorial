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
