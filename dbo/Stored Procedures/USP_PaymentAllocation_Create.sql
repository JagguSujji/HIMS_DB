


/***********************************************************
 Allocate Payment Against Invoice
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_PaymentAllocation_Create]
(
 @PaymentId INT,
 @InvoiceId INT,
 @AllocatedAmount DECIMAL(18,2)
)
AS
BEGIN

INSERT INTO PaymentAllocation
(
 PaymentId,
 InvoiceId,
 AllocatedAmount,
 CreatedOn
)
VALUES
(
 @PaymentId,
 @InvoiceId,
 @AllocatedAmount,
 GETDATE()
)


UPDATE InvoiceHeader
SET PaidAmount =
ISNULL(PaidAmount,0)+@AllocatedAmount
--,BalanceAmount =
--TotalAmount-
--(ISNULL(PaidAmount,0)+@AllocatedAmount)
WHERE InvoiceId=@InvoiceId


END
