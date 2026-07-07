


CREATE     PROCEDURE [dbo].[USP_EmployeeAttendance_Get]
(
 @EmployeeId INT,
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN

SELECT *

FROM EmployeeAttendance

WHERE EmployeeId=@EmployeeId
AND AttendanceDate BETWEEN @FromDate AND @ToDate

ORDER BY AttendanceDate DESC;

END
