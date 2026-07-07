CREATE     PROCEDURE [dbo].[USP_Billing_Workflow_Dashboard]


AS
BEGIN


SELECT


Status,

COUNT(*) TotalInvoices


FROM InvoiceHeader


GROUP BY Status;



END
