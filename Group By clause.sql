--Created tblEmployee table--

Create Table tblEmployee
(
ID int Identity(1,1) Primary Key,
Name nvarchar(20) NOT NULL,
Gender nvarchar(10) NOT NULL,
Salaray int,
City nvarchar(20)
)

Select * from tblEmployee

--Inserting data into the table--
Insert Into tblEmployee Values ('Russell','Male',8800,'London')

--Sum of salary in the Table function--
Select SUM(Salaray) from tblEmployee

--Min salary in the Table function--
Select MIN(Salaray) from tblEmployee

--Max salary in the Table function--
Select MAX(Salaray) from tblEmployee

--GROUP BY--
--Sum of totalSalary Grouped by City--
Select City, SUM(Salaray) as TotalSalary
from tblEmployee
Group by City

--Sum of totalSalary Grouped by City and Gender--
Select City, Gender ,SUM(Salaray) as TotalSalary
from tblEmployee
Group by City, Gender
Order by City

--Sum of totalSalary Grouped by City and Gender and Count of Employees--
Select City, Gender ,SUM(Salaray) as TotalSalary, COUNT(ID) as [Total Employees]
from tblEmployee
Group by City, Gender
Order by City

--Sum of totalSalary Filtered By Male Gender--
Select City, Gender ,SUM(Salaray) as TotalSalary, COUNT(ID) as [Total Employees]
from tblEmployee
Where Gender = 'Male'
Group by City, Gender
Order by City
--OR--
--Sum of totalSalary Filtered By Male Gende with Having clause--
Select Gender, City ,SUM(Salaray) as TotalSalary, COUNT(ID) as [Total Employees]
from tblEmployee
Group by Gender, City
Having Gender = 'Male'


	

