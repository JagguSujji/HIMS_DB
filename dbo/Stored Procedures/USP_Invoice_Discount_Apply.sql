CREATE     PROCEDURE [dbo].[USP_Invoice_Discount_Apply]


(
 @InvoiceId BIGINT,

 @DiscountAmount DECIMAL(18,2)

)

AS
BEGIN


UPDATE dbo.InvoiceHeader


SET


DiscountAmount=@DiscountAmount


--,BalanceAmount=

--TotalAmount
---
--@DiscountAmount
---
--PaidAmount



WHERE InvoiceId=@InvoiceId;



END
