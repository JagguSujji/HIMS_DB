


/***********************************************************
 Employee Attendance
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_EmployeeAttendance_Save]
(
 @EmployeeId INT,
 @AttendanceDate DATE,
 @ShiftTypeId INT,
 @AttendanceStatusId INT,
 @CheckInTime TIME,
 @CheckOutTime TIME,
 @WorkedHours DECIMAL(5,2)
)
AS
BEGIN

INSERT INTO EmployeeAttendance
(
 EmployeeId,
 AttendanceDate,
 ShiftTypeId,
 AttendanceStatusId,
 CheckInTime,
 CheckOutTime,
 WorkedHours,
 CreatedOn
)

VALUES
(
 @EmployeeId,
 @AttendanceDate,
 @ShiftTypeId,
 @AttendanceStatusId,
 @CheckInTime,
 @CheckOutTime,
 @WorkedHours,
 GETDATE()
)

END
