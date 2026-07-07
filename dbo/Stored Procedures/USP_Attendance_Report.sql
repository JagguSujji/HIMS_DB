


CREATE     PROCEDURE [dbo].[USP_Attendance_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN

SELECT

E.EmployeeId,
E.FirstName+' '+E.LastName EmployeeName,
COUNT(*) TotalDays,
SUM(CASE WHEN A.AttendanceStatusId=1 THEN 1 ELSE 0 END) PresentDays

FROM EmployeeAttendance A

INNER JOIN Employee E

ON A.EmployeeId=E.EmployeeId

WHERE AttendanceDate BETWEEN @FromDate AND @ToDate

GROUP BY
E.EmployeeId,
E.FirstName,
E.LastName;

END
