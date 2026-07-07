CREATE     PROCEDURE [dbo].[USP_Payment_Allocate]


(
 @PaymentId BIGINT,
 @InvoiceId BIGINT,
 @Amount DECIMAL(18,2)
)

AS
BEGIN


INSERT INTO dbo.PaymentAllocation

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
@Amount,
GETDATE()
);



UPDATE dbo.InvoiceHeader

SET

PaidAmount=

ISNULL(PaidAmount,0)+@Amount


--,BalanceAmount=

--TotalAmount-
--(ISNULL(PaidAmount,0)+@Amount)


WHERE InvoiceId=@InvoiceId;



END
