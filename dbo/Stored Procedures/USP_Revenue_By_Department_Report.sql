



CREATE     PROCEDURE [dbo].[USP_Revenue_By_Department_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

D.DepartmentName,

SUM(I.Amount) Revenue


FROM InvoiceLineItem I

INNER JOIN InvoiceHeader H
ON H.InvoiceId=I.InvoiceId

INNER JOIN Encounter E
ON E.EncounterId=H.VisitId

INNER JOIN Department D
ON D.DepartmentId=E.ProviderId


WHERE H.CreatedOn BETWEEN @FromDate AND @ToDate


GROUP BY D.DepartmentName


END
