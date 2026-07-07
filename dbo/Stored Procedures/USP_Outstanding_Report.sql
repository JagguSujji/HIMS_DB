


/***********************************************************
 Outstanding Report
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Outstanding_Report]
AS
BEGIN

SELECT

P.PatientId,
P.FirstName+' '+P.LastName PatientName,

SUM(I.TotalAmount) TotalBill,

SUM(I.PaidAmount) PaidAmount,

SUM(I.BalanceAmount) Outstanding

FROM InvoiceHeader I

INNER JOIN Patient P
ON I.PatientId=P.PatientId

GROUP BY
P.PatientId,
P.FirstName,
P.LastName

HAVING SUM(I.BalanceAmount)>0;


END
