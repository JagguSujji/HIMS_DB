


/***********************************************************
 Inventory Transaction
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_InventoryTransaction_Create]
(
 @ItemId INT,
 @StoreId INT,
 @BatchId INT,
 @TransactionType VARCHAR(50),
 @Quantity DECIMAL(18,2),
 @ReferenceType VARCHAR(50),
 @ReferenceId INT
)
AS
BEGIN


INSERT INTO InventoryTransaction
(
 ItemId,
 StoreId,
 BatchId,
 TransactionType,
 Quantity,
 ReferenceType,
 ReferenceId,
 TransactionDate
)

VALUES
(
 @ItemId,
 @StoreId,
 @BatchId,
 @TransactionType,
 @Quantity,
 @ReferenceType,
 @ReferenceId,
 GETDATE()
)


END
