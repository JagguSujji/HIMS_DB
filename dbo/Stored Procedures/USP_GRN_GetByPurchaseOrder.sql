


CREATE     PROCEDURE [dbo].[USP_GRN_GetByPurchaseOrder]
(
 @PurchaseOrderId INT
)
AS
BEGIN

SELECT *

FROM GoodsReceipt

WHERE PurchaseOrderId=@PurchaseOrderId;

END
