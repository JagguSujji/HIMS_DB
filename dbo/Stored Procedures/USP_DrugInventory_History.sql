CREATE     PROCEDURE [dbo].[USP_DrugInventory_History]

(
 @DrugId BIGINT
)

AS
BEGIN


SELECT

MovementId,
MovementType,
Quantity,
ReferenceId,
MovementDate


FROM dbo.DrugInventoryMovement


WHERE DrugId=@DrugId


ORDER BY MovementDate DESC;


END
