CREATE     PROCEDURE [dbo].[USP_DrugBatch_Get]


(
 @DrugId BIGINT
)

AS
BEGIN


SELECT


BatchId,

BatchNumber,

ExpiryDate,

Quantity


FROM dbo.DrugStockBatch


WHERE

DrugId=@DrugId


AND Quantity>0


ORDER BY ExpiryDate;



END
