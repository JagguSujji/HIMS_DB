


/***********************************************************
 Purchase Order
 Table PurchaseOrder
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_PurchaseOrder_Create]
(
 @VendorId INT,
 @OrderDate DATE
)
AS
BEGIN

INSERT INTO PurchaseOrder
(
 VendorId,
 OrderDate
)
VALUES
(
 @VendorId,
 @OrderDate
)

SELECT SCOPE_IDENTITY() PurchaseOrderId;

END
