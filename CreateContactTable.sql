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

