--Views in SQL SERVER--
Select * from tblEmployees
Select * from tblDepartment

--Creating a View---
Create View vWEmployeesByDepartment
as
Select Name, Gender, Salary, DepartmentName
from tblEmployees
Join tblDepartment
On tblEmployees.DepartmentId = tblDepartment.Id

--Executing the View--
Select * from vWEmployeesByDepartment

--***************************************************--
--UPDATEABLE VIEWS IN SQL Server--
--Updates a table row
Update vWEmployeesByDepartment
Set Name = 'Mikey' Where Id = 2

--Deletes a Table row--
Delete from vWEmployeesByDepartment Where Id = 2

--Inserts a table row with a view--
Insert into vWEmployeesByDepartment values (2, 'Mikey','Male',2)

--Creating a View which returns the result of the JOIN of two tables--
Create view vwEmployeeDetailsByDepartment
as
Select Name, Salary, Gender, DepartmentName
from tblEmployees
JOIN tblDepartment
ON tblEmployees.DepartmentId = tblDepartment.Id

--Executing the View--
Select * from vwEmployeeDetailsByDepartment

--*************************************************--
--INDEXED VIEWS IN SQL Server--
--Creating two sample tables--
Create Table tblProduct
(
ProductId int Identity(1,1) Primary Key,
Name nvarchar(20) NOT NULL,
UnitPrice int NOT NULL
)

Create Table tblProductSales
(
ProductId int,
QuantitySold int
)

Select * from tblProduct
Select * from tblProductSales

--Seeding Data to both Tables--
Insert into tblProduct Values ('Clips', 10)

Insert into tblProductSales Values (1,14)

--Creating a View that Sums the TotalSalesByProduct--
Create view vWTotalSalesByProduct
With Schemabinding
as
Select Name,
SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales,
COUNT_BIG(*) as TotalTransactions
from dbo.tblProductSales
Join dbo.tblProduct
On dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
Group by Name

--Executing the vWTotalSalesByProduct View--
Select * from vWTotalSalesByProduct

--Creating a clustered index of the View--
Create Unique Clustered Index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)

--*********************************************--
--VIEW LIMITATIONS--
--Not possible to pass parameters to Views--
Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from tblEmployees
Where Gender = @Gender    --This returns an Error.

--Instead do this with an Inline table function for parameterized views--
Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return
(Select Id, Name, Gender, DepartmentId
from tblEmployees where Gender = @Gender)

--Calling the inline table function--
Select * from dbo.fnEmployeeDetails('Male')
