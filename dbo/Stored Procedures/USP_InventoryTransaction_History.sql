


CREATE     PROCEDURE [dbo].[USP_InventoryTransaction_History]
(
 @ItemId INT
)
AS
BEGIN

SELECT *

FROM InventoryTransaction

WHERE ItemId=@ItemId

ORDER BY TransactionDate DESC;

END
