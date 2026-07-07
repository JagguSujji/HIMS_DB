CREATE     PROCEDURE [dbo].[USP_Appointment_Reschedule]


(
 @AppointmentId BIGINT,

 @NewSlotId BIGINT

)

AS
BEGIN


DECLARE @OldSlotId BIGINT;



SELECT

@OldSlotId=SlotId

FROM dbo.AppointmentSlot


WHERE

AppointmentId=@AppointmentId;



UPDATE dbo.AppointmentSlot

SET

IsBooked=0


WHERE SlotId=@OldSlotId;



UPDATE dbo.Appointment

SET

AppointmentDate=

(
SELECT SlotDate
FROM AppointmentSlot
WHERE SlotId=@NewSlotId
)


WHERE AppointmentId=@AppointmentId;



UPDATE dbo.AppointmentSlot

SET

IsBooked=1


WHERE SlotId=@NewSlotId;



END
