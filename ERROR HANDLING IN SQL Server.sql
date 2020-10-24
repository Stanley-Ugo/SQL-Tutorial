--ERROR HANDLING IN SQL SERVER--
Insert into tblProduct Values (2, 'Mobile Phones', 1500, 100)
--Error checking immediately after statement execution-
if (@@ERROR <> 0)
   Print 'Error Occured'
Else
   Print 'No Errors'

--Using a try-catch block syntax--
Begin try
     { Any Set of SQL Statements }
End try
Begin Catch
     [ Optional: Any Set of SQL Statements ]
End Catch
    [Optional: Any other sql statements ]

