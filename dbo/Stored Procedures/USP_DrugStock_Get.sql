CREATE     PROCEDURE [dbo].[USP_DrugStock_Get]


(
 @DrugId BIGINT

)

AS
BEGIN


SELECT


DrugId,

SUM(Quantity) AvailableQuantity


FROM dbo.DrugStockBatch


WHERE


DrugId=@DrugId


AND ExpiryDate>=GETDATE()



GROUP BY DrugId;



END
