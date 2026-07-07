


/*******************************************************
 13. Drug Batch Create
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_DrugStockBatch_Create]
(
 @DrugId INT,
 @BatchNumber VARCHAR(100),
 @ExpiryDate DATE,
 @Quantity INT
)
AS
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
