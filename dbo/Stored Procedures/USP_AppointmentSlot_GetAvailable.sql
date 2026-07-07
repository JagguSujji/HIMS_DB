CREATE     PROCEDURE [dbo].[USP_AppointmentSlot_GetAvailable]

(
 @DoctorId BIGINT,
 @AppointmentDate DATE
)

AS
BEGIN


SELECT

SlotId,
DoctorId,
SlotDate,
StartTime,
EndTime


FROM dbo.AppointmentSlot


WHERE

DoctorId=@DoctorId

AND SlotDate=@AppointmentDate

AND IsBooked=0


ORDER BY StartTime;


END
