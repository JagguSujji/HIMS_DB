


/***********************************************************
 Inventory Dashboard
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_Inventory_Dashboard]
AS
BEGIN


SELECT

(SELECT COUNT(*)
FROM InventoryItemMaster)
TotalItems,


(SELECT COUNT(*)
FROM InventoryTransaction)
TotalTransactions,


(SELECT COUNT(*)
FROM DrugStockBatch
WHERE ExpiryDate < GETDATE())
ExpiredBatches,


(SELECT SUM(Quantity)
FROM StockLedger)
TotalStock;


END
