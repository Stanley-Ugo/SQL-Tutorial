--SUBQUERIES IN SQL SERVER--
Select * from tblProduct
Select * from tblProductSales

--Queries present inside the parentesis is caleed the sub query--
Select Id, Name, [Description]
from tblProducts
Where Id NOT IN (Select distinct ProductId from tblProductSales)

--Within a select query--
--Also a Correlated Sub query--
Select Name,
(Select SUM(QuantitySold) from tblProductSales where ProductId = tblProduct.ProductId) as QtySold
from tblProduct
order by Name

