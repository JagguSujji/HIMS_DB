CREATE     PROCEDURE [dbo].[USP_DrugStock_Adjust]

(
 @DrugId BIGINT,
 @BatchNumber VARCHAR(100),
 @ExpiryDate DATE,
 @Quantity INT
)

AS
BEGIN


IF EXISTS
(
SELECT 1

FROM dbo.DrugStockBatch

WHERE DrugId=@DrugId

AND BatchNumber=@BatchNumber
)


BEGIN


UPDATE dbo.DrugStockBatch

SET

Quantity=Quantity+@Quantity


WHERE

DrugId=@DrugId

AND BatchNumber=@BatchNumber;


END


ELSE


BEGIN


INSERT INTO dbo.DrugStockBatch

(
DrugId,
BatchNumber,
ExpiryDate,
Quantity
)

VALUES

(
@DrugId,
@BatchNumber,
@ExpiryDate,
@Quantity
);


END


END
