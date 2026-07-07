



CREATE     PROCEDURE [dbo].[USP_Payment_Mode_Analysis]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

PM.PaymentModeName,

COUNT(P.PaymentId) Transactions,

SUM(P.Amount) Amount


FROM Payment P

INNER JOIN PaymentMode PM
ON PM.PaymentModeId=P.PaymentModeId


WHERE PaymentDate BETWEEN @FromDate AND @ToDate


GROUP BY PM.PaymentModeName


END
