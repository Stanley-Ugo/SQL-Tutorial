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