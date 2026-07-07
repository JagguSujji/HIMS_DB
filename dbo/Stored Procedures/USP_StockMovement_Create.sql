


/***********************************************************
 Stock Movement
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_StockMovement_Create]
(
 @ItemId INT,
 @Quantity DECIMAL(18,2),
 @MovementType VARCHAR(50),
 @ReferenceType VARCHAR(50),
 @ReferenceId INT
)
AS
BEGIN


INSERT INTO StockMovement
(
 ItemId,
 Quantity,
 MovementType,
 ReferenceType,
 ReferenceId,
 MovementDate
)

VALUES
(
 @ItemId,
 @Quantity,
 @MovementType,
 @ReferenceType,
 @ReferenceId,
 GETDATE()
)

END
