


/***********************************************************
 Invoice Payment Allocation History
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_PaymentAllocation_GetByInvoice]
(
 @InvoiceId INT
)
AS
BEGIN

SELECT *
FROM PaymentAllocation
WHERE InvoiceId=@InvoiceId;

END
