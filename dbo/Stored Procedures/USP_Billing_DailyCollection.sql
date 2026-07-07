


/***********************************************************
 Daily Collection Report
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Billing_DailyCollection]
(
 @Date DATE
)
AS
BEGIN

SELECT

CAST(PaymentDate AS DATE) CollectionDate,
SUM(Amount) TotalCollection

FROM Payment

WHERE CAST(PaymentDate AS DATE)=@Date

GROUP BY CAST(PaymentDate AS DATE);

END
