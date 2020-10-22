--Scalar User Defined Functions--
--Creating a function that calculates Age--
CREATE FUNCTION CalculateAge(@DOB Date)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT
	SET @Age = DATEDIFF(Year, @DOB, GETDATE()) - 
	              CASE
				    WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR
					     (MONTH(@DOB) = MONTH(GETDATE()) AND  DAY(@DOB) > DAY(GETDATE()))
				    THEN 1
					ELSE 0
				  END
	RETURN @Age
END

