


CREATE     PROCEDURE [dbo].[USP_PurchaseOrder_GetAll]
AS
BEGIN

SELECT *
FROM PurchaseOrder
ORDER BY OrderDate DESC;

END
