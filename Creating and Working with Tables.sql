--Creating Tables--
Use [Sample]
Go

Create Table tblGender
(
ID int NOT NULL Primary Key,
Gender nvarchar(50) NOT NULL
)

--Adding a Foreign key Constraint
Alter table tblPerson add constraint tblPerson_GenderID_FK
Foreign Key (GenderId) references tblGender (ID)