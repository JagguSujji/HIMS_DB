


/***********************************************************
 Insurance AR Report
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Insurance_AR_Report]
AS
BEGIN


SELECT

SUM(BalanceAmount) InsuranceOutstanding

FROM InvoiceHeader

WHERE InsuranceAmount>0;


END
