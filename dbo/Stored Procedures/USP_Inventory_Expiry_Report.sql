


/***********************************************************
 Expiry Report
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_Inventory_Expiry_Report]
(
 @Days INT
)
AS
BEGIN


SELECT *

FROM DrugStockBatch

WHERE ExpiryDate <= DATEADD(DAY,@Days,GETDATE());

END
