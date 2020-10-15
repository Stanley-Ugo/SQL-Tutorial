--All About Select statememts--

--selects all from table--
SELECT * from tblPerson

--Selects Distinct features--
SELECT DISTINCT Country from tblPerson

--Seclects both Name and country distinct features--
SELECT DISTINCT Name, Country from tblPerson

--Select specific residents in an area--
Select * from tblPerson Where Country = 'London'

--Filterring with operators
Select * from tblPerson Where Age IN (20, 23, 29)
--OR--
Select * from tblPerson Where Age BETWEEN 20 AND 25

--the like operator--
Select * from tblPerson Where Country Like 'L%'

--WildCard Operators--
--Selects everyone with the valid format '%@%--
Select * from tblPerson Where Email NOT LIKE '%@%'

--Selects everyone with [MST] initials--
Select * from tblPerson Where Name Like '[MST]%'

--Selects everyone without [MST] initials--
Select * from tblPerson Where Name Like '[^MST]%'

--selects all living the London or Lagos with age above 21--
Select * from tblPerson Where (Country = 'London' or Country = 'Lagos') AND Age > 21

--ORDER BY--
--Sorting the results by Name--
Select * from tblPerson order by Name

--Sorting the results by Name DESCending order--
Select * from tblPerson order by Name DESC

--Sorting the results by Multiple colmn--
Select * from tblPerson order by Name DESC, Age ASC

--Selecting a specified number of rows--
Select Top 6 * from tblPerson
--OR--
--Select by Percentage
Select top 50 Percent * from tblPerson
--OR--
--finding the elders person on the table--
Select top 1 * from tblPerson Order by Age DESC

