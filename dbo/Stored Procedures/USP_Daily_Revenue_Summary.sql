



/***************************************************************
 FINANCE ANALYTICS
****************************************************************/


CREATE     PROCEDURE [dbo].[USP_Daily_Revenue_Summary]
(
 @Date DATE
)
AS
BEGIN


SELECT


SUM(TotalAmount) GrossAmount,

SUM(PaidAmount) CollectedAmount,

SUM(BalanceAmount) OutstandingAmount


FROM InvoiceHeader


WHERE CAST(CreatedOn AS DATE)=@Date


END
