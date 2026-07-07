CREATE     PROCEDURE [dbo].[USP_Drug_GetStock]

(
 @DrugId BIGINT
)

AS
BEGIN


SELECT

BatchId,
DrugId,
BatchNumber,
ExpiryDate,
Quantity


FROM dbo.DrugStockBatch


WHERE

DrugId=@DrugId

AND Quantity > 0


ORDER BY

ExpiryDate;


END
