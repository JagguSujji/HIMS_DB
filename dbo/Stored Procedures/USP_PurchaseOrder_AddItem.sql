


CREATE     PROCEDURE [dbo].[USP_PurchaseOrder_AddItem]
(
 @OrderId INT,
 @ItemId INT,
 @Quantity DECIMAL(18,2),
 @Instructions VARCHAR(500)
)
AS
BEGIN


INSERT INTO OrderDetail
(
 OrderId,
 ItemId,
 Quantity,
 Instructions
)

VALUES
(
 @OrderId,
 @ItemId,
 @Quantity,
 @Instructions
)

END
