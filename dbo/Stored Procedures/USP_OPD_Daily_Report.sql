CREATE     PROCEDURE [dbo].[USP_OPD_Daily_Report]

(
 @ReportDate DATE=NULL
)

AS
BEGIN


SET @ReportDate=ISNULL(@ReportDate,CAST(GETDATE() AS DATE));


SELECT


D.DepartmentName,

COUNT(V.VisitId) TotalPatients


FROM Visit V


INNER JOIN Department D

ON V.DepartmentId=D.DepartmentId


WHERE

CAST(V.VisitDate AS DATE)=@ReportDate


GROUP BY

D.DepartmentName;


END
