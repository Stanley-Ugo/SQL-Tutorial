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

--Creating TRIGGER for UPDATE in tblEmployeeAudit--
CREATE TRIGGER tr_tblEmployee_ForUpdate
ON tblEmployee
FOR UPDATE
AS
BEGIN
    Declare @Id int
	Declare @OldName nvarchar(20), @NewName nvarchar(20)
	Declare @OldSalary int, @NewSalary int
	Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
	Declare @OldDeptId int, @NewDeptId int

	Declare @AuditString nvarchar(1000)

	Select *
	into #TempTable
	from inserted

	While(Exists(Select Id from #TempTable))
	Begin
	    Set @AuditString = ''

		Select Top 1 @Id = Id, @NewName = Name,
		@NewGender = Gender, @NewSalary = Salary,
		@NewDeptId = DepartmentId
		from #TempTable

		Select @OldName = Name, @OldGender = Gender,
		@OldSalary = Salary, @OldDeptId = DepartmentId
		from deleted where Id = @Id

		Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + 'changed'
		if(@OldName <> @NewName)
		      Set @AuditString = @AuditString + ' Name from ' + @OldName + ' to ' + @NewName

		if(@OldName <> @NewName)
		      Set @AuditString = @AuditString + ' Gender from ' + @OldGender + ' to ' + @NewGender

		if(@OldName <> @NewName)
		      Set @AuditString = @AuditString + ' Salary from ' + Cast(@OldSalary as nvarchar(20)) + ' to ' + @NewSalary

		if(@OldName <> @NewName)
		      Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(4)) + ' to ' + @NewDeptId

	    Insert into tblEmployeeAudit Values (@AuditString)

		Delete from #TempTable where Id = @Id

	END
END

--Updating from tblEmployee to trigger the Update TRIGGER function--
Update tblEmployee set Name = 'Todd', Salaray = 2000, Gender = 'Female' where Id = 4
