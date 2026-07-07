


--------------------------------------------------------------
-- APPOINTMENT MODULE
--------------------------------------------------------------


CREATE     PROCEDURE [dbo].[USP_Appointment_GetByDate]
(
 @AppointmentDate DATE
)
AS
BEGIN

SELECT *
FROM dbo.Appointment
WHERE CAST(AppointmentDate AS DATE)=@AppointmentDate;

END
