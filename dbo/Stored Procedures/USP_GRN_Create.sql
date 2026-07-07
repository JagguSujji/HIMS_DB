


/***********************************************************
 Goods Receipt Note
 Table GoodsReceipt
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_GRN_Create]
(
 @PurchaseOrderId INT,
 @ReceivedDate DATE
)
AS
BEGIN

INSERT INTO GoodsReceipt
(
 PurchaseOrderId,
 ReceivedDate
)
VALUES
(
 @PurchaseOrderId,
 @ReceivedDate
)

SELECT SCOPE_IDENTITY() GRNId;

END
