


CREATE     PROCEDURE [dbo].[USP_AppointmentSlot_Update]
(
 @SlotId BIGINT,
 @StartTime TIME,
 @EndTime TIME
)
AS
BEGIN

UPDATE dbo.AppointmentSlot
SET
StartTime=@StartTime,
EndTime=@EndTime
WHERE SlotId=@SlotId;

END
