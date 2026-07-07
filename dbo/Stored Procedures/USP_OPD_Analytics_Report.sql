



/***************************************************************
 OPD ANALYTICS
****************************************************************/


CREATE     PROCEDURE [dbo].[USP_OPD_Analytics_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

CAST(VisitDate AS DATE) VisitDate,

COUNT(*) TotalVisits,

COUNT(DISTINCT DoctorId) Doctors,

COUNT(DISTINCT DepartmentId) Departments


FROM Visit

WHERE VisitDate BETWEEN @FromDate AND @ToDate

GROUP BY CAST(VisitDate AS DATE)

ORDER BY VisitDate


END
