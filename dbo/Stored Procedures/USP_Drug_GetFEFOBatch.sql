


/*******************************************************
 14. Get FEFO Batch
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Drug_GetFEFOBatch]
(
 @DrugId INT
)
AS
BEGIN


SELECT TOP 1

BatchId,
DrugId,
BatchNumber,
ExpiryDate,
Quantity

FROM dbo.DrugStockBatch

WHERE
DrugId=@DrugId
AND Quantity>0

ORDER BY ExpiryDate ASC;


END
