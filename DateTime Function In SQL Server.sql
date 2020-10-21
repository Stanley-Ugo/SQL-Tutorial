--Date Time Functions In SQL Server--
--The ISDATE Function--
Select ISDATE('Pragim') -- returns 0
Select ISDATE(GETDATE()) -- returns 1
Select ISDATE('2020-10-21 21:02:04.167') -- returns 1
Select ISDATE('2020-10-21 21:02:04.1676584') -- returns 0

--The Day Function--
Select DAY(GETDATE()) -- returns the current date day number of the Month
Select DAY('10/31/2020') -- returns 31

--The Month Function--
Select Month(GETDATE()) -- returns the current date Month number of the Month
Select Month('10/31/2020') -- returns 10

--The Year Function--
Select Year(GETDATE()) -- returns the current date Year number of the Month
Select Year('10/31/2020') -- returns 2020

--The DateName Function--
Select DATENAME(Day, '2020-10-21 21:02:04.167') -- returns 21
Select DATENAME(WEEKDAY, '2020-10-21 21:02:04.167') -- returns Wednesday
Select DATENAME(MONTH, '2020-10-21 21:02:04.167') -- returns October

--Creating Sample Table for DateTime Queries--
Create Table tblEmployeesDate
(
Id int Identity(1,1) Primary Key,
Name nvarchar(20) NOT NULL,
DateOfBirth DateTime NOT NULL
)

--Seeding Data to tblEmployeesDate--
Insert into tblEmployeesDate Values ('Sara','1979-11-29 12:59:30.960')

Select * from tblEmployeesDate

--Selecting the colums from tblEmployeesDate  as aliases--
Select Name, DateOfBirth, DateName(WEEKDAY, DateOfBirth) as [Day],
       Month(DateOfBirth) as MonthNumber,
	   DateName(MONTH, DateOfBirth) as [MonthName],
	   Year(DateOfBirth) as [Year]
from tblEmployeesDate

--The DatePart Function--
Select DATEPART(WEEKDAY, '2020-10-21 21:02:04.167') -- returns 4
Select DATENAME(WEEKDAY, '2020-10-21 21:02:04.167') -- returns Wednesday

--The DateAdd Function--
Select DATEADD(DAY, 20, '2012-08-30 19:45:31.793') --  Returns 2012-09-19 19:45:31.793
Select DATEADD(DAY, -20, '2012-08-30 19:45:31.793') -- Returns 2012-08-10 19:45:31.793

