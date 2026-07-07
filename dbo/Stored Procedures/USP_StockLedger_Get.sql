


/***********************************************************
 Stock Ledger
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_StockLedger_Get]
(
 @ItemId INT
)
AS
BEGIN

SELECT *

FROM StockLedger

WHERE ItemId=@ItemId

ORDER BY TransactionDate DESC;

END
