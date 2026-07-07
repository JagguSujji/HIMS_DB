


-------------------------------------------------------------
-- 18. No Show Update
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Appointment_NoShow_Update]
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
WHERE StatusCode='NO_SHOW'
)

WHERE AppointmentId=@AppointmentId;


END
