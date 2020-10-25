--Handling Errors In ADO.NET Application--

--How to spot open transactions--
DBCC OpenTran

--Killing a Process in SQL Syntax-
Kill ProcessId

--Except operators in SQL--
Select Id, Name, Gender from TableA
EXCEPT
Select Id, Name, Gender from TableB -- Returns rows that aren't on both tables

--Except Operator on the same table using the where clause--
Select Id, Name, Gender, Salary  from tblEmployee Where Salary >= 50000
Except
Select Id, Name, Gender, Salary  from tblEmployee Where Salary >= 60000