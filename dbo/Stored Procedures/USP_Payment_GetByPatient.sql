


/***********************************************************
 Patient Payment History
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Payment_GetByPatient]
(
 @PatientId INT
)
AS
BEGIN

SELECT
P.PaymentId,
P.PaymentDate,
P.Amount,
PM.PaymentModeName,
P.TransactionReference
FROM Payment P
INNER JOIN Bill B
ON P.BillId=B.BillId
LEFT JOIN PaymentMode PM
ON P.PaymentModeId=PM.PaymentModeId
WHERE B.PatientId=@PatientId
ORDER BY P.PaymentDate DESC;

END
