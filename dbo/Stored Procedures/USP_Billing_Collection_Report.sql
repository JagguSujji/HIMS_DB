


/***********************************************************
 Collection Report
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Billing_Collection_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN

SELECT

PaymentDate,
SUM(Amount) Collection

FROM Payment

WHERE PaymentDate BETWEEN @FromDate AND @ToDate

GROUP BY PaymentDate;

END
