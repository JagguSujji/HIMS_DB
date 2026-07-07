


/***********************************************************
 Revenue By Service
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Revenue_ByService_Report]
AS
BEGIN

SELECT

ServiceName,
SUM(Amount) Revenue

FROM InvoiceLineItem

GROUP BY ServiceName;


END
