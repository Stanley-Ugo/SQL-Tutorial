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

--Populating a Table--
Insert into tblPerson (ID, Name, Email, GenderId) Values (7, 'Rich', 'r@r.com', 1)

--Adding a default value(3) if none is provided in the GenderId column--
ALTER TABLE tblPerson
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 3 FOR GENDERID

--Dropping a Constraint
ALTER TABLE tblPerson
DROP CONSTRAINT DF_tblPerson_GenderId

--Deleting a table row--
Delete from tblPerson where ID = 4

--Adding a check constraint for tblPerson table--
ALTER TABLE tblPerson
ADD CONSTRAINT CK_tblPerson_Age CHECK (AGE > 0 AND AGE < 150)
