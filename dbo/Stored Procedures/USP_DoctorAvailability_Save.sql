


-------------------------------------------------------------
-- 12. Doctor Availability Save
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_DoctorAvailability_Save]
(
 @AvailabilityId INT=NULL,
 @DoctorId INT,
 @BranchId INT,
 @DepartmentId INT,
 @WeekdayId INT,
 @StartTime TIME,
 @EndTime TIME,
 @SlotDurationMinutes INT
)
AS
BEGIN


IF EXISTS
(
SELECT 1 FROM dbo.DoctorAvailability
WHERE AvailabilityId=@AvailabilityId
)
BEGIN

UPDATE dbo.DoctorAvailability
SET
StartTime=@StartTime,
EndTime=@EndTime,
SlotDurationMinutes=@SlotDurationMinutes

WHERE AvailabilityId=@AvailabilityId;

END
ELSE
BEGIN

INSERT INTO dbo.DoctorAvailability
(
DoctorId,
BranchId,
DepartmentId,
WeekdayId,
StartTime,
EndTime,
SlotDurationMinutes,
IsActive,
CreatedOn
)
VALUES
(
@DoctorId,
@BranchId,
@DepartmentId,
@WeekdayId,
@StartTime,
@EndTime,
@SlotDurationMinutes,
1,
GETDATE()
);


SET @AvailabilityId=SCOPE_IDENTITY();

END


SELECT @AvailabilityId AvailabilityId;

END
