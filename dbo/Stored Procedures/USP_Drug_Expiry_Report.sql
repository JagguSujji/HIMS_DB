CREATE     PROCEDURE [dbo].[USP_Drug_Expiry_Report]


(
 @Days INT=90

)

AS
BEGIN


SELECT


D.DrugName,

B.BatchNumber,

B.ExpiryDate,

B.Quantity



FROM DrugStockBatch B


INNER JOIN Drug D

ON B.DrugId=D.DrugId



WHERE


B.ExpiryDate <= DATEADD(DAY,@Days,GETDATE())



ORDER BY

B.ExpiryDate;



END
