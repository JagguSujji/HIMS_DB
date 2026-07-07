


/*******************************************************
 15. Drug Stock Check
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_DrugStock_Check]
(
 @DrugId INT
)
AS
BEGIN


SELECT

DrugId,
SUM(Quantity) AvailableQuantity

FROM dbo.DrugStockBatch

WHERE DrugId=@DrugId

GROUP BY DrugId;


END
