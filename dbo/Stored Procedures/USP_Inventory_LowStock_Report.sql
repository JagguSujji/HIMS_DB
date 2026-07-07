


/***********************************************************
 Low Stock Report
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_Inventory_LowStock_Report]
(
 @MinimumQty DECIMAL(18,2)
)
AS
BEGIN


SELECT

I.ItemId,
I.ItemName,
SUM(S.Quantity) Stock

FROM StockLedger S

INNER JOIN InventoryItemMaster I

ON S.ItemId=I.ItemId

GROUP BY
I.ItemId,
I.ItemName

HAVING SUM(S.Quantity) <= @MinimumQty;


END
