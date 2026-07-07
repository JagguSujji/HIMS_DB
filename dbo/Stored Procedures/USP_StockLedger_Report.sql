


CREATE     PROCEDURE [dbo].[USP_StockLedger_Report]
AS
BEGIN

SELECT

I.ItemName,
SUM(S.Quantity) CurrentStock

FROM StockLedger S

INNER JOIN Item I

ON S.ItemId=I.ItemId

GROUP BY I.ItemName;

END
