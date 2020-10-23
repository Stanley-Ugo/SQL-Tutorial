--DML Triggers in SQL SERVER--
--Creating the Employee Audit table--
CREATE Table tblEmployeeAudit
(id int identity(1,1) Primary Key,
AuditData nvarchar(20)
)

Select * from tblEmployee
Select * from tblEmployeeAudit

--Creating TRIGGER for insert in tblEmployeeAudit--
CREATE TRIGGER tr_tblEmployee_ForInsert
ON tblEmployee
FOR INSERT
AS
BEGIN
    Declare @Id int
	Select @Id = Id from inserted

	insert into tblEmployeeAudit
	Values ('New employee with Id = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + Cast(Getdate()))
END

--Inserting Into tblEmployee to trigger the TRIGGER function--
Insert into tblEmployee Values ('Jimmy','Male',1800,'Johannasburg')

--Creating TRIGGER for Delete in tblEmployeeAudit--
CREATE TRIGGER tr_tblEmployee_ForDelete
ON tblEmployee
FOR DELETE
AS
BEGIN
    Declare @Id int
	Select @Id = Id from deleted

	insert into tblEmployeeAudit
	Values ('An Existing employee with Id = ' + Cast(@Id as nvarchar(5)) + ' was deleted at ' + Cast(Getdate() as nvarchar(20)))
END

--Deleting from tblEmployee to trigger the Delete TRIGGER function--
Delete from tblEmployee where Id = 2