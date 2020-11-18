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


--Selecting the Table BatchID--
Select * from ContactBatch

--Adding stored procedure for batchId that returns the identity column--
--stored procedure to return output parameter
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBatchReturnIDWithOutput]
      @DateCreated Date = NULL,
      @CreatedBy varchar(50),
      @DateModified date = null,
      @Status varchar(20) = null,
      @BatchID int output
AS
BEGIN
      SET NOCOUNT ON;
      INSERT INTO  ContactBatch (DateCreated, CreatedBy, DateModified, [Status])
      VALUES (@DateCreated, @CreatedBy, @DateModified, @Status)
      SET @BatchID = SCOPE_IDENTITY()
      RETURN  @BatchID
END

