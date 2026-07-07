


CREATE     PROCEDURE [dbo].[USP_PurchaseOrder_GetById]
(
 @PurchaseOrderId INT
)
AS
BEGIN

SELECT *

FROM PurchaseOrder

WHERE PurchaseOrderId=@PurchaseOrderId;

END
