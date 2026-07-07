CREATE     PROCEDURE [dbo].[USP_Billing_Outstanding]


AS
BEGIN


SELECT

P.UHID,
P.FirstName,

I.InvoiceId,
I.TotalAmount,
I.PaidAmount,
I.BalanceAmount


FROM dbo.InvoiceHeader I


INNER JOIN dbo.Patient P

ON I.PatientId=P.PatientId


WHERE

I.BalanceAmount>0;


END
