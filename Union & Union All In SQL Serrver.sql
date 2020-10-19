--Union & Union All In SQL SERVER--
--Indian Customers Table--
Create Table tblIndiaCustomers
(
Id int identity(1,1) Primary Key,
Name nvarchar(20) NOT NULL,
Email nvarchar(20) NOT NULL
)

--UK Customers Table--
Create Table tblUKCustomers
(
Id int identity(1,1) Primary Key,
Name nvarchar(20) NOT NULL,
Email nvarchar(20) NOT NULL
)

Select * from tblIndiaCustomers

--Seeding Data to tblIndiaCustomers Table--
Insert into tblIndiaCustomers Values ('Sam','S@S.com')

Select * from tblUKCustomers

--Seeding Data to tblUKCustomers Table--
Insert into tblUKCustomers Values ('Sam','S@S.com')

--Union All combines result from both tables
Select * from tblIndiaCustomers
UNION All
Select * from tblUKCustomers