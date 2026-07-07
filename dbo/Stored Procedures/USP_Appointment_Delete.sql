


CREATE     PROCEDURE [dbo].[USP_Appointment_Delete]
(
 @AppointmentId BIGINT
)
AS
BEGIN

DELETE FROM dbo.Appointment
WHERE AppointmentId=@AppointmentId;

END
