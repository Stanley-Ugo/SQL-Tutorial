--Creating the Contact table--
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

--Selecting the table--
Select * from Contacts

--Deleting from the table--
TRUNCATE Table Contacts

--Creating a stored procedure to get table data--
CREATE PROC spGetContact
AS
BEGIN 
	SELECT * FROM Contacts
END

--Creating a stored procedure to populate the table--
CREATE PROC spCreateContact
	@FirstName nvarchar(50), 
	@LastName nvarchar(50), 
	@Email nvarchar(100), 
	@Telephone nvarchar(20),
	@Mobile nvarchar(20), 
	@CompanyID int,
	@Address1 nvarchar(50), 
	@Address2 nvarchar(50), 
	@CityTown nvarchar(50), 
	@StateCounty nvarchar(50), 
	@PostCode nvarchar(10), 
	@Country nvarchar(100), 
	@CustomField1 nvarchar(50),
	@CustomField2 nvarchar(50),
	@CustomDate date
	AS
	BEGIN
		INSERT INTO Contacts (FirstName, LastName, Email, Telephone, Mobile,CompanyID,Address1,
		Address2, CityTown, StateCounty,PostCode, Country, CustomField1, CustomField2, CustomDate)
		VALUES(@FirstName, @LastName, @Email, @Telephone, @Mobile, @CompanyID, @Address1, @Address2, @CityTown,
				@StateCounty,@PostCode, @Country, @CustomField1, @CustomField2, @CustomDate)
	END