


/***********************************************************
 Revenue By Department
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Revenue_ByDepartment_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

D.DepartmentName,

SUM(I.TotalAmount) Revenue


FROM InvoiceHeader I

INNER JOIN Visit V
ON I.VisitId=V.VisitId

INNER JOIN Department D
ON V.DepartmentId=D.DepartmentId


WHERE I.CreatedOn BETWEEN @FromDate AND @ToDate


GROUP BY D.DepartmentName;


END
