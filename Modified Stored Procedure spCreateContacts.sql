USE [Sample]
GO
/****** Object:  StoredProcedure [dbo].[spCreateContact]    Script Date: 2020-11-14 3:44:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[spCreateContact]
	@FirstName nvarchar(50), 
	@LastName nvarchar(50), 
	@Email nvarchar(100), 
	@Telephone nvarchar(20),
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
	@CustomDate date = NULL
	AS
	BEGIN
		INSERT INTO Contacts (FirstName, LastName, Email, Telephone, Mobile,CompanyID,Address1,
		Address2, CityTown, StateCounty,PostCode, Country, CustomField1, CustomField2, CustomDate)
		VALUES(@FirstName, @LastName, @Email, @Telephone, @Mobile, @CompanyID, @Address1, @Address2, @CityTown,
				@StateCounty,@PostCode, @Country, @CustomField1, @CustomField2, @CustomDate)
	END

	EXECUTE spGetContact