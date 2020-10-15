--Creating a Database--
CREATE Database Sample3

--Change Database Name--
Alter Database Sample3 Modify Name = Sample2

--Rename with stored procedure--
sp_renameDB 'Sample2','sample4'

--Deleting a database--
Drop database Sample4

--Dropping a Database thats in use
Alter Database Sample4 Set SINGLE_USER With Rollback Immediate