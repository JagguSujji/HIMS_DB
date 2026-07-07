CREATE     PROCEDURE [dbo].[USP_Appointment_Dashboard]


AS
BEGIN


SELECT


(
SELECT COUNT(*)

FROM Appointment

WHERE CAST(AppointmentDate AS DATE)=CAST(GETDATE() AS DATE)

)

TodaysAppointments,



(
SELECT COUNT(*)

FROM AppointmentSlot

WHERE IsBooked=0

)

AvailableSlots,



(
SELECT COUNT(*)

FROM Appointment

WHERE AppointmentStatusId=1

)

ConfirmedAppointments;



END
