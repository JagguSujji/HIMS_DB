


-------------------------------------------------------------
-- 14. Doctor Leave Save
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_DoctorLeave_Save]
(
 @DoctorId INT,
 @FromDate DATE,
 @ToDate DATE,
 @Reason VARCHAR(500)
)
AS
BEGIN

INSERT INTO dbo.DoctorLeave
(
DoctorId,
FromDate,
ToDate,
Reason,
IsApproved,
CreatedOn
)
VALUES
(
@DoctorId,
@FromDate,
@ToDate,
@Reason,
0,
GETDATE()
);


SELECT SCOPE_IDENTITY() LeaveId;

END
