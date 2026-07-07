


/***********************************************************
 Revenue Trend
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Revenue_Trend_Report]
(
 @Year INT
)
AS
BEGIN


SELECT

MONTH(CreatedOn) MonthNo,
SUM(TotalAmount) Revenue

FROM InvoiceHeader

WHERE YEAR(CreatedOn)=@Year

GROUP BY MONTH(CreatedOn)

ORDER BY MonthNo;


END
