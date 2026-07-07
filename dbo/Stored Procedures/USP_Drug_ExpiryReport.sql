CREATE     PROCEDURE [dbo].[USP_Drug_ExpiryReport]


(
 @Days INT=90
)

AS
BEGIN


SELECT


DrugId,

BatchNumber,

ExpiryDate,

Quantity


FROM dbo.DrugStockBatch


WHERE

ExpiryDate <= DATEADD(DAY,@Days,GETDATE())

AND Quantity>0;



END
