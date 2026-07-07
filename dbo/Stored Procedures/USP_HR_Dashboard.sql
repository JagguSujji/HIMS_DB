


/***********************************************************
 HR Dashboard
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_HR_Dashboard]
AS
BEGIN


SELECT

(SELECT COUNT(*) FROM Employee WHERE IsActive=1)
ActiveEmployees,


(SELECT COUNT(*) FROM EmployeeLeave WHERE LeaveStatus='PENDING')
PendingLeaves,


(SELECT COUNT(*) FROM EmployeeAttendance 
WHERE AttendanceDate=CAST(GETDATE() AS DATE))
TodayAttendance;


END
