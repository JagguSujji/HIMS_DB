


/***********************************************************
 Patient Outstanding
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Patient_Outstanding]
(
 @PatientId INT
)
AS
BEGIN

SELECT
PatientId,
SUM(BalanceAmount) OutstandingAmount
FROM InvoiceHeader
WHERE PatientId=@PatientId
GROUP BY PatientId;

END
