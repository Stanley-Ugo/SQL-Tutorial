CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Telephone] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[CompanyID] [int] NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[CityTown] [nvarchar](50) NULL,
	[StateCounty] [nvarchar](50) NULL,
	[PostCode] [nvarchar](10) NULL,
	[Country] [nvarchar](100) NULL,
	[CustomField1] [nvarchar](50) NULL,
	[CustomField2] [nvarchar](50) NULL,
	[CustomDate] [date] NULL
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Deleting the Table Data--
Truncate Table Contacts

--Viewing table rows--
Select * from Contacts

--Adding a stored procedure--
CREATE PROC spGetContact
AS
BEGIN 
	SELECT * FROM Contacts
END

--Editing the Contact Table By Batch Id--
ALTER PROCEDURE spUpdateContactByBatchId
	@FirstName nvarchar(50), 
	@LastName nvarchar(50), 
	@Email nvarchar(100), 
	@Telephone nvarchar(20) = NULL,
	@Mobile nvarchar(20), 
	@CompanyID int,
	@Address1 nvarchar(50) = NULL, 
	@Address2 nvarchar(50) = NULL, 
	@CityTown nvarchar(50) = NULL, 
	@StateCounty nvarchar(50) = NULL, 
	@PostCode nvarchar(10) = NULL, 
	@Country nvarchar(100) = NULL, 
	@CustomField1 nvarchar(50) = NULL,
	@CustomField2 nvarchar(50) = NULL,
	@CustomDate dateTime = NULL,
	@BatchID int
	AS
	BEGIN
		INSERT INTO Contacts (FirstName, LastName, Email, Telephone, Mobile,CompanyID,Address1,
		Address2, CityTown, StateCounty,PostCode, Country, CustomField1, CustomField2, CustomDate, BatchID)
		VALUES(@FirstName, @LastName, @Email, @Telephone, @Mobile, @CompanyID, @Address1, @Address2, @CityTown,
				@StateCounty,@PostCode, @Country, @CustomField1, @CustomField2, @CustomDate, @BatchID)

		UPDATE t1
		SET t1.DateModified = getdate()
		FROM dbo.ContactBatch AS t1
		INNER JOIN dbo.Contacts AS t2
		ON t1.BatchID = t2.BatchID
		WHERE t1.BatchID = @BatchID
	END







--Deleting by BatchId before inserting--
CREATE PROCEDURE spDeleteContactByBatchId
     @BatchID int
	 AS
	 BEGIN
	      SET NOCOUNT ON;
	      Delete from Contacts Where BatchID = @BatchID
	 END
