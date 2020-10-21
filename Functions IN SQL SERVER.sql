--Functions In SQLSERVER--
Select * from tblPerson

--Using the ASCII FUNCTION FOR ASCII CODES--
Select ASCII('B')

--Selecting the Charindex and Lenth of a character function--
Select SUBSTRING(Email, CHARINDEX('@',Email) + 1,
LEN(Email) - CHARINDEX('@',Email)) as EmailDomain,
COUNT(Email) as Total
from tblPerson
Group by SUBSTRING(Email, CHARINDEX('@',Email) + 1,
LEN(Email) - CHARINDEX('@',Email))

--REPLICATE Function--
Select REPLICATE('Pragim', 3) as PragimTech

--Space function--
Select Space(5) as space

--PATINDEX() Function--
Select Email, PATINDEX('%@m.com', Email) as FirstOccurence
from  tblPerson
Where PATINDEX('%m.com', Email) > 0

--Replace() Function--
Select Email, REPLACE(Email, '.com','.net') as ConvertedEmail
from tblPerson

--Stuff() Function--
Select Name, Email, Country,
       STUFF(Email,2, 3, '*****') as StuffedEmail
From tblPerson