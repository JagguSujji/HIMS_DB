CREATE     PROCEDURE [dbo].[USP_Revenue_Report]


(
 @FromDate DATE,

 @ToDate DATE

)

AS
BEGIN


SELECT


SUM(TotalAmount) TotalRevenue,


SUM(PaidAmount) CollectedAmount,


SUM(BalanceAmount) OutstandingAmount



FROM InvoiceHeader


WHERE


CAST(CreatedOn AS DATE)

BETWEEN @FromDate AND @ToDate;



END
