--RE-RUNNABLE SQL SEREVR Scripts--
--Creating a table twice in the same database is none re-runnable--

--Making it re-runnable--
Use [Sample]
If not exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tblEmployee')
Begin
    Create table tblEmployee
    (
       Id int identity primary Key,
       Name nvarchar(100),
       Gender nvarchar(10),
       DateOfBirth DateTime
    )
	Print 'Table tblEmployee Successfully crreated'
End
Else
Begin
    Print 'Table tblEmployee already Exist'
End


--*************************************************************--
--Altering a Column of a table in SQL Server--
ALTER TABLE tblEmployee
ALTER COLUMN Slary int