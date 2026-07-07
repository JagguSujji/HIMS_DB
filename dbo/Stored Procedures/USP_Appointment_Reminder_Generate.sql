CREATE     PROCEDURE [dbo].[USP_Appointment_Reminder_Generate]


AS
BEGIN


INSERT INTO PatientNotification
(
 PatientId,
 Message,
 IsRead,
 CreatedOn
)


SELECT


A.PatientId,


'Reminder: Your appointment is scheduled tomorrow.',


0,


GETDATE()



FROM Appointment A



WHERE


CAST(A.AppointmentDate AS DATE)

=
DATEADD(DAY,1,CAST(GETDATE() AS DATE));



END
