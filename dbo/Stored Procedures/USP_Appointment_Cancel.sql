CREATE     PROCEDURE [dbo].[USP_Appointment_Cancel]


(
 @AppointmentId BIGINT
)

AS
BEGIN


DECLARE @SlotId BIGINT;



SELECT

@SlotId=APS.SlotId

FROM dbo.AppointmentSlot APS

INNER JOIN dbo.Appointment A

ON APS.DoctorId=A.DoctorId

AND APS.SlotDate=A.AppointmentDate


WHERE

A.AppointmentId=@AppointmentId;



UPDATE dbo.Appointment

SET

AppointmentStatusId=3


WHERE AppointmentId=@AppointmentId;



UPDATE dbo.AppointmentSlot

SET

IsBooked=0


WHERE SlotId=@SlotId;



END
