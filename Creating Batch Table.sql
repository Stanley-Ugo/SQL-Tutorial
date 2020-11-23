--Creating the Batch Table--
CREATE TABLE ContactBatch
(
BatchID int Primary key Identity(1,1),
DateCreated DateTime,
CreatedBy nvarchar(50),
DateModified DateTime,
[Status] nvarchar(20)
)

--Adding BatchID to Contact table--
ALTER TABLE Contacts
ADD BatchID int,
FOREIGN KEY (BatchID) REFERENCES ContactBatch(BatchID)

--Adding BatchName to ContactBatch table--
ALTER TABLE ContactBatch
ALTER COLUMN BatchName nvarchar(50)

--Alter a column in ContactBatch--
ALTER TABLE ContactBatch
ALTER COLUMN DateModified DATETIME2

--Selecting the Table BatchID--
Select * from ContactBatch

--Deleteing table data--
TRUNCATE Table ContactBatch

--Deleting Identity Column with references--
DELETE from ContactBatch
DBCC Checkident('Sample.dbo.ContactBatch', reseed, 0);

--Adding stored procedure for batchId that returns the identity column--
--stored procedure to return output parameter
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AddBatchReturnIDWithOutput]
      @DateCreated DateTime = NULL,
      @CreatedBy varchar(50),
      @DateModified DateTime = null,
      @Status varchar(20) = null,
	  @BatchName nvarchar(50) = null,
      @BatchID int output
AS
BEGIN
      SET NOCOUNT ON;
      INSERT INTO  ContactBatch (DateCreated, CreatedBy, DateModified, [Status], BatchName)
      VALUES (@DateCreated, @CreatedBy, @DateModified, @Status, @BatchName)
      SELECT @BatchID = SCOPE_IDENTITY()
END


--GET ALL stored procedure--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE spGetAllBatches
AS
BEGIN
     SET NOCOUNT ON;
	 SELECT * from ContactBatch
END
GO

--stored procedure to get contact by BatchId--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE spGetContactByBatchId
      @BatchID int
AS
BEGIN
     SET NOCOUNT ON;
	 SELECT * from Contacts
	 WHERE BatchID = @BatchID
END
GO

--Get all from ContactBatch Table--
Select * from ContactBatch

--Get All from Contact TAble--
Select * from Contacts

--Stored Procedure to Get COntact by BatchID--
CREATE PROCEDURE spGetContactByBatches
@BatchID int
AS
BEGIN
    SET NOCOUNT ON;
	SELECT * FROM Contacts WHERE BatchID = @BatchID
END
GO

--Delete contacts by BatchId--
Delete from Contacts Where BatchID = 2

--Delete row by batchId
Delete from ContactBatch where BatchID = 1

--Stored Procedure to delete from both Contacts & ContactsBatch by BatchId--
CREATE PROCEDURE spDeleteFileByBatchId
@BatchID int
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Contacts WHERE BatchID = @BatchID;
	DELETE FROM ContactBatch Where BatchID = @BatchID;
END
GO