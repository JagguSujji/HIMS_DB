


CREATE     PROCEDURE [dbo].[USP_InventoryItem_GetAll]
AS
BEGIN

SELECT *
FROM InventoryItemMaster
WHERE IsActive=1;

END
