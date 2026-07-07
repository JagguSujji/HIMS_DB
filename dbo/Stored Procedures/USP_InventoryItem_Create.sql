/*==========================================================
 MODULE 10
 INVENTORY & SUPPLY CHAIN MANAGEMENT
 Missing Stored Procedures Only
==========================================================*/


/***********************************************************
 Item Master
 Table: InventoryItemMaster
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_InventoryItem_Create]
(
 @ItemCode VARCHAR(50),
 @ItemName VARCHAR(200),
 @ItemType INT,
 @UnitId INT
)
AS
BEGIN

INSERT INTO InventoryItemMaster
(
 ItemCode,
 ItemName,
 ItemType,
 UnitId,
 IsActive
)
VALUES
(
 @ItemCode,
 @ItemName,
 @ItemType,
 @UnitId,
 1
)

SELECT SCOPE_IDENTITY() ItemId;

END
