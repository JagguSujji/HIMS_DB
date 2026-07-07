


/*******************************************************
 16. Drug Inventory Movement
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_DrugInventory_Movement_Save]
(
 @DrugId INT,
 @BatchId INT,
 @MovementType VARCHAR(50),
 @Quantity INT,
 @ReferenceId INT
)
AS
BEGIN


INSERT INTO dbo.DrugInventoryMovement
(
 DrugId,
 BatchId,
 MovementType,
 Quantity,
 ReferenceId,
 MovementDate
)
VALUES
(
 @DrugId,
 @BatchId,
 @MovementType,
 @Quantity,
 @ReferenceId,
 GETDATE()
);


END
