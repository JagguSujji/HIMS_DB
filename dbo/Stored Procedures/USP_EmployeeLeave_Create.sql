


/***********************************************************
 Employee Leave
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_EmployeeLeave_Create]
(
 @EmployeeId INT,
 @LeaveTypeId INT,
 @FromDate DATE,
 @ToDate DATE,
 @LeaveReason VARCHAR(500)
)
AS
BEGIN

INSERT INTO EmployeeLeave
(
 EmployeeId,
 LeaveTypeId,
 FromDate,
 ToDate,
 TotalDays,
 LeaveReason,
 LeaveStatus,
 CreatedOn
)

VALUES
(
 @EmployeeId,
 @LeaveTypeId,
 @FromDate,
 @ToDate,
 DATEDIFF(DAY,@FromDate,@ToDate)+1,
 @LeaveReason,
 'PENDING',
 GETDATE()
)

END
