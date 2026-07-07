


CREATE     PROCEDURE [dbo].[USP_InventoryItem_Update]
(
 @ItemId INT,
 @ItemName VARCHAR(200),
 @UnitId INT
)
AS
BEGIN

UPDATE InventoryItemMaster

SET
ItemName=@ItemName,
UnitId=@UnitId

WHERE ItemId=@ItemId;

END
