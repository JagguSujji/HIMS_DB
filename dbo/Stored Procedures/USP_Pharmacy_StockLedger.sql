CREATE     PROCEDURE [dbo].[USP_Pharmacy_StockLedger]


(
 @DrugId BIGINT=NULL

)

AS
BEGIN


SELECT


DIM.MovementDate,

D.DrugName,

DIM.MovementType,

DIM.Quantity


FROM dbo.DrugInventoryMovement DIM


INNER JOIN dbo.Drug D

ON DIM.DrugId=D.DrugId



WHERE


(
@DrugId IS NULL

OR DIM.DrugId=@DrugId
)



ORDER BY

DIM.MovementDate DESC;



END
