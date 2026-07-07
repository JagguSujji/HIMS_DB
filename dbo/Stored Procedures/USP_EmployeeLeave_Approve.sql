


CREATE     PROCEDURE [dbo].[USP_EmployeeLeave_Approve]
(
 @EmployeeLeaveId INT,
 @ApprovedBy INT
)
AS
BEGIN

UPDATE EmployeeLeave

SET
LeaveStatus='APPROVED',
ApprovedBy=@ApprovedBy,
ApprovedOn=GETDATE()

WHERE EmployeeLeaveId=@EmployeeLeaveId;

END
