


/***********************************************************
 Billing Dashboard
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Billing_Dashboard]
AS
BEGIN


SELECT

(SELECT COUNT(*) FROM InvoiceHeader)
TotalInvoices,


(SELECT SUM(TotalAmount)
FROM InvoiceHeader)
TotalRevenue,


(SELECT SUM(PaidAmount)
FROM InvoiceHeader)
Collected,


(SELECT SUM(BalanceAmount)
FROM InvoiceHeader)
Outstanding;


END
