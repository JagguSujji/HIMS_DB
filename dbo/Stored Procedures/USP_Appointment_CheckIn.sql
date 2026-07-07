


-------------------------------------------------------------
-- 19. Appointment Check In
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Appointment_CheckIn]
(
 @AppointmentId INT
)
AS
BEGIN


UPDATE dbo.Appointment
SET AppointmentStatusId =
(
SELECT AppointmentStatusId
FROM dbo.AppointmentStatus
WHERE StatusCode='CHECKIN'
)

WHERE AppointmentId=@AppointmentId;


END
