


-------------------------------------------------------------
-- 4. Check Doctor Availability
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Appointment_CheckAvailability]
(
 @DoctorId INT,
 @AppointmentDate DATE
)
AS
BEGIN

SET NOCOUNT ON;


SELECT

S.SlotId,
S.StartTime,
S.EndTime,
S.Capacity,
S.BookedCount,

CASE 
WHEN S.Capacity>S.BookedCount
THEN 1 ELSE 0 END Available


FROM dbo.AppointmentSlot S

WHERE
S.DoctorId=@DoctorId
AND
CAST(S.SlotDate AS DATE)=@AppointmentDate
AND
S.IsBlocked=0;


END
