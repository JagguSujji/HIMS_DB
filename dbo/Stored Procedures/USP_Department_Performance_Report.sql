CREATE     PROCEDURE [dbo].[USP_Department_Performance_Report]


(
 @FromDate DATE,

 @ToDate DATE
)

AS
BEGIN


SELECT


D.DepartmentName,


COUNT(V.VisitId) Patients


FROM Visit V


INNER JOIN Department D

ON V.DepartmentId=D.DepartmentId



WHERE

CAST(V.VisitDate AS DATE)

BETWEEN @FromDate AND @ToDate



GROUP BY

D.DepartmentName;



END
