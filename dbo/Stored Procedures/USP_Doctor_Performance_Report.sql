CREATE     PROCEDURE [dbo].[USP_Doctor_Performance_Report]

(
 @FromDate DATE,

 @ToDate DATE
)

AS
BEGIN


SELECT


E.FirstName+' '+E.LastName DoctorName,


COUNT(V.VisitId) TotalConsultations


FROM Visit V


INNER JOIN Employee E

ON V.DoctorId=E.EmployeeId


WHERE


CAST(V.VisitDate AS DATE)
BETWEEN @FromDate AND @ToDate


GROUP BY

E.FirstName,

E.LastName;



END
